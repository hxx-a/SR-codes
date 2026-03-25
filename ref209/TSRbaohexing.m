clear all;close all;
clc
% A=0:0.05:5;
A=0:0.05:3;
fs=5;
Ts=1/fs; 
h=1/fs;   %时间步长 
% t=0:Ts:4000*Ts;
t=0:Ts:4000*Ts;
p=0.1;u=2.7;v=0.2;k=0.1;r=0.2;
c=sqrt(u);d=2*sqrt(u);
% p=0.9;u=2.8;v=0.6;
% c=sqrt(u)-0.1;d=2*sqrt(u)-0.3;
for i=1:length(A)
%     if (i==1||i==2)
%         m(i)=0;
%     else
s=A(i)*cos(2*pi*0.01*t);
x1=lgkt0(c,d,v,h,s);%经典三稳输出
sequence = x1(3001:end);
minValue = min(sequence);
m(i)=(max(x1)-minValue)/2;
%     end
end
% plot(A, m, 'o-', 'Color', 'm', 'LineWidth', 2);  % 绘制图形，使用紫色圆点标记和紫色粗直线连接
plot(A, m, '*-', 'Color', 'm', 'LineWidth', 1); 
hold on
% A=0:0.05:5;
A=0:0.05:3;
fs=5;
Ts=1/fs; 
h=1/fs;   %时间步长 
% t=0:Ts:4000*Ts;
t=0:Ts:4000*Ts;
% p=1.4;u=1.35;
for i=1:length(A)
%     if (i==1||i==2)
%         m(i)=0;
%     else
s=A(i)*cos(2*pi*0.01*t);
x1=lgkt00(p,u,h,s);%一维三稳
sequence = x1(3001:end);
minValue = min(sequence);
m(i)=(max(x1)-minValue)/2;
%     end
end
% plot(A, m, 'bo-', 'LineWidth', 2);  % 绘制图形，使用蓝色圆点标记和蓝色粗直线连接
plot(A, m, '*-', 'Color', 'b', 'LineWidth', 1);  % 绘制图形，使用蓝色星号标记和蓝色粗直线连接
% % grid minor;

% legend({'A0','A'}, 'Location', 'northwest');  % 添加图例标注，指定标签为 "u(x)"，并将位置设置为左上角
hLegend=legend('\itA_0_o_u_t','\itA_o_u_t');
set(hLegend, 'FontName', 'Times New Roman', 'FontSize', 12,'Box','off','Orientation', 'horizontal','Location', 'northwest');
xlabel('{\it A_i_n}','FontSize', 14,'Fontname', 'Times New Roman');
ylabel('{\it A_0_o_u_t&A_o_u_t}','FontSize', 14,'Fontname', 'Times New Roman');
% ylim([0 9])
% hold on
% A=0:0.1:4;
% fs=5;
% Ts=1/fs; 
% h=1/fs;   %时间步长 
% % t=0:Ts:4000*Ts;
% t=0:Ts:4000*Ts;
% % p=1.4;u=1.35;
% for i=1:length(A)
% %     if (i==1||i==2)
% %         m(i)=0;
% %     else
% s=A(i)*cos(2*pi*0.01*t);
% x1=lgkt(p,u,k,r,h,s);%二维三稳
% m(i)=(max(x1)-min(x1))/2;
% %     end
% end
% % plot(A, m, 'bo-', 'LineWidth', 2);  % 绘制图形，使用蓝色圆点标记和蓝色粗直线连接
% plot(A, m, '*-', 'Color', 'y', 'LineWidth', 1);  % 绘制图形，使用蓝色星号标记和蓝色粗直线连接
% legend({'A0','A'}, 'Location', 'northeast');  % 添加图例标注，指定标签为 "u(x)"，并将位置设置为左上角
% ylim([0 9])
grid on;
set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
