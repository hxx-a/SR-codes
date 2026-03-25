clear all;close all;
clc 
fsr=5;
fs=5000;
Ts=1/fs; 
h=1/fsr;   %时间步长 
N=4000;
t=0:Ts:(N-1)*Ts;
D=2;
p=0.7118;u=3.6023;k=0.512;r=1.6764;% 弱频寻优
subplot(2,1,1)
sg=0.15*cos(2*pi*10*t)+sqrt(2*D)*randn(size(t));
plot(t,sg,'k');
hold on
chun=0.5*cos(2*pi*10*t);
plot(t,chun,'y')
subplot(2,1,2)
x1=lgkt(p,u,k,r,h,sg);
plot(t,x1,'k')
%% 频域
figure(2)
subplot(2,1,1)
y0=fft(sg,N);
py0=y0.*conj(y0)/N;
ff=fs*(1:N/2)/N;
po0=py0(2:N/2+1);
plot(ff,po0,'k');
subplot(2,1,2)
y1=fft(x1,N);
py1=y1.*conj(y1)/N;
ff=fs*(1:N/2)/N;
po1=py1(2:N/2+1);
plot(ff,po1,'k');
xlim([0 500])