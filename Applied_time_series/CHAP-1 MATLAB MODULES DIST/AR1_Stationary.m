%USAGE: AR1_Stationary

clear all;
clc;
clf;
close all

randn('seed',sum(clock*1000000)); %Sets the seed to a different value each time.

%Simulate a model with an AR(1) disturbance term  
t = 200;

rho1=0.65        %Set a value of the AR1 coefficient
sigma  = 3;      %Set a value of std for random number generator


yt= zeros(t,1);             %put yt into a zero vector

error_t = sigma*randn(t,1); %generate random error term

%Write the AR1 model 

for i=2:t
    yt(i) = rho1*yt(i-1) + error_t(i);    %AR(1) model y_t=rho1*y_t-1+eps_t where eps_t~iid(o,sigma^2)                                                                  
                                                             
end
y_ar1 = yt;

y_t_1=yt(i-1);

%Plotting

subplot(2,1,1)
 plot(y_ar1, 'b')
 ylabel('yt')
 xlabel('time')
 title('AR1 Stationary')
 
 grid on
 
 %Note the expected value of AR1 Stationary is rho1*yt(i-1):
 %E(y_t|y_t-1)=rho*y_t-1
 
 ExpAR1_Sta=rho1*yt(i-1)
 
 Meanyt=mean(y_ar1)
 
 Std_yt=std(y_ar1)
 
 pause;
 
 disp('------- AR1 Nonstaionary ------')
 
 rho1=1
 
 for i=2:t
    yt(i) = rho1*yt(i-1) + error_t(i);    %AR(1) model y_t=rho1*y_t-1+eps_t where eps_t~iid(o,sigma^2)                                                                  
                                                             
end
y_ar1 = yt;


subplot(2,1,2)
 plot(y_ar1, 'r')
 ylabel('yt')
 xlabel('time')
 title('AR1 Non-stationary')
 
 grid on
 

 %Note the expected value of AR1 Non-stationary is yt(i-1):
 %E(y_t|y_t-1)=y_t-1
 
 ExpAR1_NonSta=yt(i-1)
 
 Meanyt=mean(y_ar1)
 
 Std_yt=std(y_ar1)
 