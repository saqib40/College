clc; clear; close all;

% --- 1. System Setup ---
M = 16;                     % Modulation Order (16-QAM)
k = log2(M);                % Bits per symbol (4 bits)
num_symbols = 2;            % Number of symbols to send (MIMO pair)

% Input Data (Integer symbols 0 to M-1)
% Example: [2 3] as requested, or random
data_in = randi([0 M-1], num_symbols, 1); 

% --- 2. Transmitter (Tx) ---
% A. Modulation (16-QAM)
s = qammod(data_in, M);
s1 = s(1); s2 = s(2);

% B. Alamouti STBC Encoding (Space-Time Block Code)
% Time Slot 1: Ant1 sends s1, Ant2 sends s2
% Time Slot 2: Ant1 sends -s2*, Ant2 sends s1*
X = [s1,  -conj(s2);
     s2,   conj(s1)];       % Rows = Antennas, Cols = Time Slots

fprintf('--- TRANSMITTER ---\n');
fprintf('Symbol 1: %.2f + %.2fi\n', real(s1), imag(s1));
fprintf('Symbol 2: %.2f + %.2fi\n', real(s2), imag(s2));

% --- 3. Channel ---
% 2x2 MIMO Channel Matrix (h_rx_tx)
h = (randn(2, 2) + 1j*randn(2, 2)) / sqrt(2); % Rayleigh Channel
% Or use fixed matrix for testing: h = [0.3 -0.2; 0.1 0.11];

% Add Noise (AWGN)
SNR_dB = 20;
n_var = 10^(-SNR_dB/10);
noise = sqrt(n_var/2) * (randn(2, 2) + 1j*randn(2, 2));

% Received Signal (Y = H*X + N)
Y = h * X + noise;

% --- 4. Receiver (Rx) ---
% Extract received signals per time slot
r1 = Y(:, 1);  % Received vector at Time T
r2 = Y(:, 2);  % Received vector at Time T+1

% Combining Scheme (Alamouti Decoding)
% We combine signals from both antennas and both time slots to recover s1 and s2
% These formulas mathematically cancel out the cross-interference

% Estimated s1 (s1_hat)
s1_hat = conj(h(1,1))*r1(1) + h(1,2)*conj(r2(1)) + ...
         conj(h(2,1))*r1(2) + h(2,2)*conj(r2(2));

% Estimated s2 (s2_hat)
s2_hat = conj(h(1,2))*r1(1) - h(1,1)*conj(r2(1)) + ...
         conj(h(2,2))*r1(2) - h(2,1)*conj(r2(2));

% Normalize by channel power to return to correct magnitude
ch_power = sum(abs(h(:)).^2);
s_estimated = [s1_hat; s2_hat] ./ ch_power;

% Demodulation
data_out = qamdemod(s_estimated, M);

% --- 5. Output & Verification ---
fprintf('\n--- RECEIVER ---\n');
fprintf('Estimated S1: %.2f + %.2fi\n', real(s_estimated(1)), imag(s_estimated(1)));
fprintf('Estimated S2: %.2f + %.2fi\n', real(s_estimated(2)), imag(s_estimated(2)));
fprintf('Detected Data: %d %d\n', data_out(1), data_out(2));

figure;
subplot(2,1,1); stem(data_in, 'filled', 'LineWidth', 2);
title('Transmitted Data Symbols'); grid on; ylim([-1 M]);
subplot(2,1,2); stem(data_out, 'filled', 'r', 'LineWidth', 2);
title('Received Data Symbols'); grid on; ylim([-1 M]);

if isequal(data_in, data_out)
    fprintf('\nSUCCESS: Transmission Perfect!\n');
else
    fprintf('\nFAILURE: Errors Detected.\n');
end