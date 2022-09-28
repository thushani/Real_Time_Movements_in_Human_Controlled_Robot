function MAF = MAFilter(win_width,y)
    h = ones(win_width,1)/win_width;
    binomialCoeff = conv(h,h);
    for n = 1:4
        binomialCoeff = conv(binomialCoeff,h);
    end
    fDelay = (length(binomialCoeff)-1)/2;
    binomialMA = filter(binomialCoeff, 1, y);
    MAF = binomialMA;

% alpha = win_width;
% exponentialMA = filter(alpha, [1 alpha-1], y);
% MAF = exponentialMA;
 
% [envHigh, envLow] = envelope(y,win_width,'peak');
% MAF = (envHigh+envLow)/2;
end