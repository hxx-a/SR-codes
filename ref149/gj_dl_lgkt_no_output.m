function [x,y]=gj_dl_lgkt(a,b,r,n,h,s)
% 耦合方式中心端耦合
% r为耦合系数 x和y都是输出端,x是一个中心端，y是n个耦合端
% w和W都是激发变量，分别代入x,y
% j是纵列，代表维度，i是横向序列
x=zeros(1,length(s));w=zeros(1,length(s));% w是激发变量
y=zeros(n,length(s));W=zeros(n,length(s));
x(1)=0;
w(1)=0;
y(:,1)=0;
W(:,1)=0;
m_y=zeros(n,4);
m_w=zeros(n,4);
for i=1:length(s)-1
    k1_x=(-x(i)^3+(a+1)*x(i)^2-a*x(i)-w(i)+r*(sum(y(:,i))-n*(x(i)))+s(i));
    k1_w=(b*x(i)-w(i));
    for j=1:n
    m_y(j,1)=(-y(j,i)^3+(a+1)*y(j,i)^2-a*y(j,i)-W(j,i)+r*(x(i)-y(j,i)));
    m_w(j,1)=(b*y(j,i)-W(j,i));
    end
    k2_x=(-(x(i)+k1_x*h/2)^3+(a+1)*(x(i)+k1_x*h/2)^2-a*(x(i)+k1_x*h/2)-(w(i)+k1_w*h/2)+r*(sum(y(:,i))+sum(m_y(:,1))*h/2-n*((x(i)+k1_x*h/2)))+s(i)+h/2);
    k2_w=(b*(x(i)+k1_x*h/2)-(w(i)+k1_w*h/2));
    for j=1:n
    m_y(j,2)=(-(y(j,i)+m_y(j,1)*h/2)^3+(a+1)*(y(j,i)+m_y(j,1)*h/2)^2-a*(y(j,i)+m_y(j,1)*h/2)-(W(j,i)+m_w(j,1)*h/2)+r*((x(i)+k1_x*h/2)-(y(j,i)+m_y(j,1)*h/2)));
    m_w(j,2)=(b*(y(j,i)+m_y(j,1)*h/2)-(W(j,i)+m_w(j,1)*h/2));
    end
    k3_x=(-(x(i)+k2_x*h/2)^3+(a+1)*(x(i)+k2_x*h/2)^2-a*(x(i)+k2_x*h/2)-(w(i)+k2_w*h/2)+r*(sum(y(:,i))+sum(m_y(:,2))*h/2-n*((x(i)+k2_x*h/2)))+s(i)+h/2);
    k3_w=(b*(x(i)+k2_x*h/2)-(w(i)+k2_w*h/2));
    for j=1:n
    m_y(j,3)=(-(y(j,i)+m_y(j,2)*h/2)^3+(a+1)*(y(j,i)+m_y(j,2)*h/2)^2-a*(y(j,i)+m_y(j,2)*h/2)-(W(j,i)+m_w(j,2)*h/2)+r*((x(i)+k2_x*h/2)-(y(j,i)+m_y(j,2)*h/2)));
    m_w(j,3)=(b*(y(j,i)+m_y(j,2)*h/2)-(W(j,i)+m_w(j,2)*h/2));
    end
    k4_x=(-(x(i)+k3_x*h)^3+(a+1)*(x(i)+k3_x*h)^2-a*(x(i)+k3_x*h)-(w(i)+k3_w*h)+r*(sum(y(:,i))+sum(m_y(:,3)*h)-n*((x(i)+k3_x*h)))+s(i)+h);
    k4_w=(b*(x(i)+k3_x*h)-(w(i)+k3_w*h));
    for j=1:n
    m_y(j,4)=(-(y(j,i)+m_y(j,3)*h)^3+(a+1)*(y(j,i)+m_y(j,3)*h)^2-a*(y(j,i)+m_y(j,3)*h)-(W(j,i)+m_w(j,4)*h)+r*((x(i)+k3_x*h)-(y(j,i)+m_y(j,3)*h)));
    m_w(j,4)=(b*(y(j,i)+m_y(j,3)*h)-(W(j,i)+m_w(j,3)*h));
    end
    x(i+1)=x(i)+(1/6)*h*(k1_x+2*k2_x+2*k3_x+k4_x);    
    for j=1:n
    y(j,i+1)=y(j,i)+(1/6)*h*(m_y(j,1)+2*m_y(j,2)+2*m_y(j,3)+m_y(j,4));
    end
end
end