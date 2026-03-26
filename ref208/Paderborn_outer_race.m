clear all;
close all;
clc;

%%%%%%%%%%%%%%%%%%%%%%    载入轴承数据    %%%%%%%%%%%%%%%%%%%%%%
%数据文件中KIxx为内圈数据，KAxx外圈，KBxx内外圈
%数据表Nxx代表转速，N15，1500r/min，与轴承参数共同决定故障频率
%Mxx代表负载力矩，Fxx代表径向力，决定故障信号强度01,10>07,10>07,04
%通前缀20个.m文件，每个文件采集4s数据，采样频率64k，共4*64k个数据点，按需求截取


load("N15_M07_F04_KA04_1.mat")% 载入外圈真实损伤轴承数据（多种同一类型损伤）
Data.Ro = N15_M07_F04_KA04_1.Y;



fs = 64e3;                % 振动、电信号采样频率
t = 4;                    % 数据样本时长4s
Ls = t*fs;                % 原始信号长度
to = 1/fs:1/fs:t;         % 原始信号时间离散序列
fsr = 50;
h = 1/fsr;

%原始数据较长根据运行时间和分辨率进行权衡选择截取长度
%分辨率=fs/信号长度，示例截取分辨率为0.5
tb = 2;                   % 截取振动信号时间段的初始时刻
dt = 1;                   % 截取时长
te = tb + dt;             % 截取振动信号时间段的结束时刻
dLs = dt*fs;              % 截取信号长度
ts = (0:dt*fs-1)/fs + tb; % 截取信号时间序列
index = round((tb*fs+1):(tb+dt)*fs); % 截取信号的索引序列

ff = fs*(1:dLs/2)/dLs;            % 频率分辨率

%轴承参数KI18中标注，具有细微差别
% geo.D = 29.05;            % 节圆直径 KI18
geo.D = 28.55;          % KA04
geo.n = 8;                % 滚动体数量
geo.d = 6.75;             % 滚动体直径
geo.alpha = 0;            % 压力角度数

D=2;
x=sqrt(2*D) * randn(1, length(ts));%加噪


fr.Ro = mean(Data.Ro(4).Data)/60; %外圈损伤轴承转频
BPFO = (geo.n*fr.Ro).*(1-geo.d*cos(geo.alpha)/geo.D)/2;% 外圈故障频率
Rovib_alltime = Data.Ro(7).Data(1:Ls); % 4s真实外圈损伤轴承振动信号
Rovib_cliptime = Rovib_alltime(index); % 截取真实外圈损伤轴承振动信号
ff0=find(ff==round(BPFO));%KA04;
x0=Rovib_cliptime+x;



% Hilbert变换和包络分析
y11 = hilbert(x0);
yIn = abs(y11);
y11 = yIn - mean(yIn);

%%%%%%%%%%%%%%%%%%%%%%    参数设置    %%%%%%%%%%%%%%%%%%%%%%


%KA04
%VR全局寻优
AA = 1.2864125;f0 = 519.32537;RR1 = 1516.0232;
m11 = 1.888563;V11 = 2.6129032;R11 = 2.5366569;m22=2.6158358;V22 = 2.1583578;R22 = 0.16422287;%全局寻优内圈
r111 = 0.74193548;r222 = -0.39002933;r333 = 1.9853372;


%普通级联
a = 2.7575625;b= 0.01025;c=2.9046046;RR3 =1720.5275;

[x2,x1] = VRfankuilgkt(m11, V11, R11, m22, V22, R22, RR1, r111, r222, r333,AA,f0, y11);

x5 = lgktshihan(a, b, c, RR3, y11); % 改进
x6 = lgktshihan(a, b, c, RR3, x5);
%%%%%%%%%%%%%%%%%%%%%%    频谱分析及绘图    %%%%%%%%%%%%%%%%%%%%%%

y0 = fft(x0,dLs)/dLs;
py0 = y0.*conj(y0);               % 归一化功率谱
po0 = py0(2:dLs/2+1);
po0(2:end-1) = 2*po0(2:end-1);    % 单边功率谱


y00 = fft(y11,dLs)/dLs;
py00 = y00.*conj(y00);               % 归一化功率谱
po11 = py00(2:dLs/2+1);
po11(2:end-1) = 2*po11(2:end-1);    % 单边功率谱

y1 = fft(x1,dLs)/dLs;
py1 = y1.*conj(y1);               % 归一化功率谱
po1 = py1(2:dLs/2+1);
po1(2:end-1) = 2*po1(2:end-1);    % 单边功率谱

y2 = fft(x2,dLs)/dLs;
py2 = y2.*conj(y2);               % 归一化功率谱
po2 = py2(2:dLs/2+1);
po2(2:end-1) = 2*po2(2:end-1);    % 单边功率谱


y5 = fft(x5,dLs)/dLs;
py5 = y5.*conj(y5);               % 归一化功率谱
po5 = py5(2:dLs/2+1);
po5(2:end-1) = 2*po5(2:end-1);    % 单边功率谱

y6 = fft(x6,dLs)/dLs;
py6 = y6.*conj(y6);               % 归一化功率谱
po6 = py6(2:dLs/2+1);
po6(2:end-1) = 2*po6(2:end-1);    % 单边功率谱


[~,ff1] = max(po1);%找到po1最大功率谱密度对应频点
[~,ff2] = max(po2);
[~,ff5] = max(po5);
[~,ff6] = max(po6);

% ff0 = find(ff == 76);

