function x=patlgkt(a,b,lamda,e,tao,h,x1)
xf=1.056*b/a+1.2;
xz=1.056*lamda*b/a+1.2*lamda;
x=zeros(1,length(x1));
x(1)=0.01;
for i=1:length(x1)-1
    if x(i)<-1.2
        k1=(1+e*tao)*(e*x(i)-a*(x(i)+xf)+x1(i));
        k2=(1+e*tao)*(e*(x(i)+h*k1/2)-a*((x(i)+h*k1/2)+xf)+x1(i)+h/2);
        k3=(1+e*tao)*(e*(x(i)+h*k2/2)-a*((x(i)+h*k2/2)+xf)+x1(i)+h/2);
        k4=(1+e*tao)*(e*(x(i)+h*k3)-a*((x(i)+h*k3)+xf)+x1(i)+h);
        x(i+1)=x(i)+(1/6)*h*(k1+2*k2+2*k3+k4);
    elseif x(i)>=-1.2 && x(i)<0
        k1=(1+e*tao)*(e*x(i)+2*b*x(i)^3-2*b*x(i)+x1(i));
        k2=(1+e*tao)*(e*(x(i)+h*k1/2)+2*b*(x(i)+h*k1/2)^3-2*b*(x(i)+h*k1/2)+x1(i)+h/2);
        k3=(1+e*tao)*(e*(x(i)+h*k2/2)+2*b*(x(i)+h*k2/2)^3-2*b*(x(i)+h*k2/2)+x1(i)+h/2);
        k4=(1+e*tao)*(e*(x(i)+h*k3)+2*b*(x(i)+h*k3)^3-2*b*(x(i)+h*k3)+x1(i)+h);
        x(i+1)=x(i)+(1/6)*h*(k1+2*k2+2*k3+k4);
    elseif x(i)>=0 && x(i)<1.2*lamda
        k1=(1+e*tao)*(e*x(i)+2*b*x(i)^3/(lamda^2)-2*b*x(i)++x1(i));
        k2=(1+e*tao)*(e*(x(i)+h*k1/2)+(2*b*(x(i)+h*k1/2)^3)/(lamda^2)-2*b*(x(i)+h*k1/2)+x1(i)+h/2);
        k3=(1+e*tao)*(e*(x(i)+h*k2/2)+(2*b*(x(i)+h*k2/2)^3)/(lamda^2)-2*b*(x(i)+h*k2/2)+x1(i)+h/2);
        k4=(1+e*tao)*(e*(x(i)+h*k3)+(2*b*(x(i)+h*k3)^3)/(lamda^2)-2*b*(x(i)+h*k3)+x1(i)+h);
        x(i+1)=x(i)+(1/6)*h*(k1+2*k2+2*k3+k4);
    elseif x(i)>=1.2*lamda
        k1=(1+e*tao)*(e*x(i)-a*(x(i)-xz)+x1(i));
        k2=(1+e*tao)*(e*(x(i)+h*k1/2)-a*((x(i)+h*k1/2)-xz)+x1(i)+h/2);
        k3=(1+e*tao)*(e*(x(i)+h*k2/2)-a*((x(i)+h*k2/2)-xz)+x1(i)+h/2);
        k4=(1+e*tao)*(e*(x(i)+h*k3)-a*((x(i)+h*k3)-xz)+x1(i)+h);
        x(i+1)=x(i)+(1/6)*h*(k1+2*k2+2*k3+k4);
    end
end
end