%USGAE: dr_Transform_ts


% Created by Prof. H. Bozdogan
%            Department of Business Analytics & Statistics
%            The University of Tennessee
%            Knoxville, TN, 37996, USA
%
%It is free for distribution. Used for Stat 575: Time Series Analysis
%Created: January 27, 2015.  


%In Matlab smoothts function smooths or transforms time series data
%in several ways.

%output = smoothts(input)
%output = smoothts(input, 'b', wsize)        %Box-Cox transformation
%output = smoothts(input, 'g', wsize, stdev) %Gaussian transformation
%output = smoothts(input, 'e', n)            %Exponential smoothing

clear;
clc;
clf;
close all


load disney.mat
weekly = toweekly(dis);
dates = (weekly.dates);
price = fts2mat(weekly.CLOSE);

%yt = smoothts(price, 'e', n)


yt_g = smoothts(price, 'g', 6, 0.65)

n=length(price)
t=1:n;

figure (1)

subplot(211)
plot(price,'r','Linewidth',2)
title('Price series')
grid on;
subplot(212)
plot(yt_g,'b','Linewidth',2)
title('Gaussian smoothing')
grid on

%------------------------------
yt_b = smoothts(price, 'b', 2)   %Size input must be intiger
subplot(211)
plot(price,'r','Linewidth',2)
title('Price series')
grid on;
subplot(212)
plot(yt_b,'b','Linewidth',2)
title('Box smoothing')
grid on

figure (2)

plot(t, yt_g,'r',t,yt_b,'b','Linewidth',2)
legend('Gaussian smoothing','Box smoothing','NothWest')


%----------------------------------

[TRANSDAT, LAMBDA] = boxcox(price)   %Call Matlab's boxcox function


figure (3)

yt_boxcox=TRANSDAT;
plot(t, yt_g,'r',t,yt_b,'b', t, yt_boxcox,'m','Linewidth',2)
legend('Box-Cox Transformation','NothWest')
LAMBDA
