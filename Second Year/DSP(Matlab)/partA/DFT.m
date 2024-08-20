% Input and initialization
x = input('enter the sequence');
N = input('enter no. of samples');
lx = length(x); % sort of redundant
n = 0:1:lx-1;

% Plotting the input sequence
subplot(2,4,1);
stem(n,x);
xlabel('time'); ylabel('Amp'); title('DFT input');

% DFT computation
n = 0:1:N-1;
k = n;
W = exp(-j*2*pi/N*(n'*k));
X = W*x';

% Plotting DFT results
subplot(2,4,2);
stem(n,X);
xlabel('time'); ylabel('Amp'); title('DFT of x');

subplot(2,4,3);
stem(n,abs(X));
xlabel('k'); ylabel('Amp'); title('Magnitude of x');

subplot(2,4,4);
stem(n,angle(X));
xlabel('k'); ylabel('Amp'); title('Phase of x');