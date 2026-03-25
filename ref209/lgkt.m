%% ¶þÎ¬ÈýÎÈ
function x=lgkt(p,u,k,r,h,x1)
x=zeros(1,length(x1));
y=zeros(1,length(x1));

for i=1:length(x1)-1

    if x(i)<0
        k1=p.*(x(i)+sqrt(u))./u-p.*(x(i)+sqrt(u)).^3./u.^2+r.*(y(i)-x(i))+x1(i);
        f1=-k.*y(i)+r.*(x(i)-y(i));
        k2=p.*((x(i)+k1.*h./2)+sqrt(u))./u-p.*((x(i)+k1.*h./2)+sqrt(u)).^3./u.^2+r.*(y(i)-(x(i)+k1.*h./2))+(x1(i)+h./2);
        f2=-k*(y(i)+f1.*h./2)+r.*(x(i)-(y(i)+f1.*h./2));
        k3=p*((x(i)+k2.*h./2)+sqrt(u))./u-p.*((x(i)+k2*h/2)+sqrt(u))^3/u^2+r*(y(i)-(x(i)+k2*h/2))+(x1(i)+h/2);
        f3=-k*(y(i)+f2*h/2)+r*(x(i)-(y(i)+f2*h/2));
        k4=p*((x(i)+k3*h)+sqrt(u))/u-p*((x(i)+k3*h)+sqrt(u))^3/u^2+r*(y(i)-(x(i)+k3*h))+(x1(i)+h);
        f4=-k*(y(i)+f3*h)+r*(x(i)-(y(i)+f3*h));
        x(i+1)=x(i)+1/6*h*(k1+2*k2+2*k3+k4);
        y(i+1)=y(i)+1/6*h*(f1+2*f2+2*f3+f4);   
    elseif x(i)>=0
        k1=p.*(x(i)-sqrt(u))./u-p*(x(i)-sqrt(u)).^3/u.^2+r*(y(i)-x(i))+x1(i);
        f1=-k.*y(i)+r.*(x(i)-y(i));
        k2=p.*((x(i)+k1.*h./2)-sqrt(u))./u-p.*((x(i)+k1.*h./2)-sqrt(u)).^3./u.^2+r.*(y(i)-(x(i)+k1.*h./2))+(x1(i)+h./2);
        f2=-k.*(y(i)+f1.*h./2)+r.*(x(i)-(y(i)+f1.*h./2));
        k3=p.*((x(i)+k2.*h./2)-sqrt(u))./u-p.*((x(i)+k2*h/2)-sqrt(u)).^3./u.^2+r*(y(i)-(x(i)+k2.*h./2))+(x1(i)+h./2);
        f3=-k*(y(i)+f2*h/2)+r*(x(i)-(y(i)+f2*h/2));
        k4=p.*((x(i)+k3.*h)-sqrt(u))./u-p.*((x(i)+k3.*h)-sqrt(u)).^3../u.^2+r.*(y(i)-(x(i)+k3.*h))+(x1(i)+h);
        f4=-k.*(y(i)+f3.*h)+r.*(x(i)-(y(i)+f3.*h));
        x(i+1)=x(i)+1/6.*h.*(k1+2.*k2+2.*k3+k4);
        y(i+1)=y(i)+1/6.*h.*(f1+2.*f2+2.*f3+f4);  
    end
        
end
end