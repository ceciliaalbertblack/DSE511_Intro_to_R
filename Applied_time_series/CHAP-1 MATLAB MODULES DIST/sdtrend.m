function [y,psave,ssave]=sdtrend(x,T,n,plfg,descriptor)
%
%   [y,psave,ssave]=sdtrend(x,T,n,plfg,descriptor)
%
% x = input series
% T = period
% n = order of polynomials to fit
% plfg > 0 to plot series, residuals and seasonal trends
% descriptor = string for plots

if plfg
    %f1=figure;
    subplot(211);
    plot(x,'Linewidth',2);
    title([descriptor,' with seasonal polys of degree : ',int2str(n)]);
    hold on;
end
colors=['y';'m';'c';'r';'g';'b'];
ncols=6;
colper=ncols;
if T < ncols
    colper=T;
end
nx=length(x);
resid0=zeros(size(x));
ssave=[];
psave=[];
%legstr=descriptor;
legstr=[];
cnum=1;
for j=1:T
    indexes=[j:T:nx];       % get the indexes starting at j and skipping by T
    xs=x(indexes);          % xs is x sampled at these indexes
    [pout,sout]=polyfit(indexes',xs,n);
    ssave=[ssave;sout];
    psave=[psave;pout];
    y=polyval(pout,indexes)'; % make it a column
    if plfg
        %figure(f1);
        hold on;
        plot(indexes',y,colors(cnum),'Linewidth',2);
        legstr=[legstr;sprintf('s = %0.2d',j)];
        cnum=rem(cnum,colper)+1;
    end
    resid0(indexes)=x(indexes)-y;
    
end
y=resid0;
if plfg
    % put on the legend for last plot
    legend(legstr);   % 2 puts legend in upper left corner
    hold off;
    
    %figure;
    subplot(212);
    plot(resid0,'Linewidth',2);
    title([descriptor,'resids from sdtrend with polys of degree : ',int2str(n)]);
end