function [x1,x2] = VRfankuilgkt(m1, V1, R1, m2, V2, R2, R, r1, r2, r3, A, f0, s)
    x1 = zeros(1, length(s));
    x2 = zeros(1, length(s));
%     fs=12000;%西储数据采样频率
    fs=64000;
    h = R/fs;
    Ts=1/fs;
%     N=10000;%西储
    N=64000;
    t=0:Ts:(N-1)*Ts;
    s1 = s+A* sin(2*pi*f0 .* t);
%前馈级联
for i = 1:length(s1)-1

        k1_x1 = h * (- sign(x1(i))*((abs(x1(i))).^(m1-1)) / 2 + 2 * x1(i) * V1 * exp(-x1(i)^2 / R1^2) / R1^2 + ...
            s1(i)+r1*x1(i)+r2*x2(i));
        k1_x2 = h * (- sign(x2(i))*((abs(x2(i))).^(m2-1)) / 2 + 2 * x2(i) * V2 * exp(-x2(i)^2 / R2^2) / R2^2 + ...
            x1(i)+r3*x2(i));

        k2_x1 = h * (- sign(x1(i)+ k1_x1/2)*((abs(x1(i) + k1_x1/2)).^(m1-1)) / 2 + 2 * (x1(i) + k1_x1/2) * V1 ...
            * exp(-(x1(i) + k1_x1/2)^2 / R1^2) / R1^2 + s1(i)+r1*x1(i)+r2*x2(i));
        k2_x2 = h * (- sign(x2(i)+ k1_x2/2)*((abs(x2(i) + k1_x2/2)).^(m2-1)) / 2 + 2 * (x2(i) + k1_x2/2) * V2 * ...
            exp(-(x2(i) + k1_x2/2)^2 / R2^2) / R2^2 + x1(i)+r3*x2(i));

        k3_x1 = h * (- sign(x1(i)+ k2_x1/2)*((abs(x1(i) + k2_x1/2)).^(m1-1)) / 2 + 2 * (x1(i) + k2_x1/2) * V1 * ...
            exp(-(x1(i) + k2_x1/2)^2 / R1^2) / R1^2 + s1(i)+r1*x1(i)+r2*x2(i));
        k3_x2 = h * (- sign(x2(i)+ k2_x2/2)*((abs(x2(i) + k2_x2/2)).^(m2-1)) / 2 + 2 * (x2(i) + k2_x2/2) * V2 * ...
            exp(-(x2(i) + k2_x2/2)^2 / R2^2) / R2^2 + x1(i)+r3*x2(i));

        k4_x1 = h * (- sign(x1(i)+ k3_x1)*((abs(x1(i) + k3_x1)).^(m1-1)) / 2 + 2 * (x1(i) + k3_x1) * V1 * ...
            exp(-(x1(i) + k3_x1)^2 / R1^2) / R1^2 + s1(i)+r1*x1(i)+r2*x2(i));
        k4_x2 = h * (- sign(x2(i)+ k3_x2)*((abs(x2(i) + k3_x2)).^(m2-1)) / 2 + 2 * (x2(i) + k3_x2) * V2 * ...
            exp(-(x2(i) + k3_x2)^2 / R2^2) / R2^2 + x1(i)+r3*x2(i));

        x1(i+1) = x1(i) + (1/6) * (k1_x1 + 2*k2_x1 + 2*k3_x1 + k4_x1);
        x2(i+1) = x2(i) + (1/6) * (k1_x2 + 2*k2_x2 + 2*k3_x2 + k4_x2);
end