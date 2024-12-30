% FM MODULATION AND DEMODULATION

clc;            % Clear command window
clear all;      % Clear all variables from workspace
close all;      % Close all figure windows

Fs = 8000;      % Sampling rate (samples per second)
Fc = 100;       % Carrier frequency (Hz)
t = linspace(0, 1, 10000); % Time vector for 1 second duration with 10000 samples

x = sin(2*pi*10*t); % Modulating signal (sine wave at 10 Hz)

dev = 50;       % Frequency deviation for FM modulation (Hz)
y = fmmod(x, Fc, Fs, dev); % FM modulate the signal
z = fmdemod(y, Fc, Fs, dev); % FM demodulate the signal

% Plot the modulating signal
subplot(411); 
plot(t, x);
xlabel('Time (sec)');
ylabel('Amplitude (V)');
title('Modulating Signal');

% Plot the carrier signal
subplot(412); 
plot(t, sin(2*pi*Fc*t));
xlabel('Time (sec)');
ylabel('Amplitude (V)');
title('Carrier Signal');

% Plot the frequency modulated signal
subplot(413); 
plot(t, y);
xlabel('Time (sec)');
ylabel('Amplitude (V)');
title('Frequency Modulated Signal');

% Plot the demodulated signal
subplot(414); 
plot(t, z);
xlabel('Time (sec)');
ylabel('Amplitude (V)');
title('Demodulated Signal');
