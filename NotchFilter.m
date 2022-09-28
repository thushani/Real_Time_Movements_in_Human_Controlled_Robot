function NF = NotchFilter(fs,f,w,y)

    Wo = f/(fs/2);  
    [b,a] = iirnotch(Wo,w);  
    NF=filter(b, a, y); 
    
end
