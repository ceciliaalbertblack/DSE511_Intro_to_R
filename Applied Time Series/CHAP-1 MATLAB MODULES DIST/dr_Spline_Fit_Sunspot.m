% USAGE: dr_Spline_Fit_Sunspot


% Created by Prof. H. Bozdogan
%            Department of Business Analytics & Statistics
%            The University of Tennessee
%            Knoxville, TN, 37996, USA
%
%It is free for distribution. Used for Stat 575: Time Series Analysis
%Created: January 15, 2015 using the Econometrics Toolbox of Matlab.

%--- Extremes of effect of varying spline parameter on spline fit to 
%    sunspot number
%
% Illustrates:
%-call to spline toolbox function csaps
%-effect of varying spline parameter on flexibility
%-"variance explained" statistic as summary of importance of trend


clear;
close all;

% Load data
%load Tsumm; % Data in T, yr
filenm='yearssn.dat';   % filename for input data
% http://www.climate4you.com/Sun.htm

D=load(filenm); %read the file of input data into 2-col numeric matrix D; year is first col,
                %ss number the second col


%Store year as vector yr, sunspot number as vector x
yr=D(:,1); 
x= D(:,2);

T=x; % rename sunspot number variable 



kwhile1=1; % control for outer while-loop
kfirst=1;

%Initial plot of time series

hp1=plot(yr,T,'b','Linewidth',2);
set(hp1,'Linewidth',2);
title('Annual Sunspot Number','FontSize',14);
xlabel('Year','FontSize',14)
ylabel('SS #','FontSize',14);
grid;
zoom xon;
set(gca,'FontSize',12);


pinit=0;        %initial setting of parameter is straight line fit
pold=pinit;

while kwhile1  % Outer while loop 
   kmen1=menu('Choose','Set or change spline parameter','Quit');
   if kmen1==1
       
       
       kwhile2=1;
       while kwhile2==1  % Inner while loop
            prompt={'Enter parameter:'};
           def={num2str(pold)};
           dlgTitle='Spline Parameter (must be between 0 and 1';
           lineNo=1;
           answer=inputdlg(prompt,dlgTitle,lineNo,def);
           p=str2num(answer{1});
           if p<0 | p>1
               uiwait(msgbox('Parameter cannot be <0 ir >1','modal'));
               kwhile2=1;
           else
               kwhile2=0;
               pold=p;
           end
           
       end % while kwhile2==1;
       
      
      %-------- COMPUTE THE SMOOTHING SPLINE
      
      s=csaps(yr,T,p,yr);  %Returns the ppform of a cubic smoothing spline for the
                           %given data X,Y. From spline toolbox
      
      
      %--------- COMPUTE VARIANCE ACCOUNTED FOR BY SPLINE
      
      e = T-s;  % difference of original series and fitted line
      pct=1-var(e)/var(T);
      strpct=['Fraction of variance explained by trend = 1 - var(e)/var(T) = ' num2str(pct,'%6.2f')];
      
      
      % -- Plot original and spline-smoothed series
      hp1=plot(yr,T,yr,s,'Linewidth',2);
      set(hp1(1),'LineWidth',2);
      set(hp1(2),'LineWidth',2);
      title('Spline fit to sunspot number','FontSize',14);
      xlabel('Year','FontSize',14)
      ylabel('Sunspot number','FontSize',14);
      strp=['Spline parameter, p = ', num2str(p)];
      %strp=sprintf('p=%e',p);
      text(1702,171,{strp,strpct},'FontSize',11);
      grid;
      zoom xon;
      set(gca,'FontSize',12);
      figure(1);
      kwhile1=1;
   else
      kwhile1=0;
     
   end
end
