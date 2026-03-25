function x=ohpalgkt(a,b,lamda,p,c,h,x1)
xf=1.056*b/a+1.2;
xz=1.056*lamda*b/a+1.2*lamda;
x=zeros(1,length(x1));
y=zeros(1,length(x1));
x(1)=0.01;
y(1)=0.01;
for i=1:length(x1)-1
    if x(i)<-1.2
        k1=(-a*(x(i)+xf)+c*(y(i)-x(i))+x1(i));
        f1=(-p*y(i)+c*(x(i)-y(i)));
        k2=(-a*((x(i)+h*k1/2)+xf)+c*((y(i)+h*f1/2)-(x(i)+h*k1/2))+x1(i)+h/2);
        f2=(-p*(y(i)+h*f1/2)+c*((x(i)+h*k1/2)-(y(i)+h*f1/2)));
        k3=(-a*((x(i)+h*k2/2)+xf)+c*((y(i)+h*f2/2)-(x(i)+h*k2/2))+x1(i)+h/2);
        f3=(-p*(y(i)+h*f2/2)+c*((x(i)+h*k2/2)-(y(i)+h*f2/2)));
        k4=(-a*((x(i)+h*k3)+xf)+c*((y(i)+h*f3)-(x(i)+h*k3))+x1(i)+h);
        f4=(-p*(y(i)+h*f3)+c*((x(i)+h*k3)-(y(i)+h*f3)));
        x(i+1)=x(i)+(1/6)*h*(k1+2*k2+2*k3+k4);
        y(i+1)=y(i)+(1/6)*h*(f1+2*f2+2*f3+f4);
    elseif x(i)>=-1.2 && x(i)<0
        k1=(2*b*x(i)^3-2*b*x(i)+c*(y(i)-x(i))+x1(i));
        f1=(-p*y(i)+c*(x(i)-y(i)));
        k2=((2*b*(x(i)+h*k1/2)^3)-2*b*(x(i)+h*k1/2)+c*((y(i)+h*f1/2)-(x(i)+h*k1/2))+x1(i)+h/2);
        f2=(-p*(y(i)+h*f1/2)+c*((x(i)+h*k1/2)-(y(i)+h*f1/2)));
        k3=((2*b*(x(i)+h*k2/2)^3)-2*b*(x(i)+h*k2/2)+c*((y(i)+h*f2/2)-(x(i)+h*k2/2))+x1(i)+h/2);
        f3=(-p*(y(i)+h*f2/2)+c*((x(i)+h*k2/2)-(y(i)+h*f2/2)));
        k4=((2*b*(x(i)+h*k3)^3)-2*b*(x(i)+h*k3)+c*((y(i)+h*f3)-(x(i)+h*k3))+x1(i)+h);
        f4=(-p*(y(i)+h*f3)+c*((x(i)+h*k3)-(y(i)+h*f3)));
        x(i+1)=x(i)+(1/6)*h*(k1+2*k2+2*k3+k4);
        y(i+1)=y(i)+(1/6)*h*(f1+2*f2+2*f3+f4);
    elseif x(i)>=0 && x(i)<1.2*lamda
        k1=(2*b*x(i)^3/(lamda^2)-2*b*x(i)+c*(y(i)-x(i))+x1(i));
        f1=(-p*y(i)+c*(x(i)-y(i)));
        k2=((2*b*(x(i)+h*k1/2)^3)/(lamda^2)-2*b*(x(i)+h*k1/2)+c*((y(i)+h*f1/2)-(x(i)+h*k1/2))+x1(i)+h/2);
        f2=(-p*(y(i)+h*f1/2)+c*((x(i)+h*k1/2)-(y(i)+h*f1/2)));
        k3=((2*b*(x(i)+h*k2/2)^3)/(lamda^2)-2*b*(x(i)+h*k2/2)+c*((y(i)+h*f2/2)-(x(i)+h*k2/2))+x1(i)+h/2);
        f3=(-p*(y(i)+h*f2/2)+c*((x(i)+h*k2/2)-(y(i)+h*f2/2)));
        k4=((2*b*(x(i)+h*k3)^3)/(lamda^2)-2*b*(x(i)+h*k3)+c*((y(i)+h*f3)-(x(i)+h*k3))+x1(i)+h);
        f4=(-p*(y(i)+h*f3)+c*((x(i)+h*k3)-(y(i)+h*f3)));
        x(i+1)=x(i)+(1/6)*h*(k1+2*k2+2*k3+k4);
        y(i+1)=y(i)+(1/6)*h*(f1+2*f2+2*f3+f4);
    elseif x(i)>=1.2*lamda
        k1=(-a*(x(i)-xz)+c*(y(i)-x(i))+x1(i));
        f1=(-p*y(i)+c*(x(i)-y(i)));
        k2=(-a*((x(i)+h*k1/2)-xz)+c*((y(i)+h*f1/2)-(x(i)+h*k1/2))+x1(i)+h/2);
        f2=(-p*(y(i)+h*f1/2)+c*((x(i)+h*k1/2)-(y(i)+h*f1/2)));
        k3=(-a*((x(i)+h*k2/2)-xz)+c*((y(i)+h*f2/2)-(x(i)+h*k2/2))+x1(i)+h/2);
        f3=(-p*(y(i)+h*f2/2)+c*((x(i)+h*k2/2)-(y(i)+h*f2/2)));
        k4=(-a*((x(i)+h*k3)-xz)+c*((y(i)+h*f3)-(x(i)+h*k3))+x1(i)+h);
        f4=(-p*(y(i)+h*f3)+c*((x(i)+h*k3)-(y(i)+h*f3)));
        x(i+1)=x(i)+(1/6)*h*(k1+2*k2+2*k3+k4);
        y(i+1)=y(i)+(1/6)*h*(f1+2*f2+2*f3+f4);
    end
end
end
 
