%USAGE: AR1_Simulation


% Created by Prof. H. Bozdogan
%            Department of Business Analytics & Statistics
%            The University of Tennessee
%            Knoxville, TN, 37996, USA
%
%It is free for distribution. Used for Stat 575: Time Series Analysis
%Created: January 13, 2015.

clc;
clf;
close all


%The AR(1) process Yt = a.Yt-1 + Wt where a 
%is a constant and Wt is a function of an r.v,
%White noise

w=randn(1000,1);
%a=-.3;

a = [1 .3];
x=filter(1,a,w);                    %The time-series data must be uniformly 
                                    %sampled to use this filter.
                                    %creates filtered data y by processing the 
                                    %data in vectorx with the filter
                                    %described by vectors a and b.
                                    
                                    
                                    
                                    
                                    
c=corrcoef(x(1:(end-1)),x(2:end));  %c is an estimate of
                                    %the ar1 coefficient)
c=c(1,2);

plot(x,'r')
title('AR(1) Time Series Data')