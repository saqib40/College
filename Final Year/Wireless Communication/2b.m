clc; close all; clear;

% --- Inputs ---
t   = input('City Type (1: Small/Med, 2: Large): ');
u   = input('Environment (1: Urban, 2: Suburban, 3: Rural): ');
hte = input('Tx Height (30-200m): ');
hre = input('Rx Height (1-10m): ');
f_in= input('Frequency (MHz): ');
d   = input('Distance (km): ');

% --- Setup Vector ---
% Combine user input 'f_in' with the plot range so we calculate everything at once
f = unique([f_in, 150:2:1500]); 

% --- Calculations (Vectorized) ---
% 1. Correction Factor (cf)
% We calculate 'cf' for Small Cities first as a default base
cf = (1.1*log10(f) - 0.7)*hre - (1.566*log10(f) - 0.8);

% If Large City, overwrite 'cf' using Logical Indexing for the frequency split
if t == 2
    cf = (f<=300) .* (8.29*(log10(1.54*hre))^2 - 1.1) + ...
         (f>300)  .* (3.2 *(log10(11.75*hre))^2 - 4.97);
end

% 2. Base Path Loss (Urban Formula)
L50 = 69.55 + 26.16*log10(f) - 13.82*log10(hte) - cf + (44.9 - 6.55*log10(hte))*log10(d);

% 3. Environment Adjustments
if u == 2     % Suburban Correction
    L50 = L50 - 2*(log10(f/28)).^2 - 5.4;
elseif u == 3 % Rural Correction
    L50 = L50 - 4.78*(log10(f)).^2 + 18.33*log10(f) - 40.94;
end

% --- Output & Plot ---
% Extract the result for the specific frequency input by the user
val_idx = find(f == f_in); 
fprintf('\nMedian Path Loss (L50) at %.1f MHz: %.4f dB\n', f_in, L50(val_idx));

plot(f, L50, 'LineWidth', 2);
grid on;
title(['Hata Model Path Loss (City Type: ' num2str(t) ', Env: ' num2str(u) ')']);
xlabel('Frequency (MHz)'); ylabel('Mean Path Loss L_{50} (dB)');