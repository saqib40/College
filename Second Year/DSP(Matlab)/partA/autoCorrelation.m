% Auto-correlation using both Time and Frequency Domain methods

% Input sequence
x = input('Enter the sequence: ');
lx = length(x);

% Time Domain Auto-correlation
z_time = xcorr(x, x);

% Frequency Domain Auto-correlation
% Pad the sequence to avoid circular correlation effects
N = 2*lx - 1;
X = fft(x, N);
Y = X .* conj(X);  % Multiply by complex conjugate for auto-correlation
y_freq = ifft(Y);

% Plotting
figure;

% Plot input sequence
subplot(3, 2, 1);
stem(0:lx-1, x);
xlabel('n'); ylabel('x(n)'); title('Input Sequence');

% Plot time-reversed sequence
p = fliplr(x);
subplot(3, 2, 2);
stem(0:lx-1, p);
xlabel('n'); ylabel('x(-n)'); title('Time-Reversed Sequence');

% Plot Time Domain Auto-correlation
subplot(3, 2, 3);
stem(-(lx-1):(lx-1), z_time);
xlabel('Lag'); ylabel('Auto-correlation'); title('Time Domain Auto-correlation');

% Plot DFT of input
subplot(3, 2, 4);
stem(0:N-1, abs(X));
xlabel('k'); ylabel('|X(k)|'); title('DFT of Input');

% Plot product of DFT and its conjugate
subplot(3, 2, 5);
stem(0:N-1, abs(Y));
xlabel('k'); ylabel('|Y(k)|'); title('|X(k)|^2');

% Plot Frequency Domain Auto-correlation
subplot(3, 2, 6);
stem(0:N-1, real(y_freq));
xlabel('Lag'); ylabel('Auto-correlation'); title('Frequency Domain Auto-correlation');

% Display numerical results
disp('Time Domain Auto-correlation:');
disp(z_time);
disp('Frequency Domain Auto-correlation:');
disp(real(y_freq));
disp('Maximum Difference:');
disp(max(abs(z_time - real(y_freq))));