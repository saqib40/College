% Circular Convolution using both Time and Frequency Domain methods

% Input sequences
x = input('\nEnter the first sequence: ');
h = input('Enter the second sequence: ');

% Get lengths of input sequences
lx = length(x);
lh = length(h);

% Determine the maximum length for circular convolution
N = max(lx, lh);

% Time Domain Circular Convolution
x1 = [x, zeros(1, N-lx)];  % Zero-pad x if necessary
h1 = [h, zeros(1, N-lh)];  % Zero-pad h if necessary
Z = zeros(1, N);  % Initialize output

for m = 1:N
    for n = 1:N
        i = mod(m-n, N) + 1;  % Circular index
        Z(m) = Z(m) + x1(n) * h1(i);
    end
end

% Frequency Domain Circular Convolution
X = fft(x, N);  % DFT of x
H = fft(h, N);  % DFT of h
Y = X .* H;     % Element-wise multiplication in frequency domain
y = ifft(Y);    % IDFT to get the result

% Plotting
figure;

% Plot input sequences
subplot(3, 3, 1);
stem(0:lx-1, x);
xlabel('n'); ylabel('x(n)'); title('First Signal');

subplot(3, 3, 2);
stem(0:lh-1, h);
xlabel('n'); ylabel('h(n)'); title('Second Signal');

% Plot Time Domain result
subplot(3, 3, 3);
stem(0:N-1, Z);
xlabel('n'); ylabel('Z(n)'); title('Time Domain Circular Convolution');

% Plot Frequency Domain steps
subplot(3, 3, 4);
stem(0:N-1, abs(X));
xlabel('k'); ylabel('|X(k)|'); title('DFT of First Signal');

subplot(3, 3, 5);
stem(0:N-1, abs(H));
xlabel('k'); ylabel('|H(k)|'); title('DFT of Second Signal');

subplot(3, 3, 6);
stem(0:N-1, abs(Y));
xlabel('k'); ylabel('|Y(k)|'); title('Product of DFTs');

% Plot Frequency Domain result
subplot(3, 3, 7);
stem(0:N-1, real(y));
xlabel('n'); ylabel('y(n)'); title('Frequency Domain Circular Convolution');

% Display numerical results
disp('Time Domain Result:');
disp(Z);
disp('Frequency Domain Result:');
disp(real(y));
disp('Maximum Difference:');
disp(max(abs(Z - real(y))));