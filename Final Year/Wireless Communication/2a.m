clc; clear; close all;

% --- Inputs ---
hte = 30:1:100;                                   % Tx antenna height vector
hre = input('Rx antenna height (3m < hre < 10m): ');
d   = input('Distance from Base Station (m): ');  % Input in meters (e.g., 50000)
f   = input('Frequency (MHz): ');
EIRP = input('EIRP (Watts): ');
Gr   = input('Rx Antenna Gain: ');

% --- Calculations ---
% Constants and Conversions
c = 3e8;
lamda = c / (f * 1e6);
EIRP_dBm = 10 * log10(EIRP / 1e-3);
Gr_dB = 10 * log10(Gr);

% Environment Constants (Suburban)
Amu = 43; Garea = 9;

% Gain Calculations
% Logical check for hre compressed into one line
Ghre = (hre > 3) * 20*log10(hre/3) + (hre <= 3) * 10*log10(hre/3); 
Ghte = 20 * log10(hte / 200);             % Vector calculation for all heights

% Path Loss and Power (Vectorized)
Lf = 20 * log10((4 * pi * d) / lamda);    % Free Space Path Loss
L50 = Lf + Amu - Ghte - Ghre - Garea;     % Mean Path Loss Vector
Pr = EIRP_dBm - L50 + Gr_dB;              % Rx Power Vector

% --- Output ---
% Displaying results for the max height (hte = 100m) to match your Aim
fprintf('\n--- Results (at hte = 100m) ---\n');
fprintf('1. Free Space Path Loss (Lf):  %.4f dB\n', Lf);
fprintf('2. Ghte (at 100m):             %.4f dB\n', Ghte(end));
fprintf('3. Ghre:                       %.4f dB\n', Ghre);
fprintf('4. Lambda:                     %.4f m\n', lamda);
fprintf('5. L50 (Total Path Loss):      %.4f dB\n', L50(end));
fprintf('6. Rx Power (Pr):              %.4f dBm\n', Pr(end));

% --- Plotting ---
plot(hte, L50, 'LineWidth', 1.5);
grid on;
title(['Okumura Model: Path Loss vs Tx Height (f = ' num2str(f) ' MHz)']);
xlabel('Transmitter Antenna Height h_{te} (m)');
ylabel('Mean Path Loss L_{50} (dB)');