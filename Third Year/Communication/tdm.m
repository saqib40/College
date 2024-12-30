clc;           % Clear the command window
close all;     % Close all figure windows
clear all;     % Clear all variables

t = 0:0.2:2*pi;   % Time vector
x = sin(t);       % Signal 1: Sine wave
ln = length(x);   % Length of the signal
y = triang(ln);   % Signal 2: Triangular wave

% TDM Multiplexed signal
mux = zeros(1, 2 * ln);  % Preallocate for efficiency
mux(1:2:end) = x;        % Odd indices for signal x
mux(2:2:end) = y;        % Even indices for signal y

% TDM Demultiplexed signal
demux = reshape(mux, 2, ln); % Reshape mux for demultiplexing
s = demux(1, :);             % Extract the first row (signal x)
t_demux = demux(2, :);       % Extract the second row (signal y)

% Plotting the signals
figure;

subplot(3, 3, 1);
plot(x);
title('Original Signal x (Sine wave)');
xlabel('Time');
ylabel('Amplitude');

subplot(3, 3, 2);
plot(y);
title('Original Signal y (Triangular wave)');
xlabel('Time');
ylabel('Amplitude');

subplot(3, 3, 3);
stem(x);
title('Sampled Signal x');
xlabel('Sample index');
ylabel('Amplitude');

subplot(3, 3, 4);
stem(y);
title('Sampled Signal y');
xlabel('Sample index');
ylabel('Amplitude');

subplot(3, 3, 5);
stem(mux);
title('TDM Multiplexed Signal');
xlabel('Sample index');
ylabel('Amplitude');

subplot(3, 3, 6);
plot(s);
title('Demultiplexed Signal x');
xlabel('Sample index');
ylabel('Amplitude');

subplot(3, 3, 7);
plot(t_demux);
title('Demultiplexed Signal y');
xlabel('Sample index');
ylabel('Amplitude');
