clc;
clear all;

fs = 5;
Ts = 1/fs;
N = 10000;
t = 0:Ts:(N-1)*Ts;
f0 = 0.01;
NN = 10000;
ff = fs * (0:NN/2-1) / NN;
ff0 = find(ff == f0);

m = 1.3; V = 0.4; r = 0.2; % 改进
a = 0.2; b = 0.1; c = 0.5; % 三稳

h = 1/fs;

D = 0;
noise = sqrt(2*D) * randn(1, length(t));
q = 0.01:0.02:4;
mm = zeros(1, length(q));
nn = zeros(1, length(q));
MR1 = zeros(1, length(q));
MR2 = zeros(1, length(q));
AM1 = zeros(1, length(q));
AM2 = zeros(1, length(q));

for n = 1:length(q)
    flag = 0;
    for i = 1:1
        s = q(n) * sin(2*pi*f0 .* t);
        x = s + noise;

        x1 = CTSR_lgkt(a,b,c,h,x);
        x2 = lgktshihan(m, V, r, h, x); % 改进
        
        MR1(n) = max(x1);
        MR2(n) = max(x2);

        flag = flag + 1;

        mm(n) = MR1(n);
        nn(n) = MR2(n);
        
        Am1(n) = mm(n) / flag;
        Am2(n) = nn(n) / flag;
    end
end

% 分段系统输出饱和

A1 = 1;
x1 = A1 * sin(2*pi*0.01.*t);
x_CTSR1 = CTSR_lgkt(a, b, c, h, x1);
x_out1 = lgktshihan(m, V, r, h, x1);

A2 = 2;
x2 = A2 * sin(2*pi*0.01.*t);
x_CTSR2 = CTSR_lgkt(a, b, c, h, x2);
x_out2 = lgktshihan(m, V, r, h, x2);

A3 = 3;
x3 = A3 * sin(2*pi*0.01.*t);
x_CTSR3 = CTSR_lgkt(a, b, c, h, x3);
x_out3 = lgktshihan(m, V, r, h, x3);

figure
plot(q, Am1, 'mo-', 'MarkerSize', 3, 'LineWidth', 0.3); % Red dots for CTSR
hold on;
plot(q, Am2, 'bo-', 'MarkerSize', 3, 'LineWidth', 0.3); % Blue circles connected by lines for VSR
xlabel('Input amplitude');
ylabel('Output amplitude');
lgd0 = legend('TSR', 'MSR','Position', [0.7, 0.8, 0.1, 0.1]);
set(lgd0, 'Box', 'off'); % 移除图例框
grid on;


