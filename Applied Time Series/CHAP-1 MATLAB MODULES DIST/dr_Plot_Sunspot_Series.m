% USAGE: dr_Plot_Sunspot_Series
%

% Created by Prof. H. Bozdogan
%            Department of Business Analytics & Statistics
%            The University of Tennessee
%            Knoxville, TN, 37996, USA
%
%It is free for distribution. Used for Stat 575: Time Series Analysis
%Created: January 13, 2015.  


% Example to demonstrate
%
% Basic syntax
% Writing a script
% Loading ascii data file into matlab
% Calling a "built-in" function
% Plotting a time series
%

% Clear the slate
close all; % close all existing  figure windows
clear; % clear all variables in workspace
clc ; % clear command screen


D=load('yearssn.dat'); % read the file of input data into 2-col numeric matrix D; year is first col,ss number the second col


% Store year as vector yr, sunspot number as vector x
yr=D(:,1);
x= D(:,2);

meanx=mean(x); % calculate mean

%Plot sunspot number and line at mean sunspot number
% h=plot(yr,x,[yr(1) yr(end)],[meanx meanx]);
h=plot(yr,x,'r','Linewidth',2);
xlabel('Year')
ylabel('Number');

% restrict x axis to one year either side of data
xlims = [yr(1)-1 yr(end)+1];
set(gca,'XLim',xlims); % Xlim property of current axis set to xlims

%legend('Zurich Sunspot Number','Mean')
%legend('Zurich Sunspot Number','Mean')
grid on;

% set(h(1),'Marker','o')
% set(gca,'FontSize',14,'XLim',[1850 1950])

figure(1);  % Bring the figure forward on screen