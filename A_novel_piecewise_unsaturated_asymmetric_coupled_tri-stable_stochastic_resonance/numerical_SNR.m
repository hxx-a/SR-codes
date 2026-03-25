clear
clc 
fs=5;
Ts=1/fs;N=10000;
h=1/fs;   
t=0:Ts:(N-1)*Ts;
D=0.01:0.1:10;%1 1 0.3   1.5 0.8 0.005 0.5
a=0.5;b=0.5;lamda=1.2;p=0.2;r=0.1;
ap=0.5;bp=0.5;lamdap=1.2;e=0.1;tao=2;
A=0.1;
s=A*cos(2*pi*0.01*t); 
ff=fs*(1:5000)/N; 
% ‰»Î–≈∫≈≤®–Œ  
SNRin=zeros(1,length(D));SNR=zeros(1,length(D));SNRc=zeros(1,length(D));SNRp=zeros(1,length(D));
SNRout=zeros(1,length(D));SNRoutc=zeros(1,length(D));SNRoutp=zeros(1,length(D));
for i=1:length(D)
    In=s+sqrt(2*D(i))*randn(size(t));
    y0=fft(In); 
    py0=y0.*conj(y0)/N;
    po0=py0(1:N/2-1);
    x=ohpalgkt(a,b,lamda,p,r,h,In);
    xd=ohpalgkt(a,b,1,p,r,h,In);
    xc=ctlgkt(1,1,1,h,In);
    xp=patlgkt(ap,bp,lamdap,e,tao,h,In);
    y=fft(x);  
    yc=fft(xc);  
    yp=fft(xp);
    yd=fft(xd);
    pyy=y.*conj(y)/N; 
    pyyc=yc.*conj(yc)/N; 
    pyyp=yp.*conj(yp)/N; 
    pyyd=yd.*conj(yd)/N; 
    po=pyy(1:N/2-1);
    poc=pyyc(1:N/2-1);
    pop=pyyp(1:N/2-1);
    pod=pyyd(1:N/2-1);
    ff0=find(ff==0.01);
    SNRin(i) = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)));
    SNRout(i) =10*log10( po(ff0)/(sum(po)-po(ff0)));
    SNRoutc(i) =10*log10( poc(ff0)/(sum(poc)-poc(ff0)));
    SNRoutp(i) =10*log10( pop(ff0)/(sum(pop)-pop(ff0)));
    SNRoutd(i) =10*log10( pod(ff0)/(sum(pod)-pod(ff0)));
    SNR(i) =SNRout(i)-SNRin(i);
    SNRc(i) =SNRoutc(i)-SNRin(i);
    SNRp(i) =SNRoutp(i)-SNRin(i);
    SNRd(i) =SNRoutd(i)-SNRin(i);
end
figure(1);
p0=polyfit(D,SNR,10);
snr1=polyval(p0,D);
plot(D,snr1,'-r^');
hold on
p0d=polyfit(D,SNRd,10);
snrd=polyval(p0d,D);
plot(D,snrd,'--r','LineWidth',1.2);
hold on
p0p=polyfit(D,SNRp,10);
snrp=polyval(p0p,D);
plot(D,snrp,'-b*');
hold on
p0c=polyfit(D,SNRc,10);
snrc=polyval(p0c,D);
plot(D,snrc,':co');
xlim([0 8]);

l1=legend('{PNACTSR     ¶À=1.2}','{PNACTSR      ¶À=1}','{PNATDTSR   ¶À=1.2}','{CTSR}','FontName','Times New Roman','FontSize',12,'FontWeight','bold');
xlabel('\it D','FontName','Times New Roman','FontSize',14,'FontWeight','bold');
ylabel('{\it SNRG\rm\bf(dB)}','FontName','Times New Roman','FontSize',14,'FontWeight','bold');