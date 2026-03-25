clear all; close all;clc;
fs=5;
Ts=1/fs; 
h=1/fs;
a=0.5;
%a=0.5;
b=0.3;
r=0.1;
N=10000;
t=0:Ts:N-1*Ts;
ff=fs*(1:N/2)/N;
n=9;
        noise=sqrt(2*1)*randn(1,length(t));
        s=0.01*cos(2*pi*0.01*t)+noise;
        [x1,y1]=gj_ql_lgkt_no_output(a,b,r,n-1,h,s);% 全连接改进单输入
        [x2,y2]=gj_dl_lgkt_no_output(a,b,r,n-1,h,s);% 单连接改进单输入
        [x3,y3]=gj_sx_lgkt_no_output(a,b,r,n-1,h,s);% 双连接改进单输入
        [x4,y4]=gj_hl_lgkt_no_output(a,b,r,n-1,h,s);% 环连接改进单输入
        %频谱分析
        py0=fft(s,N).*conj(fft(s,N))/N;
        po0=py0(2:N/2+1);
        px1=fft(x1,N);  
        py1=fft(y1(1,:),N);
        px2=fft(x2,N);  
        py2=fft(y2(1,:),N);
        px3=fft(x3,N);  
        py3=fft(y3(8,:),N);
        px4=fft(x4,N);  
        py4=fft(y4(8,:),N);
        %功率
        ppx1=px1.*conj(px1)/10000; 
        ppy1=py1.*conj(py1)/10000;
        ppx2=px2.*conj(px2)/10000; 
        ppy2=py2.*conj(py2)/10000;
        ppx3=px3.*conj(px3)/10000; 
        ppy3=py3.*conj(py3)/10000;
        ppx4=px4.*conj(px4)/10000; 
        ppy4=py4.*conj(py4)/10000;
        %单边谱
        pos=py0(2:N/2+1);
        pox1=ppx1(2:N/2+1);
        poy1=ppy1(2:N/2+1);
        pox2=ppx2(2:N/2+1);
        poy2=ppy2(2:N/2+1);
        pox3=ppx3(2:N/2+1);
        poy3=ppy3(2:N/2+1);
        pox4=ppx4(2:N/2+1);
        poy4=ppy4(2:N/2+1);
        ff0=find(ff==0.01);
        SNRin = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)));
        SNRx1 =10*log10( pox1(ff0)/(sum(pox1)-pox1(ff0)));        
        SNRy1 =10*log10( poy1(ff0)/(sum(poy1)-poy1(ff0)));
        SNRx2 =10*log10( pox2(ff0)/(sum(pox2)-pox2(ff0)));        
        SNRy2 =10*log10( poy2(ff0)/(sum(poy2)-poy2(ff0))); 
        SNRx3 =10*log10( pox3(ff0)/(sum(pox3)-pox3(ff0)));        
        SNRy3 =10*log10( poy3(ff0)/(sum(poy3)-poy3(ff0))); 
        SNRx4 =10*log10( pox4(ff0)/(sum(pox4)-pox4(ff0)));        
        SNRy4 =10*log10( poy4(ff0)/(sum(poy4)-poy4(ff0))); 

figure(1)
subplot(2,1,1)
plot(t,s,'b');xlim([5,500]); 
xlabel('{t/s}','FontSize', 10,'Fontname', 'Times New Roman');
ylabel('{Amplitude}','FontSize', 10,'Fontname', 'Times New Roman');

subplot(2,1,2)
plot(ff,pos);xlim([0 0.8])
xlabel('{f/Hz}','FontSize', 10,'Fontname', 'Times New Roman');
ylabel('{Amplitude}','FontSize', 10,'Fontname', 'Times New Roman');
figure(2)
subplot(2,4,1)
plot(t,y1(1,:),'b');xlim([5,500])
xlabel('{t/s}','FontSize', 10,'Fontname', 'Times New Roman');
ylabel('{Amplitude}','FontSize', 10,'Fontname', 'Times New Roman');

subplot(2,4,5)
plot(ff,poy1);xlim([0 0.2])
xlabel('{f/Hz}','FontSize', 10,'Fontname', 'Times New Roman');
ylabel('{Amplitude}','FontSize', 10,'Fontname', 'Times New Roman');
subplot(2,4,2)
plot(t,y2(1,:),'b');xlim([5,500])
xlabel('{t/s}','FontSize', 10,'Fontname', 'Times New Roman');


subplot(2,4,6)
plot(ff,poy2);xlim([0 0.2])
xlabel('{f/Hz}','FontSize', 10,'Fontname', 'Times New Roman');

subplot(2,4,3)
plot(t,y3(8,:),'b');xlim([5,500])
xlabel('{t/s}','FontSize', 10,'Fontname', 'Times New Roman');
subplot(2,4,7)
plot(ff,poy3);xlim([0 0.2])
xlabel('{f/Hz}','FontSize', 10,'Fontname', 'Times New Roman');
subplot(2,4,4)
plot(t,y4(8,:),'b');xlim([5,500])
xlabel('{t/s}','FontSize', 10,'Fontname', 'Times New Roman');
subplot(2,4,8)
plot(ff,poy4);xlim([0 0.2])
xlabel('{f/Hz}','FontSize', 10,'Fontname', 'Times New Roman');


