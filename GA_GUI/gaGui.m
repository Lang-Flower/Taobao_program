function varargout = gaGui(varargin)
% GAGUI M-file for gaGui.fig
%      GAGUI, by itself, creates a new GAGUI or raises the existing
%      singleton*.
%
%      H = GAGUI returns the handle to a new GAGUI or the handle to
%      the existing singleton*.
%
%      GAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAGUI.M with the given input arguments.
%
%      GAGUI('Property','Value',...) creates a new GAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gaGui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gaGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gaGui

% Last Modified by GUIDE v2.5 06-Apr-2010 15:56:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gaGui_OpeningFcn, ...
                   'gui_OutputFcn',  @gaGui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gaGui is made visible.
function gaGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gaGui (see VARARGIN)

% Choose default command line output for gaGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gaGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gaGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function EditCityNumber_Callback(hObject, eventdata, handles)
% hObject    handle to EditCityNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditCityNumber as text
%        str2double(get(hObject,'String')) returns contents of EditCityNumber as a double


% --- Executes during object creation, after setting all properties.
function EditCityNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditCityNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editInitialGroup_Callback(hObject, eventdata, handles)
% hObject    handle to editInitialGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editInitialGroup as text
%        str2double(get(hObject,'String')) returns contents of editInitialGroup as a double


% --- Executes during object creation, after setting all properties.
function editInitialGroup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editInitialGroup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditCrossOver_Callback(hObject, eventdata, handles)
% hObject    handle to EditCrossOver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditCrossOver as text
%        str2double(get(hObject,'String')) returns contents of EditCrossOver as a double


% --- Executes during object creation, after setting all properties.
function EditCrossOver_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditCrossOver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in GenerateInitialCitiesButton.
function GenerateInitialCitiesButton_Callback(hObject, eventdata, handles)
% hObject    handle to GenerateInitialCitiesButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str1=char(get(handles.EditCityNumber,'string'));
global N
N=str2num(str1);
%生成随即城市
global cities;
if(~isempty(cities))
    cla;
end
cities=round(100*rand(N,2));
axes(handles.CityMap);
for k=1:N
    if(k~=1)
        hold on
    end
    plot(cities(k,1),cities(k,2),'bo');
end


function CurrentIterationNumber_Callback(hObject, eventdata, handles)
% hObject    handle to CurrentIterationNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CurrentIterationNumber as text
%        str2double(get(hObject,'String')) returns contents of CurrentIterationNumber as a double


% --- Executes during object creation, after setting all properties.
function CurrentIterationNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CurrentIterationNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TotalDistance_Callback(hObject, eventdata, handles)
% hObject    handle to TotalDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TotalDistance as text
%        str2double(get(hObject,'String')) returns contents of TotalDistance as a double


% --- Executes during object creation, after setting all properties.
function TotalDistance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TotalDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in BeginButton.
function BeginButton_Callback(hObject, eventdata, handles)
% hObject    handle to BeginButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;
%生成初始群体,M是初始群体的个数
global N;%N是城市个数

global M;%M是群体个数
str3=char(get(handles.editInitialGroup,'string'));
M=str2num(str3);

global L;%L是循环次数
str4=char(get(handles.editMaxIteration,'string'));
L=str2num(str4);

%global cross_prob;%交叉概率
str=char(get(handles.EditCrossOver,'string'));
cross_prob=str2num(str);

global vary_prob;%变异概率
str=char(get(handles.edit6,'string'));
vary_prob=str2num(str);

global dis_min;
    time=0;%运行时间
    group=zeros(M,2);
    min_group=zeros(1,N);%min_group保存全局最小个体
    dis_min=10000;%dis_min是各代最小的距离
    min1=0;
    end_genaration=0;
    for i=1:M
        a=randperm(N);
        for j=1:N
           group(i,j)=a(j);
        end
    end

    %初始群体生成完毕

    for i=1:L %L为迭代停止代数
        tic;
        dis_sum=group_dis_cul(group);
        min_p=find(dis_sum==min(dis_sum));
        if(min(dis_sum)<dis_min)%如果当前群体的最小值比全局最小值还小，那么一定保留当前群体最小的群体
            dis_min=min(dis_sum);
            for j=1:length(min_p)
                min_group(j,:)=group(min_p(j),:);%min_group保存当前群体最小值的个体
                end_genaration=i;
            end
        end 
        %选择生成更好的群体bettergroup
        sel=selection(dis_sum);
        for j=1:M
            for k=1:N
                bettergroup(j,k)=group(sel(j),k);
            end
        end
        group=bettergroup;

        %交叉操作
       
        if(rand(1)<cross_prob)
       group=g_cross(group);
       if(i>500)
           cross_prob=250/i;
       end
        end
 
        

        %变异操作
        group=group_vary(group);

        dis_sum1=group_dis_cul(group);%计算变异后群体目标函数值
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %这是保留所有最小值的代码
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  

        [a,b]=size(min_group);%上次群体中最小值个体的数量
        r=ceil(a*rand);
        max_p=find(dis_sum1==max(dis_sum1),1,'last');%找出group中最大值的位置
        group(max_p,:)=min_group(r,:);%用最小值群体中的第r个个体去替代group中最大值的个体
        dis_sum1(max_p)=dis_min;
