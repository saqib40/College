%% Radiation Pattern of Dipole Antennas of Varying Lengths
% Compares the radiation intensity of dipoles of length λ, 0.75λ, and 0.25λ

set(0, 'defaultLineLineWidth', 2);  % Set default line width for all plots

d = [1, 0.75, 0.25];                % Dipole lengths in terms of wavelength λ
str_vec = {'-', '--', ':'};        % Line styles for each dipole

for i = 1:length(d)
    kd(i) = 2*pi*d(i);              % kd = k * dipole_length (k = 2π/λ)
    theta = 0:0.01:2*pi;            % Theta (elevation angle) from 0 to 2π radians
    
    % Radiation pattern formula for sinusoidal current dipole
    elm_patt = (cos(kd(i)/2 .* cos(theta)) - cos(kd(i)/2)) ./ sin(theta);
    
    U = elm_patt.^2;                % Radiation intensity is proportional to E²
    U_dB = 10*log10(U);             % Convert to dB scale
    U_dB = U_dB - max(U_dB);        % Normalize (max = 0 dB)
    U_dB(U_dB < -40) = -40;         % Limit minimum to -40 dB for display clarity

    % --- Cartesian plot ---
    figure(1)
    plot(theta, U_dB, str_vec{i});
    hold on

    % --- Polar plot ---
    figure(2)
    % Add 40 dB offset because polar() can’t show negative values
    polar(theta, U_dB + 40, str_vec{i});
    hold on
end

% Finalizing Cartesian plot
figure(1)
title('Normalized radiation intensity pattern (U) of dipole')
legend('\lambda', '3\lambda/4', '\lambda/4')
xlabel('Elevation angle (\theta)'); ylabel('Radiation Intensity (dB)')
hold off

% Finalizing Polar plot
figure(2)
title('Normalized radiation intensity pattern (U) of dipole')
legend('\lambda', '3\lambda/4', '\lambda/4')
hold off
