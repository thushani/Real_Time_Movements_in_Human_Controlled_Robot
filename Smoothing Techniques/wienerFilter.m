function WF = wienerFilter(y)


    [J,noise] = wiener2(y);
    Y=fft(y); 
    FN=fft(y); 
    n=length(y); 
    PY=abs(Y.*Y); 
    H=PY./(PY+ n*std(y)^2); 
    FN=FN.*H; 
    WF=real(ifft(FN)); 

%     N = size(x);
%     h=[0,1,2,3,3,2,1,1]/13; %h(0)=3
%     H(:,1)=fft(h,N);
%     F=fft(y);
%     %convolution
%     g=ifft(F.*H);
% 
%     SNR = mean( y .^ 2 ) / mean( (y-g) .^ 2 );
%     phiN=1/SNR;
% 
%     W = conj(H)./(abs(H).^2 + phiN);
%     G = W.*fft(g);
%     sRestored1 = ifft(G);
%     plot(sRestored1);
% 
% 
%     format short e
%     mse = mean((y-sRestored1).^2)

 
end