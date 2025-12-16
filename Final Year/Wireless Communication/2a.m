clc; clear; close all;

% Inputs
hte = 30:100;                 % Tx height (m)
hre = 10;                     % Rx height (m)
d = 50e3;                     % Distance (m)
f = 900;                      % Frequency (MHz)
EIRP = 37;                   % EIRP
Gr = 1;                       % Rx gain

% Constants
c = 3e8;
lambda = c/(f*1e6);

% Conversions
EIRP_dBm = 10*log10(EIRP);
Gr_dB = 10*log10(Gr);

% Okumura constants
Amu = 43; 
Garea = 9;

% Gains
Ghte = 20*log10(hte/200);
Ghre = 20*log10(hre/3);

% Loss calculations
Lf = 20*log10((4*pi*d)/lambda);
L50 = Lf + Amu - Ghte - Ghre - Garea;

% Received power
Pr = EIRP_dBm - L50 + Gr_dB;

% Display (at hte = 100 m)
fprintf('Lf = %.2f dB\n',Lf);
fprintf('Ghte = %.2f dB\n',Ghte(end));
fprintf('Ghre = %.2f dB\n',Ghre);
fprintf('Lambda = %.3f m\n',lambda);
fprintf('L50 = %.2f dB\n',L50(end));
fprintf('Pr = %.2f dBm\n',Pr(end));

% Plot
plot(hte,L50,'LineWidth',1.5), grid on
xlabel('Tx height (m)'), ylabel('Path Loss L_{50} (dB)')
title('Okumura Model')
