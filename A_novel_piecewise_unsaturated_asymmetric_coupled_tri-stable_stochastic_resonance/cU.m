clc;
clear all;
x=-3:0.1:3;
a=3;b=6;c=1;
uc1=a/2*x.^2-b/4*x.^4+c/6*x.^6;%cbgry
a=5;b=6;c=1;
uc2=a/2*x.^2-b/4*x.^4+c/6*x.^6;
a=3;b=7;c=1;
uc3=a/2*x.^2-b/4*x.^4+c/6*x.^6;
a=3;b=6;c=1.2;
uc4=a/2*x.^2-b/4*x.^4+c/6*x.^6;
a=7;b=6;c=1;
uc5=a/2*x.^2-b/4*x.^4+c/6*x.^6;

figure(1);
plot(x,uc1,'-c*','LineWidth',1.2);
hold on
plot(x,uc2,'--+b','LineWidth',1.2);
hold on
plot(x,uc3,'-dg','LineWidth',1.2);
hold on
plot(x,uc4,'-pr','LineWidth',1.2);
hold on
plot(x,uc5,'-om','LineWidth',1.2);
% xlim([-1 1]);%ylim([1.6 3])
% set( gca, 'XTick', [], 'YTick', [] );%¦Å¦Ó
l1=legend('{\it a=3 b=6 c=1}','{\it a=5 b=6 c=1}','{\it a=3 b=7 c=1}','{\it a=3 b=6 c=1.2}','{\it a=7 b=6 c=1}');
set(l1,'Fontname', 'Times New Roman')
set(gca,'FontName','Times New Roman', 'FontSize', 18);
xlabel('\it x','FontName','Times New Roman','FontSize',18);
ylabel('{\it U\rm_c(\itx\rm)}','FontName','Times New Roman','FontSize',18);