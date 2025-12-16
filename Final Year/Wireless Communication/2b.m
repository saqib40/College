clc; clear; close all;

% Given values
hte = 30; hre = 2; d = 10;        % m, m, km
f = 150:1500;                     % MHz

city = 1;     % 1: Small/Medium, 2: Large
env  = 1;     % 1: Urban, 2: Suburban, 3: Rural

% Correction factor (a(hre))
if city == 1
    ah = (1.1*log10(f)-0.7)*hre - (1.56*log10(f)-0.8);
else
    ah = (f<=300).*(8.29*(log10(1.54*hre)).^2 - 1.1) + ...
         (f>300).*(3.2*(log10(11.75*hre)).^2 - 4.97);
end

% Urban path loss
L50 = 69.55 + 26.16*log10(f) - 13.82*log10(hte) ...
      - ah + (44.9 - 6.55*log10(hte))*log10(d);

% Environment correction
if env == 2
    L50 = L50 - 2*(log10(f/28)).^2 - 5.4;
elseif env == 3
    L50 = L50 - 4.78*(log10(f)).^2 + 18.33*log10(f) - 40.94;
end

% Plot
plot(f,L50,'LineWidth',1.5), grid on
xlabel('Frequency (MHz)'), ylabel('Mean Path Loss L_{50} (dB)')
title('HATA Propagation Model')
