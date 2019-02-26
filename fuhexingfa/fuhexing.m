clc
clear all;
close all;

N=5;%Ck未知数个数
M=31;%βj未知数个数
Numg=2;%约束数目
KD=N+1;%复合顶点个数

data=xlsread('data31.xlsx');
r=data(:,1);
alpha=data(:,2);
c0=ones(N,1).*0.05;
beta=yueshu1(alpha,c0);  %根据约束1求得β的值，由于β可有无线多个解存在，固选取离α最近的值为解。
bon=[-ones(N,1)./N ones(N,1)./N];%根据约束二给定c的一个简单边界。
ebsn1=1e-10;%算法的控制精度

%验证初始值是否满足约束条件
y2=yueshu2(c0);
if y2==0
    warning('不满足约束2')
    retutrn;
end

%生成KD个顶点的复合形
cf=zeros(N,KD);
cf(:,1)=c0;

for j=2:KD
    wai=1.0;
    while(wai>1.0)
        for i=1:N
            cf(i,j)=bon(i,1)+rand(1,1)*(bon(i,2)-bon(i,1));
        end
        cj=cf(:,j);
        y2=xueshu2(cj);
        if y2==1
            wai=-1;
        end
    end
end

disp('初始复合形正常')

error1=100;

k=0;
while(error1>ebsn1)
    k=k+1;
    %比较各个顶点的函数值，找出最大和最小的
    fc=zeros(KD,1);

    for j=1:KD
      cj=cf(:,j);
      fc(j)=fun(r,alpha,beta,cj);
    end
    [fbc,n_cmin]=min(fc);%最小的fc值及其位置
    [ftc,n_cmax]=max(fc);%最大的fc值及其位置
    
    cl=cf(:,n_cmin);%复合形的最优点
    
    c_opt=cf(:,n_cmin);%最优的c值
    fc_opt=fc(n_cmin);%最优的c值对应的f值
    
    
    if mod(k,20)==0
        %迭代50次输出一次结果
        disp(['迭代次数为:',num2str(k)])
        disp('当前迭代的最优解:')
        c_opt
        disp('最优解对应的函数值:')
        fc_opt
        c_opt=cf(:,n_cmin);
        fc_opt=fc(n_cmin);
    end
    
    
    c_gra(k)=k;
    fc_gra(k)=fc_opt;
    
    ee=0;
    for j=1:KD
       ee=ee+(fc(j)-fbc)^2;
     end
     error1=sqrt(1.0/(KD-1)*ee);
     if error1<ebsn1
         break;
     end
     % 收敛判断
     
     %%去除最坏点后的形心
     cc=zeros(size(c0));
     for j=1:KD
         if j<n_cmax||j>n_cmax
             cc=cc+cf(:,j);
         end
     end
     cc=cc/(KD-1);
     y2_cc=yueshu2(cc);
     
     if y2_cc==0
         bon(:,1)=cl;
         bon(:,2)=cc;
         %替换设计变量的上下界
         for j=1:KD
             wai=1.0;
             for j=1:N
                 cf(i,j)=bon(i,1)+rand(1,1)*(bon(i,2)-bon(i,1));
             end
             cj=cf(:,j);
             y2=yueshu2(cj);
             if y2==1
                 wai=-1;
             end
         end
     else
         %求反射点
         alp=1.3;
         while alp>1e-8
             alp;
             cr=cc+alp*(cc-cf(:,n_cmax));
             y2_cr=yueshu2(cr);
             f_cr=fun(r,alpha,beta,cr);
             if y2_cr==0 || f_cr>ftc
                 %如果反射点不可行 或者 反射点函数值比原最坏点函数值 还要大，则减小反射因子
                 alp=0.5*alp;
             else
                 break;
             end
         end
         
         
         % 如果 反射方向上找不到 函数更小的点，则更改反射方向
         if alp<1e-8
             fcp=fc;
             fcp(n_cmax)=ftc; %定义新的函数数组，将原数组FX中的最大值去掉，以便寻找 第二大的值
             [fgc,n_cg]=max(fcp);%找出次坏点
             cc=0;%求形心，去除最坏点
             for j=1:KD
                 if (j<n_cg || j>n_cg)
                     cc=cc+cf(:,j);
                 end
                 %求去掉次坏点之后的形心XC
             end
             cc=cc/(KD-1);
             
             y2_cc=yueshu2(cc);
             if y2_cc==0
                 bon(:,1)=cl;
                 bon(:,2)=cc;
                 for j=1:KD
                     wai=1.0;
                     while(wai>0)
                         for i=1:N
                             cf(i,j)=bon(i,1)+rand(1,1)*(bon(i,2)-bon(i,1));
                         end
                         cj=cf(:,j);
                         y2=yueshu2(cj);
                         if y2==1
                             wai=-1;
                         end
                     end
                 end
             end
         else  %'求次坏点的反射点'
             alp=1.3;
             while (alp>1.0e-8)
                 cr=cc+alp*(cc-cf(:,n_cmax));
                 y2_cr=yueshu2(cr);
                 f_cr=fun(r,alpha,beta,cr);
                 if y2_cr==0 || f_cr>ftc %如果反射点不可行或者 反射点函数值比 原最坏点函数值还要大，则减小反射因子
                     alp=0.5*alp;%缩小反射因子
                 else
                     break;%
                 end
             end
         end
     end
     
cf(:,n_cmax)=cr;
       if k>10000
          disp( '循环次数达到1000，强行终止')
           break;
       end
end
disp(['循环次数为',num2str(k)]);
c_opt=cl;   
disp('最优解为：c*')
c_opt

fc_opt=fun(r,alpha,beta,cl);
disp('最优值为： f(c*)')
fc_opt
figure;
plot(c_gra,fc_gra);