%USAGE: Sim_White_Noise

clear; 
clc; 
close all;

L=10000; %Sample length for the time series
mu=0;
sigma=2;
X=sigma*randn(L,1)+mu;
figure();
subplot(2,1,1)
plot(X,'b');
title(['White noise : \mu_x=',num2str(mu),' \sigma^2=',num2str(sigma^2)])
xlabel('Samples')
ylabel('Sample Values')
grid on;


subplot(2,1,2)
n=1000; %number of Histrogram bins
[f,x]=hist(X,n);
bar(x,f/trapz(x,f),'m'); 
hold on;
%Theoretical PDF of Gaussian Random Variable
g=(1/(sqrt(2*pi)*sigma))*exp(-((x-mu).^2)/(2*sigma^2));
plot(x,g,'r');
hold off; 
grid on;
title('Theoretical PDF and Simulated Histogram of White Gaussian Noise')
legend('Histogram','Theoretical PDF');
xlabel('Bins');
ylabel('PDF f_x(x)');

figure();
Rxx=1/L*conv(flipud(X),X);
lags=(-L+1):1:(L-1);
%Alternative method
%[Rxx,lags] =xcorr(X,'biased');
%The argument 'biased' is used for proper scaling by 1/L
%Normalize auto-correlation with sample length for proper scaling
plot(lags,Rxx);
title('Auto-correlation Function of white noise');
xlabel('Lags')
ylabel('Correlation')
grid on;