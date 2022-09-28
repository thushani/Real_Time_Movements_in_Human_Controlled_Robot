function fft1(x,fs,NAME)

T = 1/fs;             % Sampling period       
L = 68716;             % Length of signal
t = (0:L-1)*T;        % Time vector

f = fs*(0:(L/2))/L;
S = x;
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

figure;
hold on;
plot(f,P1)
title(NAME);
end
