% Input sequences
x = input('\nEnter the first sequence: ');
h = input('Enter the second sequence: ');

% Time Domain Convolution
y_time = conv(x, h);
disp('Time domain convolution result:');
disp(y_time);

% Frequency Domain Convolution

% Get lengths of input sequences
lx = length(x);
lh = length(h);

% Plot first input sequence
n = 0:lx-1;
subplot(2,3,1);
stem(n, x);
xlabel('n'); ylabel('x(n)'); title('First Signal');

% Plot second input sequence
m = 0:lh-1;
subplot(2,3,2);
stem(m, h);
xlabel('m'); ylabel('h(n)'); title('Second Signal');

% Determine length for DFT (sum of lengths minus 1)
P = lx + lh - 1;
n = 0:P-1;

% Compute and plot DFT of first sequence
X = fft(x, P);
subplot(2,3,3);
stem(n, abs(X));  % Plot magnitude of DFT
xlabel('k'); ylabel('|X(k)|'); title('DFT of First Signal');

% Compute and plot DFT of second sequence
H = fft(h, P);
subplot(2,3,4);
stem(n, abs(H));  % Plot magnitude of DFT
xlabel('k'); ylabel('|H(k)|'); title('DFT of Second Signal');

% Multiply DFTs (equivalent to convolution in time domain)
Y = X .* H;
subplot(2,3,5);
stem(n, abs(Y));
xlabel('k'); ylabel('|Y(k)| = |X(k) .* H(k)|'); title('Product of DFTs');

% Compute IDFT to get convolution result
y_freq = ifft(Y);
subplot(2,3,6);
stem(n, real(y_freq));  % Plot real part (imaginary part should be negligible)
xlabel('n'); ylabel('y(n) = x(n) * h(n)'); title('Linear Convolution (IDFT)');

% Verify results
disp('Maximum difference between time and frequency domain results:');
disp(max(abs(y_time - y_freq)));