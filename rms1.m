function RMS = rms1(signal, windowlength, overlap, zeropad)
    delta = windowlength - overlap;
    indices = 1:delta:length(signal);
    % Zeropad signal
    if length(signal) - indices(end) + 1 < windowlength
        if zeropad
            signal(end+1:indices(end)+windowlength-1) = 0;
        else
            indices = indices(1:find(indices+windowlength-1 <= length(signal), 1, 'last'));
        end
    end
    RMS = zeros(1, length(indices));
    signal = signal.^2;     % Square the samples
    index = 0;
    for i = indices
        index = index+1;                                    
        RMS(index) = sqrt(mean(signal(i:i+windowlength-1)));    % Average and take the square root of each window
    end
end