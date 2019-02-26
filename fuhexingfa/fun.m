function f=fun(r,alpha,beta,c)
m=size(alpha,1);
n=size(c,1);
f=0;
for i=1:m
    ff=0;
    for j=1:n
        ff=ff+c(j,1)*cos(alpha(i,1)+j*beta(i,1));%Çóc(k)*cos(alpha(j)+k*beta(j))
    end
   f=f+(r(i,1)-11.055/(1+sum(c))*(cos(alpha(i,1)-beta(i,1))+ff))^2;
end
