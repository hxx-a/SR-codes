%% 这个是新型三稳的一维
function x=lgkt00(p,u,h,x1)
x=zeros(1,length(x1));
for i=1:length(x1)-1

    if x(i)<0
        k1=p*(x(i)+sqrt(u))/u-p*(x(i)+sqrt(u))^3/u^2+x1(i);
        k2=p*((x(i)+k1*h/2)+sqrt(u))/u-p*((x(i)+k1*h/2)+sqrt(u))^3/u^2+(x1(i)+h/2);
        k3=p*((x(i)+k2*h/2)+sqrt(u))/u-p*((x(i)+k2*h/2)+sqrt(u))^3/u^2+(x1(i)+h/2);
        k4=p*((x(i)+k3*h)+sqrt(u))/u-p*((x(i)+k3*h)+sqrt(u))^3/u^2+(x1(i)+h);
        x(i+1)=x(i)+1/6*h*(k1+2*k2+2*k3+k4);  
    elseif x(i)>=0
        k1=p*(x(i)-sqrt(u))/u-p*(x(i)-sqrt(u))^3/u^2+x1(i);
        k2=p*((x(i)+k1*h/2)-sqrt(u))/u-p*((x(i)+k1*h/2)-sqrt(u))^3/u^2+(x1(i)+h/2);
        k3=p*((x(i)+k2*h/2)-sqrt(u))/u-p*((x(i)+k2*h/2)-sqrt(u))^3/u^2+(x1(i)+h/2);
        k4=p*((x(i)+k3*h)-sqrt(u))/u-p*((x(i)+k3*h)-sqrt(u))^3/u^2+(x1(i)+h);
        x(i+1)=x(i)+1/6*h*(k1+2*k2+2*k3+k4);
    end
        
end
end