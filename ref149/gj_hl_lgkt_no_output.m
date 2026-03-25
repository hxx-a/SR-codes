function [x,y]=gj_hl_lgkt(a,b,r,n,h,s)  %n+1维
% x代表中心端输出，共一个中心端输出
% y代表耦合端输出，共n个耦合端输出
% 耦合方式：环连接耦合
% 势函数：中心端为双稳势函数，耦合端为双稳势函数
x=zeros(1,length(s));w=zeros(1,length(s));% w是激发变量
y=zeros(n,length(s));W=zeros(n,length(s));
x(1)=0;
w(1)=0;
y(:,1)=0;
W(:,1)=0;
m_y=zeros(n,4);
m_w=zeros(n,4);
for i=1:length(s)-1
    k1_x=(-x(i)^3+(a+1)*x(i)^2-a*x(i)-w(i)+r*(y(n,i)+y(1,i)-2*(x(i)))+s(i));
    k1_w=(b*x(i)-w(i));
    m_y(1,1)=(-y(1,i)^3+(a+1)*y(1,i)^2-a*y(1,i)-W(1,i)+r*(x(i)+y(2,i)-2*y(1,i)));
    m_w(1,1)=(b*y(1,i)-W(1,i));
    for j=2:n-1
    m_y(j,1)=(-y(j,i)^3+(a+1)*y(j,i)^2-a*y(j,i)-W(j,i)+r*(y(j-1,i)+y(j+1,i)-2*y(j,i)));
    m_w(j,1)=(b*y(j,i)-W(j,i));
    end
    m_y(n,1)=(-y(n,i)^3+(a+1)*y(n,i)^2-a*y(n,i)-W(n,i)+r*(x(i)+y(n-1,i)-2*y(n,i)));
    m_w(n,1)=(b*y(n,i)-W(n,i));
    
    k2_x=(-(x(i)+k1_x*h/2)^3+(a+1)*(x(i)+k1_x*h/2)^2-a*(x(i)+k1_x*h/2)-(w(i)+k1_w*h/2)+r*(y(n,i)+m_y(n,1)*h/2+y(1,i)+m_y(1,1)*h/2-2*(x(i)+k1_x*h/2))+s(i)+h/2);
    k2_w=(b*(x(i)+k1_x*h/2)-(w(i)+k1_w*h/2));
    m_y(1,2)=(-(y(1,i)+m_y(1,1)*h/2)^3+(a+1)*(y(1,i)+m_y(1,1)*h/2)^2-a*(y(1,i)+m_y(1,1)*h/2)-(W(1,i)+m_w(1,1)*h/2)+r*(x(i)+k1_x*h/2+y(2,i)+m_y(2,1)*h/2-2*(y(1,i)+m_y(1,1)*h/2)));
    m_w(1,2)=(b*(y(1,i)+m_y(1,1)*h/2)-(W(1,i)+m_w(1,1)*h/2));
    for j=2:n-1
    m_y(j,2)=(-(y(j,i)+m_y(j,1)*h/2)^3+(a+1)*(y(j,i)+m_y(j,1)*h/2)^2-a*(y(j,i)+m_y(j,1)*h/2)-(W(j,i)+m_w(j,1)*h/2)+r*(y(j-1,i)+m_y(j-1,1)*h/2+y(j+1,i)+m_y(j+1,1)*h/2-2*(y(j,i)+m_y(j,1)*h/2)));
    m_w(j,2)=(b*(y(j,i)+m_y(j,1)*h/2)-(W(j,i)+m_w(j,1)*h/2));
    end
    m_y(n,2)=(-(y(n,i)+m_y(n,1)*h/2)^3+(a+1)*(y(n,i)+m_y(n,1)*h/2)^2-a*(y(n,i)+m_y(n,1)*h/2)-(W(n,i)+m_w(n,1)*h/2)+r*(x(i)+k1_x*h/2+y(n-1,i)+m_y(n-1,1)*h/2-2*(y(n,i)+m_y(n,1)*h/2)));
    m_w(n,2)=(b*(y(n,i)+m_y(n,1)*h/2)-(W(n,i)+m_w(n,1)*h/2));
    
    k3_x=(-(x(i)+k2_x*h/2)^3+(a+1)*(x(i)+k2_x*h/2)^2-a*(x(i)+k2_x*h/2)-(w(i)+k2_w*h/2)+r*(y(n,i)+m_y(n,2)*h/2+y(1,i)+m_y(1,2)*h/2-2*(x(i)+k2_x*h/2))+s(i)+h/2);
    k3_w=(b*(x(i)+k2_x*h/2)-(w(i)+k2_w*h/2));
    m_y(1,3)=(-(y(1,i)+m_y(1,2)*h/2)^3+(a+1)*(y(1,i)+m_y(1,2)*h/2)^2-a*(y(1,i)+m_y(1,2)*h/2)-(W(1,i)+m_w(1,2)*h/2)+r*(x(i)+k2_x*h/2+y(2,i)+m_y(2,2)*h/2-2*(y(1,i)+m_y(1,2)*h/2)));
    m_w(1,3)=(b*(y(1,i)+m_y(1,2)*h/2)-(W(1,i)+m_w(1,2)*h/2));
    for j=2:n-1
    m_y(j,3)=(-(y(j,i)+m_y(j,2)*h/2)^3+(a+1)*(y(j,i)+m_y(j,2)*h/2)^2-a*(y(j,i)+m_y(j,2)*h/2)-(W(j,i)+m_w(j,2)*h/2)+r*(y(j-1,i)+m_y(j-1,2)*h/2+y(j+1,i)+m_y(j+1,2)*h/2-2*(y(j,i)+m_y(j,2)*h/2)));
    m_w(j,3)=(b*(y(j,i)+m_y(j,2)*h/2)-(W(j,i)+m_w(j,2)*h/2));
    end
    m_y(n,3)=(-(y(n,i)+m_y(n,2)*h/2)^3+(a+1)*(y(n,i)+m_y(n,2)*h/2)^2-a*(y(n,i)+m_y(n,2)*h/2)-(W(n,i)+m_w(n,2)*h/2)+r*(x(i)+k2_x*h/2+y(n-1,i)+m_y(n-1,2)*h/2-2*(y(n,i)+m_y(n,2)*h/2)));
    m_w(n,3)=(b*(y(n,i)+m_y(n,2)*h/2)-(W(n,i)+m_w(n,2)*h/2));    
    
    k4_x=(-(x(i)+k3_x*h)^3+(a+1)*(x(i)+k3_x*h)^2-a*(x(i)+k3_x*h)-(w(i)+k3_w*h)+r*(y(n,i)+m_y(n,3)*h+y(1,i)+m_y(1,3)*h-2*(x(i)+k3_x*h))+s(i)+h);
    k4_w=(b*(x(i)+k3_x*h)-(w(i)+k3_w*h));
    m_y(1,4)=h*(-(y(1,i)+m_y(1,3)*h)^3+(a+1)*(y(1,i)+m_y(1,3)*h)^2-a*(y(1,i)+m_y(1,3)*h)-(W(1,i)+m_w(1,3)*h)+r*(x(i)+k3_x*h+y(2,i)+m_y(2,3)*h-2*(y(1,i)+m_y(1,3)*h)));
    m_w(1,4)=h*(b*(y(1,i)+m_y(1,3)*h)-(W(1,i)+m_w(1,3)*h));
    for j=2:n-1
    m_y(j,4)=(-(y(j,i)+m_y(j,3)*h)^3+(a+1)*(y(j,i)+m_y(j,3)*h)^2-a*(y(j,i)+m_y(j,3)*h)-(W(j,i)+m_w(j,3)*h)+r*(y(j-1,i)+m_y(j-1,3)*h+y(j+1,i)+m_y(j+1,3)*h-2*(y(j,i)+m_y(j,3)*h)));
    m_w(j,4)=(b*(y(j,i)+m_y(j,3)*h)-(W(j,i)+m_w(j,3)*h));
    end
    m_y(n,4)=(-(y(n,i)+m_y(n,3)*h)^3+(a+1)*(y(n,i)+m_y(n,3)*h)^2-a*(y(n,i)+m_y(n,3)*h)-(W(n,i)+m_w(n,3)*h)+r*(x(i)+k3_x*h+y(n-1,i)+m_y(n-1,3)*h-2*(y(n,i)+m_y(n,3)*h)));
    m_w(n,4)=(b*(y(n,i)+m_y(n,3)*h)-(W(n,i)+m_w(n,3)*h));    
  
    x(i+1)=x(i)+(1/6)*h*(k1_x+2*k2_x+2*k3_x+k4_x);
    for j=1:n
    y(j,i+1)=y(j,i)+(1/6)*h*(m_y(j,1)+2*m_y(j,2)+2*m_y(j,3)+m_y(j,4));
    end
end
end