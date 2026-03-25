function swoutsnr = swsnr(a,b,D,A)
        xs1=0;% 稳态点
        xs2=((a+1)+sqrt((a-1).^2-4*b))./2; % 稳态点
        xun=((a+1)-sqrt((a-1).^2-4*b))./2; % 不稳态点
        UUs1=(a+b)-2*(a+1).*xs1+3*xs1^2; % s1在等效势函数的二阶导
        UUxun=(a+b)-2*(a+1).*xun+3*xun^2; % un在等效势函数的二阶导
        UUs2=(a+b)-2*(a+1).*xs2+3*xs2^2;  % s2在等效势函数的二阶导
        Us1=(a+b).*xs1^2/2-(a+1).*xs1^3/3+xs1^4/4;% s1势垒点
        Uun=(a+b).*xun^2/2-(a+1).*xun^3/3+xun^4/4;% un势垒点
        Us2=(a+b).*xs2^2/2-(a+1).*xs2^3/3+xs2^4/4;% s2势垒点
        Rs12=1/(2*pi)*sqrt(abs(UUs1)*abs(UUxun))*exp((Us1-Uun)./D);
        Rs21=1/(2*pi)*sqrt(abs(UUs2)*abs(UUxun))*exp((Us2-Uun)./D);
        v11=Rs12*(xun-xs1)./D;
        v22=Rs21*(xun-xs2)./D;
        swoutsnr=A*A*pi*(Rs12.*v22+Rs21.*v11).^2./(4*Rs12.*Rs21.*(Rs12+Rs21));

end