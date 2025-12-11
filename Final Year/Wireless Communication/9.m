clc; clear; close all;

% --- 1. System Parameters ---
num_bits = 64;          % Total data points
M = 4;                  % Modulation Order (QPSK = 4)
N_sub = 4;              % Number of Subcarriers
N_fft = 16;             % FFT/Block Size
cp_len = floor(0.1 * N_fft); % Length of Cyclic Prefix (Guard Interval)

% --- 2. Transmitter (Tx) ---
fprintf('--- TRANSMITTER ---\n');

% A. Source & Modulation
data = randsrc(1, num_bits, 0:M-1);      % Generate random symbols (0-3)
mod_data = pskmod(data, M, pi/4);        % QPSK Modulation

% B. Serial to Parallel (S/P)
% Pad data to ensure it fits perfectly into subcarrier blocks
rem_bits = mod(length(mod_data), N_sub);
if rem_bits ~= 0
    padding = zeros(1, N_sub - rem_bits);
    mod_data = [mod_data, padding];
end
parallel_data = reshape(mod_data, N_sub, []).'; % Reshape to [Blocks x Subcarriers]

% C. IFFT (Frequency -> Time Domain)
% We perform IFFT on rows (each row is a time block)
% Note: Usually we resize to N_fft, placing data on subcarriers
ifft_data = ifft(parallel_data, N_fft, 2); 

% D. Add Cyclic Prefix (CP)
% Take the last 'cp_len' samples and append them to the front
cp_data = [ifft_data(:, end-cp_len+1:end), ifft_data];

% E. Parallel to Serial (P/S)
tx_signal = reshape(cp_data.', 1, []);   % Transmit Stream

% --- 3. Channel ---
% Adding minimal noise for realism
rx_signal = awgn(tx_signal, 30, 'measured'); 

% --- 4. Receiver (Rx) ---
fprintf('--- RECEIVER ---\n');

% A. Serial to Parallel
rx_parallel = reshape(rx_signal, N_fft + cp_len, []).';

% B. Remove Cyclic Prefix
rx_no_cp = rx_parallel(:, cp_len+1:end);

% C. FFT (Time -> Frequency Domain)
fft_data = fft(rx_no_cp, N_fft, 2);

% D. Data Extraction & Demodulation
% Extract only the data subcarriers (first N_sub columns)
rx_symbols_extracted = fft_data(:, 1:N_sub);
rx_serial = reshape(rx_symbols_extracted.', 1, []);

% Demodulation
demod_data = pskdemod(rx_serial, M, pi/4);
demod_data = demod_data(1:num_bits); % Remove any padding

% --- 5. Output & Plotting ---
fprintf('Transmission Complete.\n');
fprintf('Bit Error Rate: %.4f\n', mean(data ~= demod_data));

figure;
subplot(3,1,1); stem(data(1:20), 'filled'); 
title('Original Data (First 20 symbols)'); grid on;
subplot(3,1,2); plot(real(tx_signal)); 
title('Transmitted OFDM Signal (Time Domain)'); grid on; xlabel('Sample');
subplot(3,1,3); stem(demod_data(1:20), 'filled'); 
title('Received Demodulated Data'); grid on;

% Visualize Subcarriers (Orthogonality check)
figure;
hold on;
colors = {'r', 'g', 'b', 'k'};
t_idx = 1:N_fft;
for i = 1:min(N_sub, 4)
    plot(abs(ifft_data(1, :)), 'DisplayName', ['Subcarrier ' num2str(i)]);
end
title('Magnitude of IFFT output (One Symbol)');
legend; grid on;

% --- OFDM RECEIVER ---
fprintf('\n--- RECEIVER START ---\n');

% 1. Serial to Parallel (Reshape)
% Reshape the long serial signal back into parallel blocks
rx_parallel = reshape(ofdm_signal, rows_Append_prefix, cols_Append_prefix);

% 2. Remove Cyclic Prefix (CP)
% We discard the first 'cp_len' rows (the "bumper")
rx_no_cp = rx_parallel(cp_len+1:end, :);

% Visualize CP Removal
figure;
subplot(2,1,1); plot(real(rx_parallel(:,1)), 'r'); title('Subcarrier 1 (With CP)'); grid on;
subplot(2,1,2); plot(real(rx_no_cp(:,1)), 'b'); title('Subcarrier 1 (CP Removed)'); grid on;

% 3. FFT (Time Domain -> Frequency Domain)
% MATLAB can calculate FFT for all 4 columns instantly (Vectorized)
fft_data = fft(rx_no_cp, 16); 

% Plotting FFT results (Vectorized Plotting)
figure;
colors = {'r', 'c', 'b', 'g'};
for i = 1:4
    subplot(4, 1, i);
    plot(real(fft_data(:, i)), colors{i});
    grid on;
    title(['FFT of Subcarrier ', num2str(i)]);
end

% 4. Parallel to Serial & Demodulation
% Flatten the matrix back to a single stream
rx_serial_data = reshape(fft_data, 1, []); 

% Demodulate (Phase -> Bits)
% Note: Ensure 'rx_serial_data' is normalized if channel gain != 1
demod_data = pskdemod(rx_serial_data, 4); 

% 5. Error Calculation & Result Plot
figure;
stem(data, 'bo', 'LineWidth', 1.5, 'DisplayName', 'Original'); hold on;
stem(demod_data, 'rx', 'LineWidth', 1.5, 'DisplayName', 'Received');
legend; grid on;
title('Comparison: Original Data vs Received Data');
xlabel('Data Point'); ylabel('Symbol Value');

% Calculate Bit Error Rate (BER)
errors = sum(data ~= demod_data);
fprintf('Total Errors: %d\n', errors);
fprintf('BER: %.4f\n', errors/length(data));