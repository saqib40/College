clc; clear; close all;

% --- Inputs & Constants ---
C = 3e8;                                % Speed of light
f = 2100e6;                             % Frequency (WCDMA)
Pt = 1e-3;                              % Tx Power (Watts)
Gt = 1; Gr = 1;                         % Gains (dB)
d0 = 1;                                 % Ref distance (m)

% Environment Data: [Free Space, Urban, Shadowed, Indoor LOS, Factory, Obstructed]
n_opts = [2, 3.1, 4, 1.7, 2.5, 5];      % Path Loss Exponents

e = input('Environment (1-Free, 2-Urb, 3-Shad, 4-InLOS, 5-Fact, 6-Obs): ');
d_user = input('Enter Distance (100-2000m): ');

% --- Single Point Calculation ---
% Calculate Wavelength and Power in dBm
lamda = C / f;
Pt_dBm = 10 * log10(Pt * 1000);

% Calculate Reference Power (Pr0) based on user selection
% Note: Using user's 'n' for the specific answer as per original code logic
n_user = n_opts(e); 
Pr0_user = Pt_dBm + Gt + Gr - (10 * n_user * log10(4 * pi * d0 / lamda));

fprintf('Received Power (Pr0) at %d m: %.4f dBm\n', d0, Pr0_user);

% --- Simulation & Plotting ---
figure; hold on;
dist = 100:2:2000;                      % Distance Vector
noise = randn(1, length(dist)) * 0.1;   % Generate noise vector once

% Environments to plot (Indices 1 to 5 as per original code)
plot_indices = [1, 2, 3, 4, 5]; 
colors = {'g', 'k', 'r', 'b', 'c'};
labels = {'Free Space (n=2)', 'Urban (n=3.1)', 'Shadowed (n=4)', ...
          'In-Build LOS (n=1.7)', 'Factory (n=2.5)'};

% Calculate Base Reference Power (Free Space n=2) for consistent plotting
Pr0_ref = Pt_dBm + Gt + Gr - (20 * log10(4 * pi * d0 / lamda)); 

for k = 1:length(plot_indices)
    idx = plot_indices(k);
    n = n_opts(idx);
    
    % Vectorized Path Loss Calculation: Pr = Pr0 - 10nlog(d/d0) + X
    Pr_vec = Pr0_ref - (10 * n * log10(dist ./ d0)) + noise;
    
    plot(dist, Pr_vec, 'Color', colors{k}, 'DisplayName', labels{k}, 'LineWidth', 1.5);
end

grid on;
title('Log-Normal Shadowing: Received Power vs Distance');
xlabel('Distance (m)'); ylabel('Received Power (dBm)');
legend('show', 'Location', 'southwest');