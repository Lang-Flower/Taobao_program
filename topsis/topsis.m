clc
clear all;
%%指标矩阵预处理————归一化处理
%导入各个评价矩阵
A=cell(7,1);
for i=1:7
    A{i}=xlsread('data_entro-py.xls',i,'B3:R19');
end
[m,n]=size(A{1});
%读取指标权重index weight和时间权重time weight
i_w=xlsread('data_entro-py.xls','index_weight','B2:R18');
t_w=xlsread('data_entro-py.xls','time_weight','B2:R18');

%加权后的决策矩阵weighted
A_w=cell(7,1);
for i=1:7
    A_w{i}=A{i}.*i_w.*t_w;
end

%矩阵归一化处理nondimensionalized
A_n=cell(7,1);
for i=1:7
    A_n{i}=zscore(A_w{i});
end

%找出理想点矩阵A max和负理想点矩阵A min
A_max=A_n{1};
A_min=A_n{1};
for i=1:7
    A_max=max(A_max,A_n{i});
    A_min=min(A_min,A_n{i});
end

%确定A与A_max、A_min的接近度
A_max_n=zeros(m,n);
A_min_n=zeros(m,n);
D=zeros(7,1);
for i=1:7
    A_max_n=A_n{i}-A_max;
    A_min_n=A_n{i}-A_min;
    dd1=norm(A_min_n,'fro');
    dd2=norm(A_max_n,'fro');
    D(i)=dd1/(dd1+dd2);
end
[So,K]=sort(D);
disp('    贴合度    排名')
disp('----------------------')
result=[D,7-K+1];
disp(result)