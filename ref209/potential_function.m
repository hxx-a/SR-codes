clear all;close all;clc;
p=0.3;u=2.7;v=0.2;
x=-5:0.01:5;
u2=((-p/(2.*u)).*(x+sqrt(u)).^2+(p/(4.*u.*u)).*(x+sqrt(u)).^4+p/4).*(x<0)+((-p/(2.*u)).*(x-sqrt(u)).^2+(p/(4.*u.*u)).*(x-sqrt(u)).^4+p/4).*(x>=0);
originalColor = [0 0 1];  % 蓝色，[R G B] = [0 0 1]
% 加深颜色
darkenedColor = originalColor * 0.9;  % 将颜色值乘以0.7来加深颜色深度
figure
% 绘制加深后的线条
plot(x, u2, 'Color', darkenedColor, 'LineWidth', 2.5);
xlabel('\itx','FontName','Times New Roman','FontSize',15);
ylabel('\itU(x)&U_0(x)','FontName','Times New Roman','FontSize',15);

hold on
c=sqrt(u);d=2*sqrt(u);
% c=sqrt(u);d=2*sqrt(u)-0.2;
u0=6.*v.*x.^2/(c.^2+d.^2)-3.*v.*x.^4/(c.^2.*d.^2)+2.*v.*x.^6/((c.^2.*d.^2).*(c.^2+d.^2));
% plot(x,u0,'--','Color', 'm', 'LineWidth', 2.5);
% 原始颜色
originalColor = [1 0 1];  % 洋红色，[R G B] = [1 0 1]

% 加深颜色
darkenedColor = originalColor * 0.9;  % 将颜色值乘以0.7来加深颜色深度

% 绘制加深后的虚线
plot(x, u0, '--', 'Color', darkenedColor, 'LineWidth', 2.5);

ylim([-0.5 1.5])
hold on
circleSize = 35;  % 实心圆的尺寸大小
x=-2*sqrt(u);u0=6.*v.*x.^2/(c.^2+d.^2)-3.*v.*x.^4/(c.^2.*d.^2)+2.*v.*x.^6/((c.^2.*d.^2).*(c.^2+d.^2));
% scatter(x, u0,circleSize, 'filled', 'MarkerFaceColor', 'r');  % 在指定坐标点上标记一个实心圆
% 原始颜色
originalColor = [0 0 0];  % 红色，[R G B] = [1 0 0]

% 加深颜色
darkenedColor = originalColor * 0.9;  % 将颜色值乘以0.7来加深颜色深度

% 绘制加深后的实心圆
scatter(x, u0, circleSize, 'filled', 'MarkerFaceColor', darkenedColor);

x=-sqrt(u);u0=6.*v.*x.^2/(c.^2+d.^2)-3.*v.*x.^4/(c.^2.*d.^2)+2.*v.*x.^6/((c.^2.*d.^2).*(c.^2+d.^2));
scatter(x, u0,circleSize, 'filled', 'MarkerFaceColor', darkenedColor);  % 在指定坐标点上标记一个实心圆
x=0;u0=6.*v.*x.^2/(c.^2+d.^2)-3.*v.*x.^4/(c.^2.*d.^2)+2.*v.*x.^6/((c.^2.*d.^2).*(c.^2+d.^2));
scatter(x, u0,circleSize, 'filled', 'MarkerFaceColor', darkenedColor);  % 在指定坐标点上标记一个实心圆
x=sqrt(u);u0=6.*v.*x.^2/(c.^2+d.^2)-3.*v.*x.^4/(c.^2.*d.^2)+2.*v.*x.^6/((c.^2.*d.^2).*(c.^2+d.^2));
scatter(x, u0,circleSize, 'filled', 'MarkerFaceColor',darkenedColor);  % 在指定坐标点上标记一个实心圆
x=2*sqrt(u);u0=6.*v.*x.^2/(c.^2+d.^2)-3.*v.*x.^4/(c.^2.*d.^2)+2.*v.*x.^6/((c.^2.*d.^2).*(c.^2+d.^2));
scatter(x, u0,circleSize, 'filled', 'MarkerFaceColor',darkenedColor);  % 在指定坐标点上标记一个实心圆

x=-2*sqrt(u);u2=((-p/(2.*u)).*(x+sqrt(u)).^2+(p/(4.*u.*u)).*(x+sqrt(u)).^4+p/4).*(x<0)+((-p/(2.*u)).*(x-sqrt(u)).^2+(p/(4.*u.*u)).*(x-sqrt(u)).^4+p/4).*(x>=0);
scatter(x, u2,circleSize, 'filled', 'MarkerFaceColor', darkenedColor);  % 在指定坐标点上标记一个实心圆
x=-sqrt(u);u2=((-p/(2.*u)).*(x+sqrt(u)).^2+(p/(4.*u.*u)).*(x+sqrt(u)).^4+p/4).*(x<0)+((-p/(2.*u)).*(x-sqrt(u)).^2+(p/(4.*u.*u)).*(x-sqrt(u)).^4+p/4).*(x>=0);
scatter(x, u2,circleSize, 'filled', 'MarkerFaceColor', darkenedColor);  % 在指定坐标点上标记一个实心圆
x=0;u2=((-p/(2.*u)).*(x+sqrt(u)).^2+(p/(4.*u.*u)).*(x+sqrt(u)).^4+p/4).*(x<0)+((-p/(2.*u)).*(x-sqrt(u)).^2+(p/(4.*u.*u)).*(x-sqrt(u)).^4+p/4).*(x>=0);
scatter(x, u2,circleSize, 'filled', 'MarkerFaceColor', darkenedColor);  % 在指定坐标点上标记一个实心圆
x=sqrt(u);u2=((-p/(2.*u)).*(x+sqrt(u)).^2+(p/(4.*u.*u)).*(x+sqrt(u)).^4+p/4).*(x<0)+((-p/(2.*u)).*(x-sqrt(u)).^2+(p/(4.*u.*u)).*(x-sqrt(u)).^4+p/4).*(x>=0);
scatter(x, u2,circleSize, 'filled', 'MarkerFaceColor', darkenedColor);  % 在指定坐标点上标记一个实心圆
x=2*sqrt(u);u2=((-p/(2.*u)).*(x+sqrt(u)).^2+(p/(4.*u.*u)).*(x+sqrt(u)).^4+p/4).*(x<0)+((-p/(2.*u)).*(x-sqrt(u)).^2+(p/(4.*u.*u)).*(x-sqrt(u)).^4+p/4).*(x>=0);
scatter(x, u2, circleSize,'filled', 'MarkerFaceColor', darkenedColor);  % 在指定坐标点上标记一个实心圆
% legend('{\it p}=0.3,{\it u}=2.7','{\it c=}=1.64,{\it d}=3.28,{\it v}=0.2')
% legend('\itU（x）','\itU_0(x)','FontName','Times New Roman')
hLegend=legend('\itU(x)','\itU_0(x)');
set(hLegend, 'FontName', 'Times New Roman', 'FontSize', 12,'Box','off');
% legend('\itU(x)', '\itU_0(x)', 'FontName', 'Times New Roman', 'Box', 'off'); % Set the font and remove the legend border
