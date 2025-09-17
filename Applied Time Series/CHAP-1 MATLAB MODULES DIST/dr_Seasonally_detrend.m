%USAGE: dr_Seasonally_detrend

% Created by Prof. H. Bozdogan
%            Department of Business Analytics & Statistics
%            The University of Tennessee
%            Knoxville, TN, 37996, USA
%
%It is free for distribution. Used for Stat 575: Time Series Analysis
%Created: January 21, 2015. 


%This module seasonally detrend using separate polynomials for each season's data.

%   [y,psave,ssave]=sdtrend(x,T,n,plfg,descriptor)
%
%   [y,psave,ssave]=sdtrend(x,T,n,plfg,descriptor)
%
%   x = input series
%   T = period
%   n = order of polynomials to fit
%   plfg > 0 to plot series, residuals and seasonal trends
%   descriptor = string for plots

clear;
clc;
clf;
close all

%Simulate some time series or load real data

x=randn(100,1);

[y,psave,ssave]=sdtrend(x,3,3,1,4)