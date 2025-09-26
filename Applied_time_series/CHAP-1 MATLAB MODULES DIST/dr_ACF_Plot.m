%USAGE: dr_ACF_Plot

% Created by Prof. H. Bozdogan
%            Department of Business Analytics & Statistics
%            The University of Tennessee
%            Knoxville, TN, 37996, USA
%
%It is free for distribution. Used for Stat 575: Time Series Analysis
%Created: January 20, 2015. 

clear; 
clc; 
close all;

% Create an MA(2) process from a sequence of 100 Gaussian random numbers, then
% visually assess whether the ACF is effectively zero for lags > 2:
%
randn('state',0)               % Start from a known state.

x = randn(100,1);             % 100 Gaussian random numbers ~ N(0,1).
y = filter([1 -1 1] , 1 , x);  % Create an MA(2) process using the filter function


subplot(2,1,1);
plot(y,'b');
xlabel('t'); 
ylabel('yt-Time Seres');
title('MA(2) Process')
grid on;

subplot(2,1,2);

autocorr(y , [] , 2)         % Inspect the ACF with 95% confidence.

xlabel('Lags');
ylabel('Autocorrelations');

grid on;