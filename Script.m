clear;clc
files = dir;
j = 1;
for i=1:size(files,1)
    if(strfind(files(i).name,'Ganho'))
        files_Name(j) = {files(i).name};
        j = j + 1;
    end
end

for i = 1:size(files_Name,2)
   files_Data(i) = {textread(files_Name{i},'%c')}; 
end


for i = 1:size(files_Name,2)
    j = 1;
    files_Data_conv(i,j) = files_Data{i}(1);    
    for k = 1:length(files_Data{i}-1)
        files_Data_conv(i,j) = [files_Data_conv(i,j) files_Data{i}(k+1)];
        if files_Data_conv(j) == ','
            j = j+1;
        end
    end
end