%% ¸Ä±äa
clear all;close all;clc;
b=0.3;
A=1;
D=linspace(0.01,2,100);
a1=1.5;a2=1.7;a3=2;a4=2.5;
snr1=swsnr(a1,b,D,A);
snr2=swsnr(a2,b,D,A);
snr3=swsnr(a3,b,D,A);
snr4=swsnr(a4,b,D,A);
plot(D,snr1,'-ro','LineWidth',1.5,'MarkerSize',4,'MarkerFaceColor','r')
hold on
plot(D,snr2,'-ms','LineWidth',1.5,'MarkerSize',4,'MarkerFaceColor','m')
plot(D,snr3,'-gd','LineWidth',1.5,'MarkerSize',4,'MarkerFaceColor','g')
plot(D,snr4,'-b*','LineWidth',1.5,'MarkerSize',4,'MarkerFaceColor','r')
xlabel('{\it D}','FontSize', 14,'Fontname', 'Times New Roman','FontWeight','bold');
ylabel('{\it R_s_n}','FontSize', 14,'Fontname', 'Times New Roman','FontWeight','bold');
hLegend=legend('{\it a}=1.5','{\it a}=1.7','{\it a}=2.0','{\it a}=2.5');
set(hLegend, 'FontName', 'Times New Roman', 'FontSize', 12,'Box','off');