clear;clc;
fid=fopen('b_4.m');
scriptTxt={};
str_remp={'regresar=','graphs=','convuni='};
while 1
    curr_lin=fgetl(fid);
    for i=1:3
        curr_lin=strrep(curr_lin,str_remp{i},'');
    end
    scriptTxt=[scriptTxt curr_lin];
    if ~ischar(curr_lin),break;end;
end
fclose(fid);

fid=fopen('this.m','w');
for i=1:length(scriptTxt)
    fprintf(fid,'%s\n',scriptTxt{i});
end
fclose(fid);