clc
clear all;
close all;
%利用ui界面读取dzt文件
[Infname, Inpname]= uigetfile('*.DZT','Give DZT data file name'); 
if isequal(Infname,0) || isequal(Inpname,0)
    return 
end
fid=fopen([Inpname Infname],'r'); 

%按照论文《基于matlab的SIR300型探地雷达数据的读取与显示》的程序读取数据
%读取的文件头放置于rh（read head缩写）结构体变量中，
%rh中各项的含义可参考论文《SIR —10H 型地质雷达仪数据格式》
rh.tag=fread(fid,1,'ushort'); 
rh.data=fread(fid,1,'ushort'); 
rh.nsamp=fread(fid,1,'ushort'); 
rh.bits=fread(fid,1,'ushort'); 

rh.zero=fread(fid,1,'short'); 
 
rh.sps=fread(fid,1,'float'); 
rh.spm=fread(fid,1,'float'); 
rh.mpm=fread(fid,1,'float'); 
rh.position=fread(fid,1,'float'); 
rh.range=fread(fid,1,'float'); 
 
rh.npass=fread(fid,1,'ushort'); 
 
Create.sec2=fread(fid,1,'ubit5'); 
Create.min=fread(fid,1,'ubit6'); 
Create.hour=fread(fid,1,'ubit5'); 
Create.day=fread(fid,1,'ubit5'); 
Create.month=fread(fid,1,'ubit4'); 
Create.year=fread(fid,1,'ubit7'); 
 
Modify.sec2=fread(fid,1,'ubit5'); 
Modify.min=fread(fid,1,'ubit6'); 
Modify.hour=fread(fid,1,'ubit5'); 
Modify.day=fread(fid,1,'ubit5'); 
Modify.month=fread(fid,1,'ubit4'); 
Modify.year=fread(fid,1,'ubit7'); 
 
rh.rgain=fread(fid,1,'ushort'); 
rh.nrgain=fread(fid,1,'ushort'); 
rh.text=fread(fid,1,'ushort'); 
rh.ntext=fread(fid,1,'ushort'); 
rh.proc=fread(fid,1,'ushort'); 
rh.nproc=fread(fid,1,'ushort'); 
rh.nchan=fread(fid,1,'ushort'); 
 
rh.epsr=fread(fid,1,'float'); 
rh.top=fread(fid,1,'float'); 
rh.depth=fread(fid,1,'float'); 
 
reserved=fread(fid,31,'char'); 
rh.dtype=fread(fid,1,'char'); 
rh.antname=fread(fid,14,'char'); 
rh.chanmask=fread(fid,1,'ushort'); 
rh.name=fread(fid,12,'char'); 
rh.chksum=fread(fid,1,'ushort'); 
%rh.var=setstr(fread(fid,896,'char')); 
rh.Gain=fread(fid,1,'ushort'); 
rh.Gainpoints=fread(fid,rh.Gain,'float'); 
rh.comments=setstr(fread(fid,rh.ntext,'char')); 
rh.proccessing=fread(fid,rh.nproc,'char'); 
 
fseek(fid,0,'bof'); 
fseek(fid,1024,'bof'); 

data=fread(fid,[rh.nsamp inf],'ushort'); 
% figure 
% plot(data(20,:));
% grid 
 
% data(1,:)=data(3,:); 
% data(2,:)=data(3,:); 
data=data+rh.zero; %加上初始偏移量
%  
% figure 
% plot(data(:,1));grid 
%wigb(data.samp); 
%关掉文件
fclose(fid);
disp(rh)
%将dzt文件转换得到的数据data写进excel文件，行代表采样点的个数，列代表道数
save data rh data
xlswrite('data of radar.xlsx',data,'Sheet1')