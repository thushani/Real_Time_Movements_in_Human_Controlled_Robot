close all;
clear;
clc;
n = '4.wav';
[y, fs]= audioread(n);

y = downsample(y,21);
fs = 1024;
subplot(2,1,1);
plot(y);
title('Noisy signal');
%----------------Normalization----------------------
y1=((y-mean(y)))/std(y);      %N = (x - mean(x))/std(x)
subplot(2,1,2);
plot(y1);
title('Normalized signal');
fft1(y1,fs,'Normalized signal',length(y));

%-------------Noise reduction------------------------
NF=NotchFilter(fs,20,0.1,y1); 
BPF=BandPassFilter(4,fs,NF,1,200); 

%----------------Other filters----------------
WF = wienerFilter(BPF);
LMS = LMSFilter(0.008,BPF);
RMSF=rms1(BPF,1,0,0);

LPF = LowPassFilter(fs,2,4,BPF); % Normalizing

%-------------Fouirer transformation of the signal------------
fft1(WF,fs,'Winer signal', length(y));
fft1(LMS,fs,'LMS signal',length(y));
fft1(LPF,fs,'Low pass filter signal',length(y));
fft1(RMSF,fs,'RMS filter signal',length(y));

figure;
subplot(2,1,1);
plot(y1);
title('Normalized signal');

subplot(2,1,2);
plot(WF);
title('Winer signal');

figure;
subplot(2,1,1);
plot(y1);
title('Normalized signal');

subplot(2,1,2);
plot(LMS);
title('LMS signal');

figure;
subplot(2,1,1);
plot(y1);
title('Normalized signal');

subplot(2,1,2);
plot(LPF);
title('Low pass filter signal');

figure;
subplot(2,1,1);
plot(y1);
title('Normalized signal');

subplot(2,1,2);
plot(RMSF);
title('RMS signal');