SNRin = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)));%输入信噪比
SNRy1 = 10*log10(po11(ff0)/(sum(po11)-po11(ff0))); %包络信号信噪比
SNRout1 =10*log10( po1(ff1)/(sum(po1)-po1(ff1)));%信噪比增益输出信噪比
SNRI1=SNRout1-SNRin;%改进势函数第一级信噪比增益
SNRout2 =10*log10( po2(ff2)/(sum(po2)-po2(ff2)));%信噪比增益输出信噪比
SNRI2=SNRout2-SNRin;%改进势函数第一级信噪比增益
SNRout5 =10*log10( po5(ff1)/(sum(po5)-po5(ff1)));%信噪比增益输出信噪比
SNRI5=SNRout5-SNRin;%改进势函数第二级信噪比增益
SNRout6 =10*log10( po6(ff1)/(sum(po6)-po6(ff1)));%信噪比增益输出信噪比
SNRI6=SNRout6-SNRin;%改进势函数第二级信噪比增益

% 绘图
figure(1); set(gcf,'color','white');
subplot(2,1,1); plot(ts,x0,'b'); xlim([2 3])
xlabel('t/s'); ylabel('Amplitude');
subplot(2,1,2); plot(ff,po0,'b'); xlim([0 1000]);
xlabel('f/Hz'); ylabel('Amplitude');
ylim_values = ylim;
total_height = ylim_values(2)-ylim_values(1);
height_fig = ylim_values(1)+total_height*0.9;
text(ff(750), height_fig, sprintf('SNRIN=%.2f dB', SNRin), 'Color', 'red', 'FontSize', 10);


figure(2); set(gcf,'color','white');
subplot(2,1,1); plot(ts,y11,'b'); xlim([2 3])
xlabel('t/s'); ylabel('Amplitude');
subplot(2,1,2); plot(ff,po11,'b'); xlim([0 1000]);
xlabel('f/Hz'); ylabel('Amplitude');
ylim_values = ylim;
total_height = ylim_values(2)-ylim_values(1);
height_fig = ylim_values(1)+total_height*0.9;
text(ff(750), height_fig, sprintf('SNR=%.2f dB', SNRy1), 'Color', 'red', 'FontSize', 10);


figure(3); set(gcf,'color','white');
subplot(2,1,1); plot(ts,x1,'b'); xlim([2 3])
xlabel('t/s'); ylabel('Amplitude');
subplot(2,1,2); plot(ff,po1,'b'); xlim([0 1000]);
xlabel('f/Hz'); ylabel('Amplitude');
ylim_values = ylim;
total_height = ylim_values(2)-ylim_values(1);
height_fig1 = ylim_values(1)+total_height*0.9;
height_fig2 = ylim_values(1)+total_height*0.8;
text(ff(750), height_fig1, sprintf('SNRout=%.2f dB', SNRout2), 'Color', 'blue', 'FontSize', 10);
text(ff(750), height_fig2, sprintf('SNRI=%.2f dB', SNRI2), 'Color', 'red', 'FontSize', 10);

figure(4); set(gcf,'color','white');
subplot(2,1,1); plot(ts,x2,'b'); xlim([2 3])
xlabel('t/s'); ylabel('Amplitude');
subplot(2,1,2); plot(ff,po2,'b'); xlim([0 1000]);
xlabel('f/Hz'); ylabel('Amplitude');
ylim_values = ylim;
total_height = ylim_values(2)-ylim_values(1);
height_fig1 = ylim_values(1)+total_height*0.9;
height_fig2 = ylim_values(1)+total_height*0.8;
text(ff(750), height_fig1, sprintf('SNRout=%.2f dB', SNRout2), 'Color', 'blue', 'FontSize', 10);
text(ff(750), height_fig2, sprintf('SNRI=%.2f dB', SNRI2), 'Color', 'red', 'FontSize', 10);

figure(7); set(gcf,'color','white');
subplot(2,1,1); plot(ts,x5,'b'); xlim([2 3])
xlabel('t/s'); ylabel('Amplitude');
subplot(2,1,2); plot(ff,po5,'b'); xlim([0 1000]);
xlabel('f/Hz'); ylabel('Amplitude');
ylim_values = ylim;
total_height = ylim_values(2)-ylim_values(1);
height_fig1 = ylim_values(1)+total_height*0.9;
height_fig2 = ylim_values(1)+total_height*0.8;
text(ff(1450), height_fig1, sprintf('SNRout=%.2f dB', SNRout5), 'Color', 'blue', 'FontSize', 10);
text(ff(1450), height_fig2, sprintf('SNRI=%.2f dB', SNRI5), 'Color', 'red', 'FontSize', 10);

figure(8); set(gcf,'color','white');
subplot(2,1,1); plot(ts,x6,'b'); xlim([2 3])
xlabel('t/s'); ylabel('Amplitude');
subplot(2,1,2); plot(ff,po6,'b'); xlim([0 1000]);
xlabel('f/Hz'); ylabel('Amplitude');
ylim_values = ylim;
total_height = ylim_values(2)-ylim_values(1);
height_fig1 = ylim_values(1)+total_height*0.9;
height_fig2 = ylim_values(1)+total_height*0.8;
text(ff(1450), height_fig1, sprintf('SNRout=%.2f dB', SNRout6), 'Color', 'blue', 'FontSize', 10);
text(ff(1450), height_fig2, sprintf('SNRI=%.2f dB', SNRI6), 'Color', 'red', 'FontSize', 10);