function x = lgktshihan(m, V, R, h, x1)
    x = zeros(1, length(x1));
%     x(1)=-0.5;
for i = 1:length(x1)-1
        % 计算 k1
        k1 = h * (- sign(x(i))*((abs(x(i))).^(m-1)) / 2 + 2 * x(i) * V * exp(-x(i)^2 / R^2) / R^2 + x1(i));
        % 计算 k2
        k2 = h * (- sign(x(i)+ k1/2)*((abs(x(i) + k1/2)).^(m-1)) / 2 + 2 * (x(i) + k1/2) * V * exp(-(x(i) + k1/2)^2 / R^2) / R^2 + x1(i));
        % 计算 k3
        k3 = h * (- sign(x(i)+ k2/2)*((abs(x(i) + k2/2)).^(m-1)) / 2 + 2 * (x(i) + k2/2) * V * exp(-(x(i) + k2/2)^2 / R^2) / R^2 + x1(i));
        % 计算 k4
        k4 = h * (- sign(x(i)+ k3)*((abs(x(i) + k3)).^(m-1)) / 2 + 2 * (x(i) + k3) * V * exp(-(x(i) + k3)^2 / R^2) / R^2 + x1(i));
        % 使用四阶龙格库塔法迭代求解 x(t)
        x(i+1) = x(i) + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
end