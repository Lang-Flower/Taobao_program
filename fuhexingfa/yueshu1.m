function beta=yueshu1(alpha,c)
m=size(alpha,1);%����ά��
n=size(c,1);%c��ά��
beta=zeros(size(alpha));
syms x f
for i=1:m
    f=sin(alpha(i,1)-x);
    for j=1:n
        f=f+c(j,1)*sin(alpha(i,1)+j*x);
    end
    g=matlabFunction(f);
    gx=fzero(g,alpha(i,1),[]);%��ֵ����
    beta(i,1)=gx;
end
