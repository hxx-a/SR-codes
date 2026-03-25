clc;
clear all;
x=-4:0.1:4;
a=0.1;b=1;c=0.3;
m=3;
n=1.5;
lamda=1;
uc=a/2*x.^2-b/4*x.^4+c/6*x.^6;
k=0.528*a*m^3*(1.44*m^2-n^2);
d=a*(-0.020736*m^6+0.2016*m^4*n^2);
for i=1:length(x)
    if x(i)<= -1.2*m
       u(i)=-k*(x(i)+1.2*m)+d;
    end  
    if (x(i)>= (-1.2*m))&&(x(i)<= 0)
       u(i)=a*(x(i)^6/6-(m^2+n^2)/4*x(i)^4+m^2*n^2/2*x(i)^2);
    end
    if (x(i)>= 0)&&(x(i)<= (1.2*m*lamda))
       u(i)=a*lamda*((x(i)/lamda)^6/6-(m^2+n^2)/4*(x(i)/lamda)^4+m^2*n^2/2*(x(i)/lamda)^2);
    end  
    if x(i)>= 1.2*lamda*m
        u(i)=k*(x(i)-1.2*lamda*m)+d*lamda;
    end
end
figure(1);
plot(x,u,'-b','LineWidth',1.2); 
xlim([-4 4]);ylim([-2 20])
hold on
plot(x,uc,'-r','LineWidth',1.2); 
xlabel('{\it x}','Fontname', 'Times New Roman');ylabel('{\it U_3(x)}','Fontname', 'Times New Roman');
