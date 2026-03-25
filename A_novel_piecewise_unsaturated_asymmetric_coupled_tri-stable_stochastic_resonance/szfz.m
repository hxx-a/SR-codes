clear 
clc 
fs=5;
Ts=1/fs;N=10000;
h=1/fs;   
t=0:Ts:(N-1)*Ts;
a=0.5;b=0.5;lamda=1.2;p=0.2;r=0.2;


A=0.1;
s=A*cos(2*pi*0.01*t); 
ff=(1:5000)/N;

D=2;
In=s+sqrt(2*D)*randn(size(t));

xx=ohpalgkt(a,b,lamda,p,r,h,In);
xd=ohpalgkt(a,b,1,p,r,h,In);
xp=patlgkt(0.5,0.5,1.2,0.01,2,h,In);
xc=ctlgkt(1,1,0.3,h,In);%0.7697,1.9985,0.91479
y0=fft(In); 
py0=y0.*conj(y0)/N;
po0=py0(2:5001);
y=fft(xx); 
yd=fft(xd);
yp=fft(xp); 
yc=fft(xc);
pyy=y.*conj(y)/N; 
pyyd=yd.*conj(yd)/N; 
pyyp=yp.*conj(yp)/N; 
pyyc=yc.*conj(yc)/N; 
po=pyy(2:5001);
pod=pyyd(2:5001);
pop=pyyp(2:5001);
poc=pyyc(2:5001);
% 信噪比增益
ff0=find(ff==0.01);
SNRin = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)));
SNRout =10*log10( po(ff0)/(sum(po)-po(ff0)));
SNRoutd =10*log10( pod(ff0)/(sum(pod)-pod(ff0)));
SNRpout =10*log10( pop(ff0)/(sum(pop)-pop(ff0)));
SNRcout =10*log10( poc(ff0)/(sum(poc)-poc(ff0)));
SNRI=SNRout-SNRin;
SNRId=SNRoutd-SNRin;
SNRIp=SNRpout-SNRin;
SNRIc=SNRcout-SNRin;

figure(1);
subplot(2,1,1);plot(t,In);
hold on 
plot(t,s,'r');
l1=legend('加噪信号','周期信号','FontSize',12);
xlabel('\itt / \rms','FontName','Times New Roman','FontSize',12);
ylabel('幅度(V)','FontSize',12);
% title('(a) Input signal','FontName','Times New Roman','FontSize',12,'FontWeight','bold');
% xlim([50 500]);
subplot(2,1,2);plot(ff,po0);%xlim([0 1]);
xlabel('\itf / \rmHz','FontName','Times New Roman','FontSize',12);
ylabel('功率/频率(W/Hz)','FontSize',12);
figure(2);
subplot(2,1,1);plot(t,xc);
xlabel('\itt / \rms','FontName','Times New Roman','FontSize',12);
ylabel('幅度(V)','FontSize',12);
% title('(b) CTSR','FontName','Times New Roman','FontSize',12,'FontWeight','bold');
xlim([50 500]);
subplot(2,1,2);plot(ff,poc);xlim([0 0.5]);
xlabel('\itf / \rmHz','FontName','Times New Roman','FontSize',12);
ylabel('功率/频率(W/Hz)','FontSize',12);
figure(3);
subplot(2,1,1);plot(t,xp);
xlabel('\itt / \rms','FontName','Times New Roman','FontSize',12);
ylabel('幅度(V)','FontSize',12);
xlim([50 500]);
% title('(c) PTSR','FontName','Times New Roman','FontSize',12,'FontWeight','bold');
subplot(2,1,2);plot(ff,pop);xlim([0 0.5]);
xlabel('\itf / \rmHz','FontName','Times New Roman','FontSize',12);
ylabel('功率/频率(W/Hz)','FontSize',12);
figure(4);
subplot(2,1,1);plot(t,xx);
xlabel('\itt / \rms','FontName','Times New Roman','FontSize',12);
ylabel('幅度(V)','FontSize',12);
xlim([50 500]);
subplot(2,1,2);plot(ff,po);xlim([0 0.5]);
xlabel('\itf / \rmHz','FontName','Times New Roman','FontSize',12);
ylabel('功率/频率(W/Hz)','FontSize',12);     
figure(5);
subplot(2,1,1);plot(t,xd);
xlabel('\itt / \rms','FontName','Times New Roman','FontSize',12);
ylabel('幅度(V)','FontSize',12);
xlim([50 500]);
subplot(2,1,2);plot(ff,pod);xlim([0 0.5]);
xlabel('\itf / \rmHz','FontName','Times New Roman','FontSize',12);
% ylabel('幅度','FontSize',12,'FontWeight','bold');
ylabel('功率/频率(W/Hz)','FontSize',12);