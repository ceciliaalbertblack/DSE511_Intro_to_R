%USAGE: dr_ACF_PACF_Plot.m


% Created by Prof. H. Bozdogan
%            Department of Business Analytics & Statistics
%            The University of Tennessee
%            Knoxville, TN, 37996, USA
%
%It is free for distribution. Used for Stat 575: Time Series Analysis
%Created: January 17, 2018.

clear;clc;clf;
close all

%Load the time series of overshorts.

% load(fullfile(matlabroot,'examples','econ','Data_Overshort.mat'))
% 
% Y = Data;
% N = length(Y);
% figure
% plot(Y,'r','LineWidth',2)
% xlim([0,N])
% title('Overshorts for 57 Consecutive Days')

%Simulate some time series or load real data

Y=randn(500,1);

%Plotting 

figure (1)

plot(Y,'r','LineWidth',2);
hold on
grid on;

title('Original Time Series');
legend('Original Series')


figure (2)
subplot(2,1,1)
autocorr(Y)
subplot(2,1,2)
parcorr(Y)

%Store the sample ACF and PACF values up to lag 15.
acf = autocorr(Y,10);
pacf = parcorr(Y,10);
[length(acf) length(pacf)]





