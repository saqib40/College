clc; clear; close all;

% --- Inputs ---
f = input('Frequency (MHz): ');
d = input('Distance (km): ');
Gt = input('Tx Antenna Gain (dB): ');
Gr = input('Rx Antenna Gain (dB): ');
Pt_dBm = input('Tx Power (dBm): ');

% --- Calculations ---
lambda = 300 / f;                                   % Wavelength in meters
FSPL = 32.44 + 20*log10(d) + 20*log10(f);           % Free Space Path Loss (dB)
Pr_dBm = Pt_dBm + Gt + Gr - FSPL;                   % Rx Power (Link Budget)
Pr_mW = 10^(Pr_dBm / 10);                           % Rx Power in milliwatts

% --- Output ---
fprintf('\n--- Results ---\n');
fprintf('1. Wavelength:       %.4f m\n', lambda);
fprintf('2. Path Loss (FSPL): %.4f dB\n', FSPL);
fprintf('3. Rx Power:         %.4f dBm\n', Pr_dBm);
fprintf('4. Rx Power (mW):    %.4e mW\n', Pr_mW);   % Displaying in scientific notation