close all;
clear;
clc;
n = '2.wav';
[y, fs]= audioread(n);

y = downsample(y,21);
fs = 1024;

%----------------Normalization----------------------
y1=((y-mean(y)))/std(y);      %N = (x - mean(x))/std(x)
figure;
plot(y1);
title('Normalized signal');

fft1(y1,fs,'Normalized signal',length(y));
%----------------Noise reduction------------------------
NF=NotchFilter(fs,60,0.1,y1); 
BPF=BandPassFilter(4,fs,NF,1,200); 
%--------------Other filters---------------------------
WF = wienerFilter(BPF);
% figure;
% plot(WF);
% title('Smoothed Signal_1(wF)');
% -------Smoothing Technique 1------------
LPF = LowPassFilter(fs,2,4,BPF); 
figure;
plot(LPF);
title('Smoothed Signal_1(LPF)');

% -------Smoothing Technique 2------------
RMSF=rms1(BPF,800,1,0);
figure;
plot(RMSF);
title('Smoothed Signal_2(ROOT MEAN SQUARE)');

% -------Smoothing Technique 3------------
LMS = LMSFilter(0.008,BPF);
figure
plot(LMS);
title('Smoothed Signal_3(LMS)');

%-----------Smoothing Technique 4------------
windowWidth = 999;
polynomialOrder = 4;
smoothY = sgolayfilt(BPF, polynomialOrder, windowWidth);
figure
plot(smoothY);
title('Smoothed Signal_4(SAVITZKY-GOLAY)');

%-----------Smoothing Technique 5------------
EMGsquared = BPF.^2;
n = 1000; 
coefs = ones(n,1)/n;                            % coefficients for the moving average filter
Smooth = sqrt(conv(EMGsquared, coefs, 'same')); % do the filtering using the convolution function
figure
plot(Smooth);
title('Smoothed Signal_5(MOVING AVERAGE + RMS)');

%-----------Smoothing Technique 6------------
n = 1000;
a = 1;
b = ones(n,1)/n;
Smooth = filter(b,a,BPF);
figure;
plot(Smooth, 'r');
title('Smoothed signal_6(MOVING AVERAGE)');

% %-----------Smoothing Technique 3------------
% c =  smooth(BPF,'sgolay');
% Smooth = reshape(c,700,100);
% figure
% plot(Smooth);
% title('Smoothed Signal_3');