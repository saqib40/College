% User-defined FFT and IFFT Functions

% Function to calculate FFT
function fastft = calcfastft(x, N)
    % Create frequency vector
    n = 0:1:N-1;
    k = n;
    
    % Create DFT matrix
    W = exp(-1i * 2*pi/N * (n' * k));
    
    % Compute FFT
    fastft = W * x(:);
    
    % Plotting
    figure;
    
    subplot(2,2,1)
    stem(n, x)
    xlabel('Time'); ylabel('Amplitude')
    title('Input Sequence')
    
    subplot(2,2,2)
    stem(k, abs(fastft))
    xlabel('Frequency'); ylabel('Magnitude')
    title('Magnitude of FFT')
    
    subplot(2,2,3)
    stem(k, angle(fastft))
    xlabel('Frequency'); ylabel('Phase (radians)')
    title('Phase of FFT')
    
    subplot(2,2,4)
    stem(k, real(fastft))
    xlabel('Frequency'); ylabel('Real Part')
    title('Real Part of FFT')
end

% Function to calculate IFFT
function fastift = calcfastift(X, N)
    % Create time vector
    n = 0:1:N-1;
    k = n;
    
    % Create inverse DFT matrix
    W = exp(1i * 2*pi/N * (n' * k));
    
    % Compute IFFT
    fastift = (W * X(:)) / N;
    
    % Plotting
    figure;
    
    subplot(2,2,1)
    stem(k, abs(X))
    xlabel('Frequency'); ylabel('Magnitude')
    title('Magnitude of Input Sequence')
    
    subplot(2,2,2)
    stem(n, real(fastift))
    xlabel('Time'); ylabel('Amplitude')
    title('IFFT Result')
    
    subplot(2,2,3)
    stem(n, abs(fastift))
    xlabel('Time'); ylabel('Magnitude')
    title('Magnitude of IFFT')
    
    subplot(2,2,4)
    stem(n, angle(fastift))
    xlabel('Time'); ylabel('Phase (radians)')
    title('Phase of IFFT')
end

% Main script
% Get input for FFT
x = input('Enter the sequence for FFT: ');
N = input('Enter number of samples for FFT: ');

% Compute and display FFT
fft_result = calcfastft(x, N);
disp('FFT Result:');
disp(fft_result);

% Get input for IFFT
X = input('Enter the sequence for IFFT: ');
N = input('Enter number of samples for IFFT: ');

% Compute and display IFFT
ifft_result = calcfastift(X, N);
disp('IFFT Result:');
disp(ifft_result);