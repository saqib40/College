%% TEM Wave Visualization in 3D
% E field along x-axis, H field along y-axis, wave propagates in z-direction

% Basic setup
eta = 377;              % Free space impedance (Ohms)
k = 2*pi;               % Wavenumber (2π/λ), assuming λ = 1
w = 2*pi;               % Angular frequency (2πf), assuming f = 1 Hz
Eo = 1e-3;              % Electric field amplitude (V/m)
Ho = Eo / eta;          % Magnetic field amplitude (A/m)

z = 0:0.01:3;           % z-axis (space), from 0 to 3 wavelengths
zero = zeros(size(z));  % Used for third axis (to keep other coordinates 0)

%% Plot at t = 0
t = 0;
Ex = Eo * cos(w*t - k*z);   % Electric field along x
Hy = Ho * cos(w*t - k*z);   % Magnetic field along y

figure(1)
plot3(z, zero, Ex, 'b');    % E-field: blue line
hold on
plot3(z, Hy, zero, 'k');    % H-field: black line
grid on
xlabel('z'); ylabel('H_y (A/m)'); zlabel('E_x (V/m)');
title('TEM Wave at t = 0')
hold off

%% Plot at t = T/8
t = 1/8;
Ex = Eo * cos(w*t - k*z);
Hy = Ho * cos(w*t - k*z);

figure(2)
plot3(z, zero, Ex, 'b');
hold on
plot3(z, Hy, zero, 'k');
grid on
xlabel('z'); ylabel('H_y (A/m)'); zlabel('E_x (V/m)');
title('TEM Wave at t = T/8')
hold off

%% Plot at t = T/4
t = 1/4;
Ex = Eo * cos(w*t - k*z);
Hy = Ho * cos(w*t - k*z);

figure(3)
plot3(z, zero, Ex, 'b');
hold on
plot3(z, Hy, zero, 'k');
grid on
xlabel('z'); ylabel('H_y (A/m)'); zlabel('E_x (V/m)');
title('TEM Wave at t = T/4')
hold off
