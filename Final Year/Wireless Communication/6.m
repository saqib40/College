clc; clear; close all;

% --- 1. System Parameters ---
fc = 2.4e9;             % Carrier Frequency (2.4 GHz)
v_kmh = 50;             % Velocity (km/h)
v = v_kmh / 3.6;        % Velocity (m/s)
c = 3e8;                % Speed of Light
fd = (v/c) * fc;        % Max Doppler Shift (Hz)

fs = 10000;             % Sample Rate
T = 1;                  % Duration for envelope plot
t = (0 : 1/fs : T-1/fs); 

% --- 2. Rayleigh Channel Generation (Sum-of-Sinusoids) ---
M = 32;                 % Number of paths (scatterers)
alpha = 2*pi*rand(1,M); % Random arrival angles
phi   = 2*pi*rand(1,M); % Random initial phases

% Doppler argument: 2*pi*fd*t*cos(alpha)
% Vectorized calculation: (M x N matrix)
arg = 2*pi*fd * (cos(alpha).') * t; 
h_raw = sum(exp(1j * (arg + phi.')), 1);

% Normalize power to 1 (0 dB)
h = h_raw / sqrt(mean(abs(h_raw).^2));

% --- 3. Plotting Envelope & Spectrum ---
figure;
subplot(2,1,1); 
plot(t, 20*log10(abs(h))); 
xlabel('Time (s)'); ylabel('Magnitude (dB)');
title(['Rayleigh Fading Envelope (f_d = ' num2str(fd) ' Hz)']); grid on;

subplot(2,1,2);
[pxx, f_spec] = pwelch(h, 512, 256, 1024, fs, 'centered');
plot(f_spec, 10*log10(pxx)); 
xlabel('Frequency (Hz)'); ylabel('PSD (dB/Hz)');
title('Doppler Spectrum (Jakes Spectrum)'); grid on;
xlim([-fd*2, fd*2]); % Zoom in on the Doppler spread

% --- 4. BER Simulation (QPSK) ---
fprintf('Simulating BER... ');
numSym = 1e5;                   % Increase symbols for better accuracy
data = randi([0 3], numSym, 1); % Random symbols (0-3)

% QPSK Mapping: exp(j(theta))
constellation = exp(1j * (pi/4 + (0:3)*pi/2)).'; 
txSym = constellation(data + 1);

% Generate Channel for Simulation Duration
t_sim = (0:numSym-1) / fs;
arg_sim = 2*pi*fd * (cos(alpha).') * t_sim;
h_sim_raw = sum(exp(1j * (arg_sim + phi.')), 1).';
h_sim = h_sim_raw / sqrt(mean(abs(h_sim_raw).^2));

EbNo_dB = 0:2:20;
BER = zeros(size(EbNo_dB));

for k = 1:length(EbNo_dB)
    % Calculate Noise Power
    % SNR = Eb/No + 10log10(bits_per_sym)
    snr_dB = EbNo_dB(k) + 10*log10(2); 
    noise_var = 1 / 10^(snr_dB/10); 
    
    % Channel Effect + Noise
    noise = sqrt(noise_var/2) * (randn(numSym,1) + 1j*randn(numSym,1));
    rxSig = h_sim .* txSym + noise;
    
    % Equalization (Zero Forcing: Divide by h)
    rxEq = rxSig ./ h_sim;
    
    % Detection (Vectorized Min Distance)
    % Find closest constellation point
    [~, detected_idx] = min(abs(rxEq - constellation.'), [], 2);
    
    % Calculate Error Rate
    BER(k) = mean((detected_idx - 1) ~= data);
end
fprintf('Done.\n');

% Plot BER
figure;
semilogy(EbNo_dB, BER, 'b-o', 'LineWidth', 2); hold on;
% Theoretical Rayleigh BER for QPSK (Approx 1/2SNR)
semilogy(EbNo_dB, 0.5./(10.^(EbNo_dB/10)), 'r--'); 
grid on; legend('Simulated', 'Theory (Approx)');
xlabel('Eb/No (dB)'); ylabel('Bit Error Rate');
title('BER Performance in Rayleigh Fading');