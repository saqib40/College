clc; clear; close all;

% Parameters
fc = 2.4e9; v = 50/3.6; c = 3e8;
fd = (v/c)*fc;

fs = 1e4; t = (0:1/fs:1);
M = 16;

% Rayleigh fading (Jakes model)
alpha = 2*pi*rand(1,M);
phi   = 2*pi*rand(1,M);

h = sum(exp(1j*(2*pi*fd*cos(alpha).' * t + phi.')),1)/sqrt(M);

% Envelope
figure;
plot(t,20*log10(abs(h))), grid on
xlabel('Time'), ylabel('Envelope (dB)')
title('Rayleigh Fading Envelope')

% Doppler Spectrum
figure; 
H=fftshift(abs(fft(h)));
f=linspace(-fs/2,fs/2,length(H));
plot(f,20*log10(H)), grid on
xlim([-fd fd])
xlabel('Frequency'), ylabel('Magnitude (dB)')

% BER (QPSK)
N = 1e4;
data = randi([0 3],N,1);
s = pskmod(data,4,pi/4);
hN = h(1:N).';
EbNo = 0:2:20;

for k = 1:length(EbNo)
    n = awgn(hN.*s, EbNo(k)+3, 'measured');
    shat = n./hN;
    BER(k) = mean(pskdemod(shat,4,pi/4) ~= data);
end

semilogy(EbNo,BER,'o-'), grid on
xlabel('Eb/No (dB)'), ylabel('BER')