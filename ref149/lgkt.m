function x=lgkt(a,b,h,s)
x=zeros(1,length(s));
w=zeros(1,length(s));
x(1)=0;
w(1)=0;
for i=1:length(s)-1
 k1_x=(-x(i)^3+(a+1)*x(i)^2-a*x(i)-w(i)+s(i));
 k1_w=(b*x(i)-w(i));
 k2_x=(-(x(i)+k1_x*h/2)^3+(a+1)*(x(i)+k1_x*h/2)^2-a*(x(i)+k1_x*h/2)-(w(i)+k1_w*h/2)+s(i)+h/2);
 k2_w=(b*(x(i)+k1_x*h/2)-(w(i)+k1_w*h/2));
 k3_x=(-(x(i)+k2_x*h/2)^3+(a+1)*(x(i)+k2_x*h/2)^2-a*(x(i)+k2_x*h/2)-(w(i)+k2_w*h/2)+s(i)+h/2);
 k3_w=(b*(x(i)+k2_x*h/2)-(w(i)+k2_w*h/2));
 k4_x=(-(x(i)+k3_x*h)^3+(a+1)*(x(i)+k3_x*h)^2-a*(x(i)+k3_x*h)-(w(i)+k3_w*h)+s(i)+h);
 k4_w=(b*(x(i)+k3_x*h)-(w(i)+k3_w*h));
 x(i+1)=x(i)+(1/6)*h*(k1_x+2*k2_x+2*k3_x+k4_x);
end
end