function y2=yueshu2(c)
m=size(c,1);
s=0;
for i=1:m
    s=s+i*abs(c(i,1));
end
if s<1
    y2=1;%����Լ������
else
    y2=0;%������Լ������
end
    