% 
        min1=min(dis_sum1);
        n=find(dis_sum1==min1,1,'first');
        individual=group(n,:);
        graph(individual,handles.CityMap);

        set(handles.CurrentIterationNumber,'string',num2str(i));
        set(handles.TotalDistance,'string',num2str(min1));
        set(handles.edit9,'string',num2str(end_genaration));
        set(handles.editTime,'string',num2str(time));
        results(1,i)=i;
        results(2,i)=min1;  
        if((i-end_genaration)>299)%300次迭代无最优路径更新，则退出循环.
            mindist=min(group_dis_cul(group));%以下代码保证在退出循环时能画出距离最短的线路
            dis_sum=group_dis_cul(group);
            p_index=find(dis_sum==mindist,1,'first');
            bestpath=group(p_index,:);
            graph(bestpath,handles.CityMap);
            break;
        end
     time=time+toc;
    end
    axes(handles.Effect);%画出路线距离与迭代次数的关系图.
    plot(results(1,:),results(2,:));
    xlabel('迭代次数');
    ylabel('旅行路程');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%画出对应路径
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function graph(a,haxes)
global N;
global cities;

axes(haxes);
for k=1:N
    if(k~=1)
        hold on
    end
    plot(cities(k,1),cities(k,2),'bo');
end

axes(haxes);
for i=1:(N-1)
    plot([cities(a(i),1),cities(a(i+1),1)],[cities(a(i),2),cities(a(i+1),2)],'r-');
    hold on
end
plot([cities(a(1),1),cities(a(N),1)],[cities(a(1),2),cities(a(N),2)],'r-');
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%b是输入目标函数，a是输出选择结果向量，在向量的单元中存放选中的个体在group中的编号
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function a=selection(b)
    global M;
    b1=1./b;
    prob=b1/sum(b1);
    roulette(1)=prob(1);%roulette(轮盘)是进行选择时的策略，第i个单元放i之前单元的概率之和
    for i=1:M
        roll=rand;
        if(roll<=roulette(1))
            a(i)=1;
        end
        for j=2:M
               roulette(j)=roulette(j-1)+prob(j);
               if((roll>roulette(j-1)) &&(roll<=roulette(j)))
                a(i)=j;
               end
        end
    end
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%计算一个个体的目标函数值，即遍历一圈的距离之和
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function d=distance_cul(a)
% global N;
% global cities;
% d=0;
% for i=1:N-1
%     d=d+sqrt((cities(a(i),1)-cities(a(i+1),1))^2+(cities(a(i),2)-cities(a(i+1),2))^2);
% end
% size(cities)
% d=d+sqrt((cities(a(N),1)-cities(a(1),1))^2+(cities(a(N),2)-cities(a(1),2))^2);
function d=distance_cul(a)
global N;
global cities;
d=0;
for k=1:N-1
     d=d+6371*acos(sin(cities(a(i),2)*pi/180)*sin(cities(a(i+1),2)*pi/180)+cos(cities(a(i),2)*pi/180)*cos(cities(a(i+1),2)*pi/180)*cos(cities(a(i),1)*pi/180-cities(a(i+1),1)*pi/180));
end
d=d+6371*acos(sin(cities(a(N),2)*pi/180)*sin(cities(a(1),2)*pi/180)+cos(cities(a(N),2)*pi/180)*cos(cities(a(1),2)*pi/180)*cos(cities(a(N),1)*pi/180-cities(a(1),1)*pi/180));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%计算群体目标函数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function d=group_dis_cul(g)
global M;
global N;
for i=1:M
    temp=g(i,:);
    d(i)=distance_cul(temp);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%群体交叉操作
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function g2=g_cross(g1)
global M;
global cross_prob;
  
crs=randperm(M);
for i=1:fix(M/2)
    [g2(crs(2*i-1),:),g2(crs(2*i),:)]=crossover(g1(crs(2*i-1),:),g1(crs(2*i),:));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%个体交叉
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ind1,ind2]=crossover(oldp1,oldp2)
% oldp1,oldp2杂交，产生m=[newp1;newp2]
global N;
cp=sort(ceil(N*rand(1,2)));
segment1=oldp1(cp(1):cp(2));
segment2=oldp2(cp(1):cp(2));
oldp1=eliminate(oldp1,segment2);
oldp2=eliminate(oldp2,segment1);
newp1=[oldp1,segment2];
newp2=[oldp2,segment1];
ind1=newp1;
ind2=newp2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  elim=eliminate(x,y)
% 作用：消除x中的y
for n=1:length(y)
    x=x(find(x~=y(n))); 
end
elim=x;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%变异算子
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%群体变异函数
function g2=group_vary(g1)
global M;
global N;
global vary_prob;
a=randperm(M);
for i=1:M
    if(a(i)<vary_prob)
        b=round(N*rand(1,2));
        t=g1(i,b(1));
        g1(i,b(1))=g1(i,b(2));
        g1(i,b(2))=t;
    end
end
g2=g1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5





function editTime_Callback(hObject, eventdata, handles)
% hObject    handle to editTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTime as text
%        str2double(get(hObject,'String')) returns contents of editTime as a double


% --- Executes during object creation, after setting all properties.
function editTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


