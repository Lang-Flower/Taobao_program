clc;
clear all;
close all;
n=2;%空间维数
m=20;%样本个数
P=rand(m,n)*100;%随机生成样本集

%计算上下两个极点
P_jia=max(P); %最大的极点位置
P_jian=min(P);%最小的极点位置

%放入S*作为启动极点
s(1,:)=P_jia;
s(2,:)=P_jian;
s_num=2;%记录S中基点的个数,此时将两个极点放入基点集,作为初始基点

%绘图看极点位置
% plot(P(:,1),P(:,2),'*','MarkerSize',10)
% hold on
% plot([P_jia(:,1);P_jian(:,1)],[P_jia(:,2);P_jian(:,2)],'+','MarkerSize',10)
% legend('初始点','初始基点(极点)')

%判断样本集中的每个点是否在诸球之并中
for i=1:m
    flag1=0;%用于判断是否把P点纳入基点集，flag1=1则纳入，flag1=0则不纳入，此处初始为0
    for j=1:s_num
        %计算基点的中心O
        center=sum(s)/s_num;
        %步骤2
        Q_P=s(j,:)-P(i,:);%Q-P
        O_P=center-P(i,:);%O-P
        
        if dot(Q_P,O_P)<0
              %P在当前基点Q与中心O连线的圆内
              %跳出当前循环验证是否在下一个样本点(继续进行步骤二)。
              
              flag2=1; %用于判断P点是否在阴影区域，取1则不在，取2则在
            for k=1:s_num
                
                %验证P是否在QQ'的外侧，即定理2.2所说的图形阴影区域
                if j~=k 
                  
                   %求垂足Q*的坐标 
                   t=dot((s(j,:)-s(k,:)),(center-s(j,:)))/sum(((s(j,:)-s(k,:)).^2),2);
                   q_star=s(j,:)+t*(s(j,:)-s(k,:));
                   
                   %步骤3的判定条件
                   if dot((P(i,:)-center),(q_star-center))<=dot((q_star-center),(q_star-center))
                       %在QQ'包围范围内，则P可由基点集合生成
                       flag2=1;
                       break;
                   else
                       flag2=0;
                       %再QQ'包围范围外，即在阴影区域内，不能由基点集生成
                   end
                end
            end
            
            if flag2==0 %此时p不满足在Q和所有基点Q'连线包围的范围内
                flag1=1;
                break;
            end
        else
            flag1=1;%判断此时P点不在诸球之并内
        end
    end
    %循环计算P和所有基点与基点中心的连线圆，发现P不在诸球之并中,则判断P为基点并放入基点集中
    if flag1==1
        s=[s;P(i,:)];%将P放入基点集S中
        s_num=s_num+1;
        if s_num>2 %当只有两个基点时，O和两基点共线，命题2.1不成立，此时不检验基点集各基点的重复性
            
            %新加入基点后，判断新的基点集是否有多余基点，是则删除
            %计算点在多维空间直线的垂足坐标，计算点在二维直线上垂足坐标的参考资料：https://blog.csdn.net/jjwwwww/article/details/83830981
            %多维空间直线参数方程参考资料:https://www.cnblogs.com/yaolin1228/p/7871793.html
            for k1=1:s_num-1
                for l=k1+1:s_num
                    center=sum(s)/s_num;%新的基点中心
                    s(k1,:);%基点1
                    s(l,:);%基点2
                    t=sum(((s(k1,:)-s(l,:)).*(center-s(k1,:))),2)/sum(((s(k1,:)-s(l,:)).^2),2);
                    q_star=s(k1,:)+t*(s(k1,:)-s(l,:));%垂足Q*的坐标
                    
                end
            end
        end
    end
end