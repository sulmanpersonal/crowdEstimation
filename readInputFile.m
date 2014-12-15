function readInputFile(FileName, boolFirstFile)
clc

if(boolFirstFile == 1)
    zeroFile
end
loadFiles
filename = FileName;
delimiter = '\t';

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
TimeStamp = dataArray{:, 1};
IDx = dataArray{:, 2};
Xi = dataArray{:, 3};
Yi = dataArray{:, 4};

%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans;

%%
% save('TimeStamp.mat','TimeStamp');
% save('IDx.mat','IDx');
% save('Xi.mat','Xi');
% save('Yi.mat','Yi');

zones = zeros(size(TimeStamp,1),1);
POS_TRA_ID = zeros(100,1);
for s=min(IDx):1:max(IDx)
    index = find(IDx == s);
    x = Xi(index);
    y = Yi(index);
    if(max(x)>=-0.6 && max(x)<=5.4 && max(y)>=15 && max(y)<=20)
        POS_TRA_ID(s,1) = 1;
    end
    for t=1:1:size(index,1)
        xi=Xi(index(t));
        yi = Yi(index(t));
        zones(index(t),1) = findZone(xi,yi,ZONE);
    end
end
clearvars s index x y t xi yi

%%
for s=min(IDx):1:max(IDx)
    index = find(IDx == s);
    zone = zones(index);
    [~,index] = unique(zone,'first');
    zone = zone(sort(index));
    time = TimeStamp(sort(index));
    for t=1:1:size(zone,1)
        zoneChangeP(t,s) = zone(t,1);
        zoneChangeT(t,s) = time(t,1);
    end
end
zoneChangeT = diff(zoneChangeT,1);

clearvars s t zone index time

%%
for s=1:1:size(zoneChangeP,2)
    f = find(zoneChangeP(:,s));
    if(isempty(f))
        continue;
    end
    subtime = zoneChangeT(f(1:size(f,1)-1,1),s);
    subzone = zoneChangeP(f,s);
    for t=1:1:size(subzone,1)-1
        if POS_TRA_ID(s,1)==1
            TRANSITIONP(subzone(t,1),subzone(t+1,1)) = TRANSITIONP(subzone(t,1),subzone(t+1,1)) + 1;
            DELTAP(subzone(t,1),subzone(t+1,1),max(find(quan<=subtime(t,1)))) = DELTAP(subzone(t,1),subzone(t+1,1),max(find(quan<=subtime(t,1))))+1;
        else
            TRANSITIONN(subzone(t,1),subzone(t+1,1)) = TRANSITIONN(subzone(t,1),subzone(t+1,1)) + 1;
            DELTAN(subzone(t,1),subzone(t+1,1),max(find(quan<=subtime(t,1)))) = DELTAN(subzone(t,1),subzone(t+1,1),max(find(quan<=subtime(t,1))))+1;
        end
    end
    clearvars subzone subtime
end
clearvars s t

%%
% for i = min(IDx):max(IDx)
%     for t = 1:size(zoneChangeT,1)
%         if zoneChangeT(t,i) >=0
%             dp = [dp zoneChangeT(t,i)];
%         end
%         if zoneChangeT(t,i)<0
%             break;
%         end
%     end
% end
% clearvars i t





saveFiles
end