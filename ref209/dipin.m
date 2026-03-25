clear all;close all;
clc 
fs=5;
Ts=1/fs; 
h=1/fs;   %时间步长 
N=4000;
t=0:Ts:3999*Ts;
D=0.42;
p=0.1118;u=3.6023;k=0.1112;r=0.8764;% 低频低噪性能好参数
%% 时域
subplot(2,1,1)
s=0.5*cos(2*pi*0.02*t)+sqrt(2*D)*randn(size(t));
plot(t,s,'k');
ylim([-5 5])
hold on
chun=0.5*cos(2*pi*0.02*t);
plot(t,chun,'y');
subplot(2,1,2)
x1=lgkt(p,u,k,r,h,s);
plot(t,x1,'k')
ylim([-5 5])
%% 频域
figure(2)
subplot(2,1,1)
y0=fft(s,4000);
py0=y0.*conj(y0)/4000;
ff=fs*(1:2000)/4000;
po0=py0(2:2001);
plot(ff,po0,'k');
xlim([0 0.5])
subplot(2,1,2)
y1=fft(x1,4000);
py1=y1.*conj(y1)/4000;
ff=fs*(1:2000)/4000;
po1=py1(2:2001);
plot(ff,po1,'k');
xlim([0 0.5])