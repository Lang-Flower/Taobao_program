clc
clear all;
close all;

N=5;%Ckδ֪������
M=31;%��jδ֪������
Numg=2;%Լ����Ŀ
KD=N+1;%���϶������

data=xlsread('data31.xlsx');
r=data(:,1);
alpha=data(:,2);
c0=ones(N,1).*0.05;
beta=yueshu1(alpha,c0);  %����Լ��1��æµ�ֵ�����ڦ¿������߶������ڣ���ѡȡ��������ֵΪ�⡣
bon=[-ones(N,1)./N ones(N,1)./N];%����Լ��������c��һ���򵥱߽硣
ebsn1=1e-10;%�㷨�Ŀ��ƾ���

%��֤��ʼֵ�Ƿ�����Լ������
y2=yueshu2(c0);
if y2==0
    warning('������Լ��2')
    retutrn;
end

%����KD������ĸ�����
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

disp('��ʼ����������')

error1=100;

k=0;
while(error1>ebsn1)
    k=k+1;
    %�Ƚϸ�������ĺ���ֵ���ҳ�������С��
    fc=zeros(KD,1);

    for j=1:KD
      cj=cf(:,j);
      fc(j)=fun(r,alpha,beta,cj);
    end
    [fbc,n_cmin]=min(fc);%��С��fcֵ����λ��
    [ftc,n_cmax]=max(fc);%����fcֵ����λ��
    
    cl=cf(:,n_cmin);%�����ε����ŵ�
    
    c_opt=cf(:,n_cmin);%���ŵ�cֵ
    fc_opt=fc(n_cmin);%���ŵ�cֵ��Ӧ��fֵ
    
    
    if mod(k,20)==0
        %����50�����һ�ν��
        disp(['��������Ϊ:',num2str(k)])
        disp('��ǰ���������Ž�:')
        c_opt
        disp('���Ž��Ӧ�ĺ���ֵ:')
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
     % �����ж�
     
     %%ȥ�����������
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
         %�滻��Ʊ��������½�
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
         %�����
         alp=1.3;
         while alp>1e-8
             alp;
             cr=cc+alp*(cc-cf(:,n_cmax));
             y2_cr=yueshu2(cr);
             f_cr=fun(r,alpha,beta,cr);
             if y2_cr==0 || f_cr>ftc
                 %�������㲻���� ���� ����㺯��ֵ��ԭ��㺯��ֵ ��Ҫ�����С��������
                 alp=0.5*alp;
             else
                 break;
             end
         end
         
         
         % ��� ���䷽�����Ҳ��� ������С�ĵ㣬����ķ��䷽��
         if alp<1e-8
             fcp=fc;
             fcp(n_cmax)=ftc; %�����µĺ������飬��ԭ����FX�е����ֵȥ�����Ա�Ѱ�� �ڶ����ֵ
             [fgc,n_cg]=max(fcp);%�ҳ��λ���
             cc=0;%�����ģ�ȥ�����
             for j=1:KD
                 if (j<n_cg || j>n_cg)
                     cc=cc+cf(:,j);
                 end
                 %��ȥ���λ���֮�������XC
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
         else  %'��λ���ķ����'
             alp=1.3;
             while (alp>1.0e-8)
                 cr=cc+alp*(cc-cf(:,n_cmax));
                 y2_cr=yueshu2(cr);
                 f_cr=fun(r,alpha,beta,cr);
                 if y2_cr==0 || f_cr>ftc %�������㲻���л��� ����㺯��ֵ�� ԭ��㺯��ֵ��Ҫ�����С��������
                     alp=0.5*alp;%��С��������
                 else
                     break;%
                 end
             end
         end
     end
     
cf(:,n_cmax)=cr;
       if k>10000
          disp( 'ѭ�������ﵽ1000��ǿ����ֹ')
           break;
       end
end
disp(['ѭ������Ϊ',num2str(k)]);
c_opt=cl;   
disp('���Ž�Ϊ��c*')
c_opt

fc_opt=fun(r,alpha,beta,cl);
disp('����ֵΪ�� f(c*)')
fc_opt
figure;
plot(c_gra,fc_gra);