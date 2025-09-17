%USAGE: dr_Seasonal_diff


% Created by Prof. H. Bozdogan
%            Department of Business Analytics & Statistics
%            The University of Tennessee
%            Knoxville, TN, 37996, USA
%
%It is free for distribution. Used for Stat 575: Time Series Analysis
%Created: January 21, 2015. 

%This module computes seasonal differences of a time series.

clear;
clc;
clf;
close all

%Simulate some time series or load real data

x=randn(100,1);

y=sdiff(x,1,1) %call sdiff function 
               %   y=sdiff(x,T,nd)
               %   x = input series
               %   T = period of differencing
               %   nd = no. of times to difference

%Plotting 

figure (1)

subplot(211);
plot(x,'r','Linewidth',2);
title('Original Time Series');
grid on;

subplot(212);
plot(y,'b','Linewidth',2);
title('Differenced Time Series');
grid on

figure (2)

plot(x,'r','Linewidth',2);
hold on
grid on;
plot(y,'b','Linewidth',2)
title('Original and Differenced Time Series');
legend('Original Series','Differenced Series', 'NorthWest')

