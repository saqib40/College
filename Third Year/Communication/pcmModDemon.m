clc;           % Clear the command window
close all;     % Close all figure windows
clear all;     % Clear all variables

n = input('Enter n value for n-bit PCM system: '); % Number of bits for PCM
n1 = input('Enter number of samples in a period: '); % Number of samples
L = 2^n;       % Number of quantization levels

% Generate the analog signal
x = 0:2*pi/n1:4*pi; 
s = 8 * sin(x); % Amplitude of 8

% Plot the analog signal
subplot(3,1,1); plot(s);
title('Analog Signal'); ylabel('Amplitude'); xlabel('Time');

% Plot the sampled signal
subplot(3,1,2);
stem(s); 
grid on;
title('Sampled Signal'); ylabel('Amplitude'); xlabel('Time');

% Quantization
vmax = 8;
vmin = -vmax;
del = (vmax - vmin) / L;
part = vmin:del:vmax;
code = vmin - (del / 2):del:vmax + (del / 2);
[ind, q] = quantiz(s, part, code);

% Adjust indices and quantized values
ind = ind - (ind ~= 0);
q(q == vmin - (del / 2)) = vmin + (del / 2);

% Plot the quantized signal
subplot(3,1,3);
stem(q); 
grid on;
title('Quantized Signal');
ylabel('Amplitude');
xlabel('Time');

% Encoding
figure;
code = de2bi(ind, 'left-msb');
coded = reshape(code', 1, numel(code)); % Convert to serial bit stream

% Plot the encoded signal
subplot(2,1,1); grid on; stairs(coded);
axis([0 100 -2 3]); title('Encoded Signal'); ylabel('Amplitude'); xlabel('Time');

% Demodulation
qunt = reshape(coded, n, []).'; % Reshape to matrix with n columns
index = bi2de(qunt, 'left-msb');
q = del * index + vmin + (del / 2);

% Plot the demodulated signal
subplot(2,1,2); 
grid on;
plot(q);
title('Demodulated Signal');
ylabel('Amplitude');
xlabel('Time');
