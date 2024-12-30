% AIM:
% To generate the Signal to Noise Ratio (SNR) calculation using MATLAB.

% SOFTWARE USED: MATLAB R2016a (9.0.0.341360)

clc;            % Clear the command window
clear all;      % Clear all variables
close all;      % Close all figure windows

% Generate the message signal
length = linspace(-2*pi, 2*pi, 1000);  % Time vector
message = sin(length);                 % Sine wave as the message signal

% Generate the noise signal
noise = 0.5 * rand(size(message));     % Random noise with amplitude 0.5

% Plot the message signal
figure;
plot(length, message);
title('Message Signal');
xlabel('Time');
ylabel('Amplitude');

% Plot the noise signal
figure;
plot(length, noise);
title('Noise Signal');
xlabel('Time');
ylabel('Amplitude');

% Calculate and display the Signal-to-Noise Ratio (SNR)
snr_value = snr(message, noise);
disp(['Signal-to-Noise Ratio (SNR): ', num2str(snr_value), ' dB']);
