clc; clear;

f = input('f (MHz): ');
d = input('d (km): ');
Pt = input('Pt (dBm): ');
Gt = input('Gt (dB): ');
Gr = input('Gr (dB): ');

lambda = 300/f;
FSPL = 32.45 + 20*log10(d) + 20*log10(f);
Pr = Pt + Gt + Gr - FSPL;

fprintf('Lambda = %.3f m\nFSPL = %.2f dB\nPr = %.2f dBm\n',lambda,FSPL,Pr);
