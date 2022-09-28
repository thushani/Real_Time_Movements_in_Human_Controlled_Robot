function LMS = LMSFilter(mu,y)

%mu = 0.008;            % LMS step size.
ha = adaptfilt.lms(32,mu);
LMS = filter(ha,y,y);

end