% QAM Modulation and Demodulation

clc;        % Clear command window
clear all;  % Clear all variables
close all;  % Close all figure windows

% Define time vector
t = 0:0.01:5;

% Message signal frequencies
fm1 = 1;
fm2 = 2;

% Generate message signals
m1 = sin(2*pi*fm1*t);
m2 = sin(2*pi*fm2*t);

% Carrier frequency
fc = 10;

% Generate carrier signals
c1 = cos(2*pi*fc*t);
c2 = sin(2*pi*fc*t);

% Perform QAM modulation
x = m1 .* c1;
y = m2 .* c2;
qam = x + y;

% Perform QAM demodulation
demod1 = qam .* c1;
demod2 = qam .* c2;

% Design Butterworth filter
[a, b] = butter(5, 2*0.09);  % 5th order, cutoff frequency normalized

% Filter the demodulated signals to reconstruct message signals
msg1 = filter(a, b, demod1);
msg2 = filter(a, b, demod2);

% Plot original message signals and QAM signal
figure;
subplot(3, 1, 1);
plot(t, m1);
title('Message Signal 1');
xlabel('Time');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(t, m2);
title('Message Signal 2');
xlabel('Time');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, qam);
title('QAM Signal');
xlabel('Time');
ylabel('Amplitude');

% Plot reconstructed message signals
figure;
subplot(2, 1, 1);
plot(t, msg1);
title('Reconstructed Message Signal 1');
xlabel('Time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, msg2);
title('Reconstructed Message Signal 2');
xlabel('Time');
ylabel('Amplitude');
