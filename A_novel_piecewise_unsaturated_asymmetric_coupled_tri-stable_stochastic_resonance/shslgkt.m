function x=shslgkt(a,m,n,lamda,h,x1)
k=0.528*a*m^3*(1.44*m^2-n^2);
x=zeros(1,length(x1));
x(1)=0.01;
for i=1:length(x1)-1
    if x(i)<-1.2*m
        k1=h*(k+x1(i));
        k2=h*(k+x1(i)+h/2);
        k3=h*(k+x1(i)+h/2);
        k4=h*(k+x1(i)+h);
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
    elseif x(i)>=-1.2*m && x(i)<0
        k1=h*(a*(-x(i)^5+(m^2+n^2)*x(i)^3-m^2*n^2*x(i))+x1(i));
        k2=h*(a*(-(x(i)+k1/2)^5+(m^2+n^2)*(x(i)+k1/2)^3-m^2*n^2*(x(i)+k1/2))+x1(i)+h/2);
        k3=h*(a*(-(x(i)+k2/2)^5+(m^2+n^2)*(x(i)+k2/2)^3-m^2*n^2*(x(i)+k2/2))+x1(i)+h/2);
        k4=h*(a*(-(x(i)+k3)^5+(m^2+n^2)*(x(i)+k3)^3-m^2*n^2*(x(i)+k3))+x1(i)+h);
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
    elseif x(i)>=0 && x(i)<1.2*m*lamda
        k1=h*(a*lamda*(-x(i)^5/(lamda^6)+(m^2+n^2)*x(i)^3/(lamda^4)-m^2*n^2*x(i)/(lamda^2))+x1(i));
        k2=h*(a*lamda*(-(x(i)+k1/2)^5/(lamda^6)+(m^2+n^2)*(x(i)+k1/2)^3/(lamda^4)-m^2*n^2*(x(i)+k1/2)/(lamda^2))+x1(i)+h/2);
        k3=h*(a*lamda*(-(x(i)+k2/2)^5/(lamda^6)+(m^2+n^2)*(x(i)+k2/2)^3/(lamda^4)-m^2*n^2*(x(i)+k2/2)/(lamda^2))+x1(i)+h/2);
        k4=h*(a*lamda*(-(x(i)+k3)^5/(lamda^6)+(m^2+n^2)*(x(i)+k3)^3/(lamda^4)-m^2*n^2*(x(i)+k3)/(lamda^2))+x1(i)+h);
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
    elseif x(i)>=1.2*m*lamda
        k1=h*(-k/lamda+x1(i));
        k2=h*(-k/lamda+x1(i)+h/2);
        k3=h*(-k/lamda+x1(i)+h/2);
        k4=h*(-k/lamda+x1(i)+h);
        x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
    end
end
end
 
