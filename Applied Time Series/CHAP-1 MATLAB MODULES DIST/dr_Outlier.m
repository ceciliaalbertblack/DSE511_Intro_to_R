%USAGE: dr_Outlier


% Created by Prof. H. Bozdogan
%            Department of Business Analytics & Statistics
%            The University of Tennessee
%            Knoxville, TN, 37996, USA
%
%It is free for distribution. Used for Stat 575: Time Series Analysis
%Created: January 21, 2015.  



%This module finds outliers in x by using local estimates of sigma and a t test
%
%	[out,mout]=tout(x,win,alpha)
%
% 
%	x = input data vector assumed normal but with outliers
%  win = length of half window 
%  alpha = Pr(false declaration) 
%
%  out = logical (0,1) vector of same size as x; outliers marked by 1, all else 0
%  mout = mean of x in the two half windows


clear all;
clc;
clf;
close all

%Simulate some time series or load real data

x=randn(100,1);

[out,mout]=tout(x,4,0.05)

subplot(211);
plot(x,'r');
title('Original Time Series');
grid on;


subplot(212);
stem(mout,'b');
title('Outliers');
grid on


