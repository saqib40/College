clc; clear; close all;

M = 16;                         % 16-QAM
data = randi([0 M-1],2,1);      % Two symbols

% Modulation
s = qammod(data,M);

% Alamouti Encoding
X = [ s(1)  -conj(s(2));
      s(2)   conj(s(1)) ];

% 2x2 Rayleigh Channel
H = (randn(2)+1j*randn(2))/sqrt(2);
N = (randn(2,2)+1j*randn(2,2))/sqrt(20);

% Received Signal
Y = H*X + N;

% Alamouti Decoding
r1 = Y(:,1); r2 = Y(:,2);
s1 = conj(H(1,1))*r1(1)+H(1,2)*conj(r2(1))+conj(H(2,1))*r1(2)+H(2,2)*conj(r2(2));
s2 = conj(H(1,2))*r1(1)-H(1,1)*conj(r2(1))+conj(H(2,2))*r1(2)-H(2,1)*conj(r2(2));
s_hat = [s1; s2]/sum(abs(H(:)).^2);

% Demodulation
data_hat = qamdemod(s_hat,M);

fprintf('Tx data: %d %d\n',data);
fprintf('Rx data: %d %d\n',data_hat);
