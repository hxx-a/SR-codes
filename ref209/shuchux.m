clear all;close all;
clc 
fs=5;
Ts=1/fs; 
h=1/fs; 
t=0:Ts:4000*Ts;
%% 经典三稳输出
s=0.1*cos(2*pi*0.01*t);
n=0.4*randn(1,length(s));
x=s+n;
a=1;b=1;
xout=jindianshuanglgkt(a,b,h,x);
N=4000;
y01=fft(xout,N)/N;%对长度为10000的信号x1进行频谱分析，得到一个包含频谱信息的复数向量y0
py01=y01.*conj(y01);%计算频谱的功率谱密度（PSD），对复数频谱向量y0中的每个元素进行点乘和共轭操作，然后除以
%FFT长度10000，这样可以得到频谱的幅值平方，表示信号在不同频率上的能量分布
ff=fs*(1:N/2)/N; %谱线之间频率间隔为fs/N，ff是频率刻度
po01=py01(2:N/2+1);
figure(1);set(gcf,'color','white');%set设置图形对象属性
plot(ff,po01,'k');xlim([0,1])
xlabel('频率(Hz)');ylabel('功率谱密度（W/Hz）');
