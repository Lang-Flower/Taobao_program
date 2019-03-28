function savegrd(data, xmin,xmax, zmin,zmax, GrdFile) 
 
s=size(data); 
[fidGrd,msg] = fopen(GrdFile,'wt'); 
fprintf(fidGrd,'DSAA\n'); 
fprintf(fidGrd,'%d %d\n',s(2),s(1)); 
fprintf(fidGrd,'%d %d\n',xmin,xmax); 
fprintf(fidGrd,'%d %d\n',zmin,zmax); 
 
fprintf(fidGrd,'%e %e\n',min(min(data)),max(max(data))); 
for i=s(1):-1:1 
    for j=1:s(2) 
        fprintf(fidGrd,' %8d',data(i,j)); 
    end 
    fprintf(fidGrd,'\n'); 
end 
fclose(fidGrd); 