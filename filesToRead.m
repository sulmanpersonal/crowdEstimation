% filesToRead
% This files reads all files for learning purposes and populate to required
% variable in workspace

clear
clc
% %s% = path to trajectories files obtained from simulator
s = 'C:\Users\sulman.baig\Documents\DATA\50-100\';
% %F% = load all files of .dat format from given path
F = dir('C:\Users\sulman.baig\Documents\DATA\50-100\*.dat');
% %readInputFile% gets data from file and update the data in working
% directory
readInputFile(strcat(s,F(1).name),1);
strcat(s,F(2).name)
for ii=2:500
 strcat(s,F(ii).name);
 readInputFile(strcat(s,F(ii).name),0);
end
clearvars F s ii ans