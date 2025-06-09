%% Uniform Linear Array Radiation Pattern: H-Plane (phi = 0)
% This code plots:
%   1. Array Factor (AF)
%   2. Element Pattern (EP)
%   3. Total Field (EP × AF)

% --- Parameters ---
d = 0.5;        % Inter-element spacing in terms of wavelength (λ)
beta = 0;       % Progressive phase shift (radians), here 0
N = 2;          % Number of elements in the array
phi = 0;        % H-plane cut (phi = 0 radians)

% --- Angular Range ---
theta = 0:0.01:2*pi;    % Elevation angle range (0 to 2π)

% --- Compute Array Factor (AF) ---
kd = 2 * pi * d;                             % Wave number × spacing
psi = kd * sin(theta) * cos(phi) + beta;    % Array phase term
AF = sin(N/2 * psi) ./ (sin(psi / 2)) / N;  % Normalized Array Factor

% --- Compute Element Pattern (EP) ---
elm_patt = cos(pi/2 * cos(theta)) ./ sin(theta);   % Element field pattern

% Fix division by zero or undefined values (NaN, Inf)
elm_patt(1) = elm_patt(2);  
AF(1) = AF(2);                

% --- Compute Total Field ---
E_tot = elm_patt .* AF;

% --- Plot Array Factor ---
figure(1);
polar(theta, abs(AF), 'r-');
title('Array Factor (H-plane)');

% --- Plot Element Pattern ---
figure(2);
polar(theta, abs(elm_patt), 'r-');
title('Element Pattern (H-plane)');

% --- Plot Total Radiation Pattern ---
figure(3);
polar(theta, abs(E_tot), 'r-');
title('Total Field Pattern (H-plane)');
