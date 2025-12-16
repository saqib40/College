clc; clear; close all;

% Given
c = 3e8; f = 2100e6; Pt = 45;      % WCDMA
Gt = 1; Gr = 1; d0 = 1;              % dB, m
n = [2 3.1 4 1.7 2.5 5];              % Environments

e = input('Env (1-Free..6-Obs): '); % 1-Free, 2-Urb, 3-Shad, 4-InLOS, 5-Fact, 6-Obs
d = 100:10:2000;

% Conversions
lambda = c/f;
Pt_dBm = 10*log10(Pt);

% Reference power
Pr0 = Pt_dBm + Gt + Gr - 20*log10(4*pi*d0/lambda);

% Log-normal shadowing
X = randn(1,length(d))*0.1;
Pr = Pr0 - 10*n(e)*log10(d/d0) + X;

% Plot
plot(d,Pr,'LineWidth',1.5), grid on
xlabel('Distance (m)'), ylabel('Received Power (dBm)')
title('Log-Normal Shadowing Model')
