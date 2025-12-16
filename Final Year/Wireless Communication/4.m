clc; clear;

Pt = input('Tx Power (W): ');
Gt = input('Tx Gain (dB): ');
d  = input('Distance (km): ');
f  = input('Freq (MHz): ');
Gr = input('Rx Gain (dB): ');
L  = input('Other losses [dB]: ');

Pt_dbw = 10*log10(Pt);
EIRP = Pt_dbw + Gt;
FSL  = 32.45 + 20*log10(d) + 20*log10(f);
Pr   = EIRP + Gr - (FSL + L);

fprintf('EIRP = %.2f dBW\nFSL = %.2f dB\nPr = %.2f dBW\n',EIRP,FSL,Pr);
