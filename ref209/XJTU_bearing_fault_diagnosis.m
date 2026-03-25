clear all;close all;clc
fs=25600;
fsr=5;
Ts=1/fs;
N=20000;
h=1/fsr;
t=0:Ts:(N-1)*Ts;
p=0.0135;k=0.5849;u=3.810;r=0.1457;
p1=0.2218;u1=3.6023;
c=1.510;d=3.3758;v=3.1268;
z=importdata('z.mat');
x2=z(1:20000);
x=0.2*randn(size(t));
x1=x+x2';% x1是1*10000的行向量
y1=hilbert(x1);
yIn=abs(y1);
y1=yIn-mean(y1);
x=lgkt(p,u,k,r,h,y1);
xx=lgkt00(p1,u1,h,y1);
xxx=lgkt0(c,d,v,h,y1);

%% 噪声频谱
y0=fft(x1,N); 
py0=y0.*conj(y0)/N;
ff=fs*(1:N/2)/N; 
po0=py0(2:N/2+1);

%%耦合系统频谱
y1=fft(x,N); 
py1=y1.*conj(y1)/N;
po1=py1(2:N/2+1);

%%一维改进三稳系统频谱
y11=fft(xx,N); 
py11=y11.*conj(y11)/N;
po11=py11(2:N/2+1);
%%一维改进三稳系统频谱
y111=fft(xxx,N); 
py111=y111.*conj(y111)/N;
po111=py111(2:N/2+1);
%% 信噪比增益
ff0=find(ff==107.52);


SNRin = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)));%输入信噪比
SNRout =10*log10( po1(ff0)/(sum(po1)-po1(ff0)));%耦合系统输出信噪比
SNRI=SNRout-SNRin;%耦合系统信噪比增益

SNRout1 =10*log10( po11(ff0)/(sum(po11)-po11(ff0)));%信噪比增益输出信噪比
SNRI1=SNRout1-SNRin;%经典三稳系统信噪比增益
% 
figure(1);set(gcf,'color','white');
subplot(2,1,1);plot(t,x1,'k');xlim([0 0.3])
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po0,'k');xlim([0 6000]);
xlabel('f/Hz');ylabel('Amplitude');

%%
figure(2);set(gcf,'color','white');
subplot(2,1,1);plot(t,x,'k');xlim([0 0.3]);
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po1,'k');xlim([0 3000]);
xlabel('f/Hz');ylabel('Amplitude');

figure(3);set(gcf,'color','white');
subplot(2,1,1);plot(t,xx,'k');xlim([0 0.3]);
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po11,'k');xlim([0 3000]);
xlabel('f/Hz');ylabel('Amplitude');