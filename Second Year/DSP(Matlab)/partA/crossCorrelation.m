% Cross-correlation using both Time and Frequency Domain methods

% Input sequences
x = input('Enter the first sequence: ');
h = input('Enter the second sequence: ');

lx = length(x);
lh = length(h);

% Time Domain Cross-correlation
y_time = xcorr(x, h);

% Frequency Domain Cross-correlation
N = lx + lh - 1;  % Length for zero-padding

% Compute DFTs
X = fft(x, N);
H = fft(h, N);

% Multiply X by complex conjugate of H
Y = X .* conj(H);

% Compute IDFT
y_freq = ifft(Y);

% Plotting
figure;

% Plot input sequences
subplot(3, 2, 1);
stem(0:lx-1, x);
xlabel('n'); ylabel('x(n)'); title('First Sequence');

subplot(3, 2, 2);
stem(0:lh-1, h);
xlabel('n'); ylabel('h(n)'); title('Second Sequence');

% Plot Time Domain Cross-correlation
subplot(3, 2, 3);
stem(-(lh-1):(lx-1), y_time);
xlabel('Lag'); ylabel('Cross-correlation'); title('Time Domain Cross-correlation');

% Plot DFT of inputs
subplot(3, 2, 4);
stem(0:N-1, abs(X));
hold on;
stem(0:N-1, abs(H));
xlabel('k'); ylabel('Magnitude'); title('DFT of Inputs');
legend('|X(k)|', '|H(k)|');

% Plot product of DFTs
subplot(3, 2, 5);
stem(0:N-1, abs(Y));
xlabel('k'); ylabel('|Y(k)|'); title('|X(k)H*(k)|');

% Plot Frequency Domain Cross-correlation
subplot(3, 2, 6);
stem(0:N-1, real(y_freq));
xlabel('Lag'); ylabel('Cross-correlation'); title('Frequency Domain Cross-correlation');

% Display numerical results
disp('Time Domain Cross-correlation:');
disp(y_time);
disp('Frequency Domain Cross-correlation:');
disp(real(y_freq));
disp('Maximum Difference:');
disp(max(abs(y_time - real(y_freq))));