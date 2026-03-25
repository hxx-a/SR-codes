function x=ctlgkt(a,b,c,h,x1)
x=zeros(1,length(x1));
    for i=1:length(x1)-1
         if abs(x(i))>2
            x(i)=sign(x(i))*2;
         end
        k1=(-a*x(i)+b*x(i).^3-c*x(i).^5+x1(i));
        k2=(-a*(x(i)+h*k1/2)+b*(x(i)+h*k1/2).^3-c*(x(i)+h*k1/2).^5+x1(i)+h/2);
        k3=(-a*(x(i)+h*k2/2)+b*(x(i)+h*k2/2).^3-c*(x(i)+h*k2/2).^5+x1(i)+h/2);
        k4=(-a*(x(i)+h*k3)+b*(x(i)+h*k3).^3-c*(x(i)+h*k3).^5+x1(i)+h);
        x(i+1)=x(i)+(1/6)*h*(k1+2*k2+2*k3+k4);
    end
end
