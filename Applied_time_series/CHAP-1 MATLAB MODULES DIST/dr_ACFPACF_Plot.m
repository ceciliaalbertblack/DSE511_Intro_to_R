%USAGE: dr_ACFPACF_Plot


% Created by Prof. H. Bozdogan
%            Department of Business Analytics & Statistics
%            The University of Tennessee
%            Knoxville, TN, 37996, USA
%
%It is free for distribution. Used for Stat 575: Time Series Analysis
%Created: January 21, 2015.  


%This module plots both ACF and PACF for time series data

% Call [ac,pac]=acfpacf(x,nac,npac,plfg,acalpha,pacalpha,descriptor)
%
% x = data vector (column)
% nac = no. acf values to return (<= length(x))
% npac = no. pacf values to return (<=length(x))
% plfg >0 to plot
% acalpha = alpha for acf plot
% pacalpha alpha for pacf plot
% descriptor for plots

clear;
clc;
clf;
close all

%Simulate some time series or load real data

x=randn(500,1);

%Plotting 

figure (1)

plot(x,'r');
hold on
grid on;

title('Original Time Series');
legend('Original Series', 'NorthWest')


figure (2)

[ac,pac]=acfpacf(x,5,5,1,0.05,0.05,3)