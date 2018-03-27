clear;clc;close all
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

j = 1;
files_Data_conv = cell(401,6);
for i = 1:size(files_Name,2)
    j = 1;    
    for k = 1:length(files_Data{i}-1)
        
        if files_Data{i}(k) == ','
            j = j+1;         
        else
            files_Data_conv(j,i) = strcat(files_Data_conv(j,i),files_Data{i}(k));    
        end
    end
end
files_Data_num = cellfun(@str2num,erase(files_Data_conv,'E+00'));

Fi = 5;
Ff = 5000;
npt = size(files_Data_num,1);
i=1:npt;
logscale = Fi.*10.^((i-1)/(npt-1)*log10(Ff/Fi));

figure;
j=0;k=0;
for  i=1:size(files_Data_num,2)
    
    if(contains(files_Name(i),'1'))
        yl=('Magnetude');
        j=0;
        k = k+1;
        if(contains(files_Name(i),'mais')||contains(files_Name(i),'menos'))
            files_Data_num(:,i) = files_Data_num(:,i)+40; 
        end
    else
        yl=('Fase');
        j=1; 
    end
    subplot(2,size(files_Data_num,2)/2,k+3*j)
    semilogx(logscale,files_Data_num(:,i))
    title(files_Name(i))
    xlabel('Escala Logaritmica 5Hz - 5Khz')
    ylabel(yl);
end