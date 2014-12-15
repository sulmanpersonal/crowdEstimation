clear
clc
s = 'C:\Users\sulman.baig\Documents\DATA\50-100\';
F = dir('C:\Users\sulman.baig\Documents\DATA\50-100\*.dat');
strcat(s,F(1).name);
readInputFile(strcat(s,F(1).name),1);
strcat(s,F(2).name)
for ii=2:500
 strcat(s,F(ii).name);
 readInputFile(strcat(s,F(ii).name),0);
end
clearvars F s ii ans