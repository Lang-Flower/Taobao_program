clc
clear all;
%%ָ�����Ԥ������������һ������
%����������۾���
A=cell(7,1);
for i=1:7
    A{i}=xlsread('data_entro-py.xls',i,'B3:R19');
end
[m,n]=size(A{1});
%��ȡָ��Ȩ��index weight��ʱ��Ȩ��time weight
i_w=xlsread('data_entro-py.xls','index_weight','B2:R18');
t_w=xlsread('data_entro-py.xls','time_weight','B2:R18');

%��Ȩ��ľ��߾���weighted
A_w=cell(7,1);
for i=1:7
    A_w{i}=A{i}.*i_w.*t_w;
end

%�����һ������nondimensionalized
A_n=cell(7,1);
for i=1:7
    A_n{i}=zscore(A_w{i});
end

%�ҳ���������A max�͸���������A min
A_max=A_n{1};
A_min=A_n{1};
for i=1:7
    A_max=max(A_max,A_n{i});
    A_min=min(A_min,A_n{i});
end

%ȷ��A��A_max��A_min�Ľӽ���
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
disp('    ���϶�    ����')
disp('----------------------')
result=[D,7-K+1];
disp(result)