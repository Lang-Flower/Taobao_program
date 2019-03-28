function [Head,data]=readsir3000(filename) 
 
fid = fopen(filename,'rb'); fseek(fid,4,'bof'); 
Head.ns= fread(fid,1,'ushort');   
Head.bits= fread(fid,1,'ushort'); fseek(fid,2,'cof');  
Head.sps= fread(fid,1,'float32'); 
Head.spm= fread(fid,1,'float32'); 
Head.mpm= fread(fid,1,'float32'); 
Head.position= fread(fid,1,'float32'); 
Head.range= fread(fid,1,'float32');fseek(fid,2,'cof');  
Head.dataCreate= fread(fid,1,'uint32'); 
Head.dataModify= fread(fid,1,'uint32'); 
Head.rgain= fread(fid,1,'ushort'); 
Head.nRgain= fread(fid,1,'ushort');fseek(fid,8,'cof'); 
Head.nChann= fread(fid,1,'ushort'); 
Head.epsr= fread(fid,1,'float32'); 
Head.top= fread(fid,1,'float32'); 
Head.depth= fread(fid,1,'float32');fseek(fid,31,'cof');  
Head.format= fread(fid,1,'char'); 
Head.antname= char(fread(fid,14,'char')');  
 
Head.dt=Head.range/Head.ns;
Head.formatName='dzt'; 
 
Head.dataCreate=[num2str((bin2dec(num2str(bitget(Head.dataCreate,32:-1:26)')')+1980)),'??',... 
                 num2str(bin2dec(num2str(bitget(Head.dataCreate,25:-1:22)')')),'??',... 
                 num2str(bin2dec(num2str(bitget(Head.dataCreate,21:-1:17)')')),'??,',... 
                 num2str(bin2dec(num2str(bitget(Head.dataCreate,16:-1:12)')')),':',... 
                 num2str(bin2dec(num2str(bitget(Head.dataCreate,11:-1:6)')')),':',... 
                 num2str(bin2dec(num2str(bitget(Head.dataCreate,5:-1:1)')')*2)]; 
Head.dataModify=[num2str((bin2dec(num2str(bitget(Head.dataModify,32:-1:26)')')+1980)),'??',... 
                 num2str(bin2dec(num2str(bitget(Head.dataModify,25:-1:22)')')),'??',... 
                 num2str(bin2dec(num2str(bitget(Head.dataModify,21:-1:17)')')),'??,',... 
                 num2str(bin2dec(num2str(bitget(Head.dataModify,16:-1:12)')')),':',... 
                 num2str(bin2dec(num2str(bitget(Head.dataModify,11:-1:6)')')),':',... 
                 num2str(bin2dec(num2str(bitget(Head.dataModify,5:-1:1)')')*2)]; 
 
fseek(fid,0,'eof');
fileLength=ftell(fid); 
fseek(fid,1024,'bof'); 
 
data=fread(fid, [Head.ns inf],'ushort'); 
 
fclose(fid);