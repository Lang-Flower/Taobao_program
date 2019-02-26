function y2=yueshu2(c)
m=size(c,1);
s=0;
for i=1:m
    s=s+i*abs(c(i,1));
end
if s<1
    y2=1;%满足约束条件
else
    y2=0;%不满足约束条件
end
    