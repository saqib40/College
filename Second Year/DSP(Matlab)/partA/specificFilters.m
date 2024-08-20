% Design and implementation of FIR filters of different types using windowing techniques

% Low-pass filter
disp('low')
FS = input('Enter the sampling frequency: ');  % Get sampling frequency from user
N = input('Enter the order of the filter: ');  % Get filter order from user
FP = input('ENTER THE PASS BAND FREQUENCY: '); % Get passband frequency from user
wn = FP * 2 / FS;  % Calculate normalized cutoff frequency
window = hann(N+1);  % Create Hann window of length N+1
[b, a] = fir1(N, wn, window);  % Design FIR low-pass filter
figure(1);
freqz(b, a, 512, FS);  % Plot frequency response

% High-pass filter
disp('high')
FS = input('Enter the sampling frequency: ');
N = input('Enter the order of the filter: ');
FP = input('ENTER THE PASS BAND FREQUENCY: ');
wn = FP * 2 / FS;
window = hann(N+1);
[b, a] = fir1(N, wn, 'high', window);  % Design FIR high-pass filter
figure(2);
freqz(b, a, 512, FS);

% Band-pass filter
disp('bandpass')
FS = input('Enter the sampling frequency: ');
N = input('Enter the order of the filter: ');
FP = input('ENTER THE PASS BAND FREQUENCY: ');
wn = FP * 2 / FS;
window = hann(N+1);
[b, a] = fir1(N, wn, window);  % Design FIR band-pass filter
figure(3);  % Changed to figure(3) to avoid overwriting previous plot
freqz(b, a, 512, FS);

% Band-stop filter
disp('Band stop')
FS = input('Enter the sampling frequency: ');
N = input('Enter the order of the filter: ');
FP = input('ENTER THE PASS BAND FREQUENCY: ');
wn = FP * 2 / FS;
window = hann(N+1);
[b, a] = fir1(N, wn, 'stop', window);  % Design FIR band-stop filter
figure(4);  % Changed to figure(4) to avoid overwriting previous plots
freqz(b, a, 512, FS);