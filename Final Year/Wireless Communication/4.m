clc; clear;

% --- 1. Source: "Income" (EIRP) ---
pt_watts = input('Tx Power (Watts): ');
gt = input('Tx Antenna Gain (dB): ');
Pt_dB = 10 * log10(pt_watts);       % Convert Watts to dBW
EIRP = Pt_dB + gt;                  % Effective Isotropic Radiated Power

% --- 2. Channel: "Expenses" (Losses) ---
d = input('Distance (km): ');
f = input('Frequency (MHz): ');

% Free Space Path Loss (Formula for km and MHz)
% Standard Formula: 32.45 + 20log10(d_km) + 20log10(f_MHz)
FSL = 32.4 + 20*log10(d) + 20*log10(f);

% Additional "Taxes" (Losses)
fprintf('Enter losses in dB (Feeder, Atmosphere, Misalignment, Polarization)...\n');
losses_list = input('Enter as vector [rfl, aa, aml, pl] (e.g., [1 2 0.5 0.5]): ');
Total_Losses = FSL + sum(losses_list);

% --- 3. Destination: Result (Received Power) ---
gr = input('Rx Antenna Gain (dB): ');
Pr = EIRP + gr - Total_Losses;

% --- Display Results ---
fprintf('\n----------------------------\n');
fprintf('1. EIRP:              %.2f dBW\n', EIRP);
fprintf('2. Free Space Loss:   %.2f dB\n', FSL);
fprintf('3. Total Losses:      %.2f dB\n', Total_Losses);
fprintf('4. Rx Power (Pr):     %.2f dBW\n', Pr);
fprintf('----------------------------\n');