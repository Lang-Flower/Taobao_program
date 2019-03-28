clc
clear
data=xlsread('4.xlsx',1,'B1:K55'); 
j1=1;
j2=1;
data1=[];
data3=[];
train_all=[];
train_all_label=[];
train=[];
train_label=[];
test=[];
test_label=[];
mat=[];
mat2=[];
[j,p]=size(data);
matrix3=[];
monitor=zeros(34,9,5);
matrix2_rowrank=[];
%抽出袋外数据test
for i1=0:4
    while j1<j
        if data(j1,1)==i1
           mat=[data1;data(j1,:)];
           data1=mat;
           j1=j1+1;
        end
        if data(j1,1)>i1
             rowrank = randperm(size(data1, 1)); % 随机打乱矩阵的行数
             data2=data1(rowrank,:);
             [m,n]=size(data2);
             k=m-2;
             train_all=[train_all;data2(1:k,2:p)];
             train_all_label=[train_all_label;data2(1:k,1)];
             test=[test;data2(k+1:m,2:p)];
             test_label=[test_label;data2(k+1:m,1)];   
             nn=j1;
             j1=j;
             1
        end
    end
    j1=nn;
    data1=[];
    mat=[];
end
data_train_all=[train_all_label train_all];
[m1,n1]=size(data_train_all);
a1=zeros(1,n1);
data_train_all=[data_train_all;a1];
data_train_all(m1+1,1)=5;
vote=zeros(5,10);
 for i3=1:5 %进行SVM子集运算
     train=[];
     train_label=[];
     matrix2_rowrank=[];
  for i2=0:4
    while j2<(j-10)
        if data_train_all(j2,1)==i2
           mat2=[data3;data_train_all(j2,:)];
           data3=mat2;
           j2=j2+1;
        end
        rng('shuffle');
        if data_train_all(j2,1)>i2
 
             rowrank = randperm(size(data3, 1)); % 随机打乱矩阵的行数
             matrix2_rowrank=[matrix2_rowrank rowrank];
             data4=data3(rowrank,:);
             [m,n]=size(data4);
             k=m-2;
             train=[train;data4(1:k,2:p)];
             train_label=[train_label;data4(1:k,1)];
             nn2=j2;
             j2=(j-10);
             1
        end
    end
    j2=nn2;
    data3=[];
    mat2=[];
  end
j2=1;
 matrix3(:,:,i3)=train;
 matrix_label(:,:,i3)=train_label;
 matrix3_rowrank(i3,:)=matrix2_rowrank; 
 if i3>1
 monitor(:,:,i3)=matrix3(:,:,i3)-matrix3(:,:,i3-1);
 end
 end
%% 参数优化
% [bestacc,bestc,bestg] = SVMcgForClass(train_label,train,-5,25,-25,5,3,0.5,0.5,4.5);
% cmd = ['-c ',num2str(bestc),' -g ',num2str(bestg)];
% model= svmtrain(train_label,train,cmd);%% 测试集
% %test=xlsread('2.xlsx',1,'C1:J11');
% 
% %test_label=xlsread('2.xlsx',1,'B1:B11');
% %% 实际测试
% [test_Plabel, test_accuracy] = svmpredict(test_label,test,model);
% [p,q]=size(test);
%   for i4=1:p
%   vote_parameter=test_Plabel(i4,1)+1;
% 
%   vote(vote_parameter,i4)=vote(vote_parameter,i4)+1;
%   end
% 
% % 绘制测试结果散点图
% figure
% scatter(1:p,test_label,'b','linewidth',2)
% hold on
% scatter(1:p,test_Plabel,'r*')
% grid on
% legend('实际类别','算法分类')
% xlabel('样本数/个')
% ylabel('分类结果')
% title('支持向量机分类结果');
% % save(['C:\COIL\model2.mat'],'model2');
% % path='C:\COIL\model2.mat'
% % M=load(path);
% end
% [max_vote,index]=max(vote);
% index=index(1,:)-1;
% index=index';
% diff=index-test_label;
% mistake=length(find(diff(:)~=0));
% accuracy_vote=1-(mistake/length(diff));
