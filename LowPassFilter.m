function LPF = LowPassFilter(fs,Fc,N,input)

%     Fc  % Cut-off frequency 
%     N   % Filter Order
    [B, A] = butter(N,Fc*2/fs, 'low');  
    LPF=filter(B, A, input);   
    
end