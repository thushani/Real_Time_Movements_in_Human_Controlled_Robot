function BPF = BandPassFilter(n,fs,y,min,max)

    beginFreq = min / (fs/2);
    endFreq = max / (fs/2);
    [b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
    BPF=filter(b, a, y);
    
end