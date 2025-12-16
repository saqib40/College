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
[p,fq] = pwelch(h,[],[],[],fs,'centered');
plot(fq,10*log10(p)), grid on
xlabel('Frequency (Hz)'), ylabel('PSD (dB/Hz)')
title('Doppler Spectrum')

% BER (QPSK)
N = 1e4;
data = randi([0 3],N,1);
s = exp(1j*(pi/4 + data*pi/2));

hN = h(1:N).';
EbNo = 0:2:20; BER = zeros(size(EbNo));

for k=1:length(EbNo)
    snr = EbNo(k)+10*log10(2);
    n = sqrt(1/10^(snr/10)/2)*(randn(N,1)+1j*randn(N,1));
    r = hN.*s + n;
    s_hat = r./hN;
    det = mod(round((angle(s_hat)-pi/4)/(pi/2)),4);
    BER(k) = mean(det~=data);
end

figure;
semilogy(EbNo,BER,'o-'), grid on
xlabel('Eb/No (dB)'), ylabel('BER')
title('BER in Rayleigh Fading Channel')
