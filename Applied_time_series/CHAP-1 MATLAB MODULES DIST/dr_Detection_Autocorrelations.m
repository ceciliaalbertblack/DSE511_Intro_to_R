%USAGE: dr_Detection_Autocorr


% Created by Prof. H. Bozdogan
%            Department of Business Analytics & Statistics
%            The University of Tennessee
%            Knoxville, TN, 37996, USA
%
%It is free for distribution. Used for Stat 575: Time Series Analysis
%Created: January 27, 2015 using the Econometrics Toolbox of Matlab.
%Detecting autocorrelations in a time series

clear;
clc;
clf;
close all

%Load or enter the time series data set

load(fullfile(matlabroot,'examples','econ','Data_Overshort.mat'))
Y = Data;
N = length(Y);

%Plot of time series
figure (1)
plot(Y,'r','Linewidth',2)
xlim([0,N])
title('Overshorts for 57 Consecutive Days')

%Plot the sample autocorrelation function (ACF) and partial autocorrelation function (PACF)

figure (2)
subplot(2,1,1)
autocorr(Y)
subplot(2,1,2)
parcorr(Y)

%Estimate the mean

mu_hat= mean(Y)
stan_dev=std(Y)

%Store ACF and PACF values up to lag 15.

acf = autocorr(Y,15);
pacf = parcorr(Y,15);
[length(acf) length(pacf)]


%Conduct the Ljung-Box Q-test for autocorrelation at lags 5, 10, and 15.

[h,p,Qstat,crit] = lbqtest(Y,'Lags',[5,10,15])  %Call the lbqtest function for the Ljung-Box Q-test 

