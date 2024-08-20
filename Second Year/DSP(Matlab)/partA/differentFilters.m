% IIR Filter Design (Butterworth)

% Get user input for filter specifications
FS = input('Enter the sampling frequency: ');
fp = input('Enter passband frequency: ');
fs = input('Enter stopband frequency: ');
rp = input('Enter passband ripple (dB): ');
rs = input('Enter stopband attenuation (dB): ');

% Pre-warping
% Convert frequencies to normalized frequencies
WP = 2 * pi * fp / FS;
WP = 2 * tan(WP / 2);  % Prewarping for bilinear transform
WS = 2 * pi * fs / FS;
WS = 2 * tan(WS / 2);  % Prewarping for bilinear transform

% Butterworth Filter Design
[n_butter, wn_butter] = buttord(WP, WS, rp, rs, 's');

% Design different types of Butterworth filters
[b_butter_low, a_butter_low] = butter(n_butter, wn_butter, 'low', 's');
[b_butter_high, a_butter_high] = butter(n_butter, wn_butter, 'high', 's');
[b_butter_band, a_butter_band] = butter(n_butter, wn_butter, 'bandpass', 's');
[b_butter_stop, a_butter_stop] = butter(n_butter, wn_butter, 'stop', 's');

% Apply bilinear transform to convert to digital filter
[b_butter_low_d, a_butter_low_d] = bilinear(b_butter_low, a_butter_low, 1);
[b_butter_high_d, a_butter_high_d] = bilinear(b_butter_high, a_butter_high, 1);
[b_butter_band_d, a_butter_band_d] = bilinear(b_butter_band, a_butter_band, 1);
[b_butter_stop_d, a_butter_stop_d] = bilinear(b_butter_stop, a_butter_stop, 1);

% Plot frequency responses
figure;

% Butterworth
subplot(3,4,1); freqz(b_butter_low_d, a_butter_low_d, 512, FS);
title('Butterworth Lowpass');
subplot(3,4,2); freqz(b_butter_high_d, a_butter_high_d, 512, FS);
title('Butterworth Highpass');
subplot(3,4,3); freqz(b_butter_band_d, a_butter_band_d, 512, FS);
title('Butterworth Bandpass');
subplot(3,4,4); freqz(b_butter_stop_d, a_butter_stop_d, 512, FS);
title('Butterworth Bandstop');