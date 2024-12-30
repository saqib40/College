% QPSK Modulation and Demodulation
clc;
clear;
close all;

Tb = 1;                          % Bit duration
t = 0:(Tb/100):Tb;               % Time vector for one bit duration
fc = 1;                          % Carrier frequency

% Generate carrier signals
c1 = sqrt(2/Tb) * cos(2*pi*fc*t); % In-phase carrier signal
c2 = sqrt(2/Tb) * sin(2*pi*fc*t); % Quadrature-phase carrier signal

% Generate random binary data
N = 8;                           % Number of bits
m = randi([0, 1], 1, N);         % Random binary data

% Initialize QPSK signal
qpsk = [];

% QPSK Modulation
for i = 1:2:N
    t = (i-1)*Tb/100 : Tb/100 : i*Tb;
    
    % Modulate odd and even bits
    m_s1 = (m(i)*2-1) * ones(1, length(t));   % Map to ±1
    m_s2 = (m(i+1)*2-1) * ones(1, length(t)); % Map to ±1
    
    % QPSK signal
    qpsk = [qpsk, (c1 .* m_s1) + (c2 .* m_s2)];
end

% Plot binary data bits
subplot(3, 2, 1);
stem(m, 'filled');
title('Binary Data Bits');
xlabel('n');
ylabel('b(n)');
grid on;

% Plot carrier signals
subplot(3, 2, 2);
plot(t, c1);
title('Carrier Signal 1');
xlabel('Time (t)');
ylabel('c1(t)');
grid on;

subplot(3, 2, 3);
plot(t, c2);
title('Carrier Signal 2');
xlabel('Time (t)');
ylabel('c2(t)');
grid on;

% Plot QPSK modulated signal
subplot(3, 2, 4);
plot(0:Tb/100:(N/2)*Tb-Tb/100, qpsk);
title('QPSK Signal');
xlabel('Time (t)');
ylabel('s(t)');
grid on;

% QPSK Demodulation
demod = zeros(1, N); % Initialize demodulated signal
for i = 1:2:N
    t = (i-1)*Tb/100 : Tb/100 : i*Tb;
    
    % Correlator outputs
    x1 = sum(c1 .* qpsk((i-1)*length(t)+1:i*length(t)));
    x2 = sum(c2 .* qpsk((i-1)*length(t)+1:i*length(t)));
    
    % Decision device
    demod(i)   = x1 > 0;  % Map back to binary
    demod(i+1) = x2 > 0;  % Map back to binary
end

% Plot QPSK demodulated bits
subplot(3, 2, 5);
stem(demod, 'filled');
title('QPSK Demodulated Bits');
xlabel('n');
ylabel('b(n)');
grid on;
