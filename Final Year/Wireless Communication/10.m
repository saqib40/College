M = 16;
d = randi([0 M-1],2,1);
s = qammod(d,M);

% Alamouti encoder
X = [ s(1) -conj(s(2));
      s(2)  conj(s(1)) ];

H = (randn(2)+1j*randn(2))/sqrt(2);
Y = H*X;

% Alamouti decoder (EASY FORM)
r1 = Y(:,1); 
r2 = Y(:,2);

s1 = conj(H(:,1))'*r1 + H(:,2)'*conj(r2);
s2 = conj(H(:,2))'*r1 - H(:,1)'*conj(r2);

s_hat = [s1; s2]/sum(abs(H(:)).^2);

d_hat = qamdemod(s_hat,M);

disp([d d_hat]) 
