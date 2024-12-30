% QPSK MODULATION AND DEMODULATION

clc;            % Clear command window
clear all;      % Clear all variables from workspace
close all;      % Close all figure windows

Tb = 1;         % Bit duration
t = 0:(Tb/100):Tb; % Time vector for one bit duration
fc = 1;         % Carrier frequency

% Generate carrier signals
c1 = sqrt(2/Tb) * cos(2*pi*fc*t); % In-phase carrier signal
c2 = sqrt(2/Tb) * sin(2*pi*fc*t); % Quadrature-phase carrier signal

% Generate message signal
N = 8;          % Number of bits
m = rand(1, N); % Random binary data
t1 = 0;         % Initial time for bit duration
t2 = Tb;        % End time for bit duration

% Initialize signals
odd_sig = [];
even_sig = [];
qpsk = [];

% Modulation
for i = 1:2:(N-1)
    t = t1:(Tb/100):t2;
    
    % Odd bits modulated signal
    if m(i) > 0.5
        m(i) = 1;
        m_s = ones(1, length(t));
    else
        m(i) = 0;
        m_s = -1 * ones(1, length(t));
    end
    odd_sig(i,:) = c1 .* m_s;
    
    % Even bits modulated signal
    if m(i+1) > 0.5
        m(i+1) = 1;
        m_s = ones(1, length(t));
    else
        m(i+1) = 0;
        m_s = -1 * ones(1, length(t));
    end
    even_sig(i,:) = c2 .* m_s;
    
    % QPSK signal
    qpsk(i,:) = odd_sig(i,:) + even_sig(i,:);
    
    % Plot the QPSK modulated signal
    subplot(3,2,4);
    plot(t, qpsk(i,:));
    title('QPSK Signal');
    xlabel('Time (t)');
    ylabel('s(t)');
    grid on;
    hold on;
    
    % Update time intervals for next bit duration
    t1 = t1 + (Tb + 0.01);
    t2 = t2 + (Tb + 0.01);
end
hold off;

% Plot the binary data bits and carrier signals
subplot(3,2,1);
stem(m);
title('Binary Data Bits');
xlabel('n');
ylabel('b(n)');
grid on;

subplot(3,2,2);
plot(0:(Tb/100):Tb, c1);
title('Carrier Signal 1');
xlabel('Time (t)');
ylabel('c1(t)');
grid on;

subplot(3,2,3);
plot(0:(Tb/100):Tb, c2);
title('Carrier Signal 2');
xlabel('Time (t)');
ylabel('c2(t)');
grid on;

% QPSK Demodulation
t1 = 0;
t2 = Tb;
demod = zeros(1, N); % Initialize demodulated signal

for i = 1:2:N-1
    t = t1:(Tb/100):t2;
    
    % Correlator
    x1 = sum(c1 .* qpsk(i,:));
    x2 = sum(c2 .* qpsk(i,:));
    
    % Decision device
    if x1 > 0 && x2 > 0
        demod(i) = 1;
        demod(i+1) = 1;
    elseif x1 > 0 && x2 < 0
        demod(i) = 1;
        demod(i+1) = 0;
    elseif x1 < 0 && x2 < 0
        demod(i) = 0;
        demod(i+1) = 0;
    elseif x1 < 0 && x2 > 0
        demod(i) = 0;
        demod(i+1) = 1;
    end
    
    % Update time intervals for next bit duration
    t1 = t1 + (Tb + 0.01);
    t2 = t2 + (Tb + 0.01);
end

% Plot the QPSK demodulated bits
subplot(3,2,5);
stem(demod);
title('QPSK Demodulated Bits');
xlabel('n');
ylabel('b(n)');
grid on;
