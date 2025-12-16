data=randi([0 3],1,64);
s=pskmod(data,4,pi/4);
x=ifft(reshape(s,4,[]),16);
tx=[x(end-3:end,:); x]; 
tx=tx(:).';
rx=awgn(tx,30);
rx=fft(reshape(rx,20,[])(5:end,:),16);
d=pskdemod(rx(:),4,pi/4);
BER=mean(data~=d(1:64));
print(BER)