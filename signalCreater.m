function signalCreater(n)
clc;

% fclose('all'); % close all open files
% delete(instrfindall); % Reset Com Port 
% 
% ss = serial('COM6');	           % creating object for s COM1
% set(ss,'BaudRate',9600);     % configuring the buad to 9600, rest are set to default
% fopen(ss);                          % open the session
% fprintf(s,'AT')                     % write data (AT in this case) to the port
%pause(1);


%rr11 = fscanf(ss);
pause on;
[y, fs]= wavread('2.wav');
rr = zeros(1,n);
h1 = zeros(1,n);
h2 = zeros(1,n);
x = 1:n;
time=(1:length(y))/fs;
xq = 1: 1/2 : n;
% out = fscanf(ss);
% a = str2double(out);
rr(1) = y(1);
i =2;
r = 0;
s =2;
t = 2;
h1(1) = 0;
h2(1) = 0;
x1 = 1;
while(1)
   x = time(x1:x1+n-1);
   xq = 1: 1/2 : n;

    for j= i:n 
    
%      out1 = fscanf(ss);
%      a = str2double(out1);
      rr(j) = y(t);
     pause(0.0011);
     xy = interp1(x,rr,xq,'spline');
     grid on
     hold on
     h1(s) = plot(xq,xy,'-');
     ylim([-0.2 0.2])
     hold on
     h2(s) = plot(x,rr,'-x');
     
     if((s > 2))
         delete(h1(s-1));
         delete(h2(s-1));
     end
     s = s+1;
     t = t +1;
    end
 x1 = x1+1;
    rr(1:j-1) = rr(2:j);
    i = n;
end
% fclose(s);                          % closing the session
% delete(s);
end
