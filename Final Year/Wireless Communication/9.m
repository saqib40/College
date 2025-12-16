clc; clear; close all;

% Parameters
Nbits = 64; M = 4;              % QPSK
Nsc = 4; Nfft = 16; cp = 4;

% Transmitter
data = randi([0 M-1],1,Nbits);
mod = pskmod(data,M,pi/4);
mod = reshape([mod zeros(1,mod(numel(mod),Nsc))],Nsc,[]).';
ifft_out = ifft(mod,Nfft,2);
tx = [ifft_out(:,end-cp+1:end) ifft_out];
tx_sig = tx(:).';

% Channel
rx_sig = awgn(tx_sig,30);

% Receiver
rx = reshape(rx_sig,Nfft+cp,[]).';
rx = rx(:,cp+1:end);
fft_out = fft(rx,Nfft,2);
rx_data = reshape(fft_out(:,1:Nsc).',1,[]);
demod = pskdemod(rx_data,M,pi/4);

% BER
BER = mean(data~=demod(1:Nbits));
fprintf('BER = %.4f\n',BER);
