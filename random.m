clear;
clc;
pause on;
 rr = zeros(1,10);
h = zeros(1,20);
x = 1:10;
xq = 1: 1/10 : 10;

rr(1) = randi([1 200],1,1);

for j= 2:10 
    
%     rr = zeros(1,j:10);
%     h = zeros(1,j:10);
%     x = j:10;
%     xq = j: 1/10 : 10;
     y = randi([1 200],1,1);
     rr(j) = y;
      pause(1);
      
     xy = interp1(x,rr,xq,'spline');
      
     hold on
     %h(j) = plot(x,rr,'x');
     hold on
     h(j) = plot(xq,xy,'-')
     %end
     if(j > 2)
         delete(h(j-1));
     end
     %set(h(j-1),'Visible','off')
     
   
 end


% x = 0:1/2:10;
%      rr = zeros(1,20);
%      i =1;
%  for j= 1:10
%     r_prev = randi([1 200],1,1);
%     rr(i) = r_prev;
%    % pause(1)
%     hold on
%     scatter(j,r_prev,'x') 
%   %plot(i,r_prev)
%     r_after = randi([1 200],1,1); 
%         rr(i+1) = r_prev;
%     r = interp1(1:10,rr,x,'spline');
%     hold on
%    scatter(j,r_after,'x')
%    hold on
%    scatter(x,r,'x')
%    i = i+1;
%  end



%  x = 0:pi/4:2*pi; 
% v = sin(x);
% xq = 0:pi/16:2*pi;
%  figure
% vq2 = interp1(x,v,xq,'spline');
% plot(x,v,'o',xq,vq2,':.');
% xlim([0 2*pi]);
% title('Spline Interpolation');