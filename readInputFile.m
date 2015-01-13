% readInput 
% @params:  FileName => fileName in .dat format to read data
%           boolFirstFile =>    1 if want to erase previous data stored in
%                               work directory
%                               0 if overwrite previous data stored in work
%                               directoy

function readInputFile(FileName, boolFirstFile)
clc

if(boolFirstFile == 1)
    % zeroFile sets all files to zero => data is cleared
    zeroFile
end

% loadFiles load all data files to worksppace
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

%% creating %zones% variable of all x y values obtained from the file input
%  size of zones same as sizeof(TimeStamp)
%  search each xy from each sample in %ZONE% variable to check zone number

% set zone size equal to sizeof(TimeStamp)
zones = zeros(size(TimeStamp,1),1);
% %POS_TRA_ID% for checking trajectory be +ve or -ve
POS_TRA_ID = zeros(100,1);
for s=min(IDx):1:max(IDx)
    index = find(IDx == s);
    % %x,y% all xy values by single trajectory
    x = Xi(index);
    y = Yi(index);
    if(max(x)>=-0.6 && max(x)<=5.4 && max(y)>=15 && max(y)<=20)
        % %coutPositives(1,1)% to save total number of positive trajectories
        countPositives(1,1) = countPositives(1,1)+1;
        POS_TRA_ID(s,1) = 1;
    else
        % %coutPositives(1,2)% to save total number of negative trajectories
        countPositives(1,2) = countPositives(1,2)+1;
    end
    for t=1:1:size(index,1)
        % %xi% = single x sample from file 
        xi=Xi(index(t));
        % %yi% = single y sample from file 
        yi = Yi(index(t));
        % %findZone()% = gives zone of xy given
        zones(index(t),1) = findZone(xi,yi,ZONE);
    end
end
clearvars s index x y t xi yi

%% find changes in zones => transition points
for s=min(IDx):1:max(IDx)
    index = find(IDx == s);
    zone = zones(index);
    % %unique% gives array without repitition and stores in %index%
    [~,index] = unique(zone,'first');
    % %zone% sorted zone transition on basis of indexes
    zone = zone(sort(index));
    % %time% sorted time transition of zones on basis of indexes
    time = TimeStamp(sort(index));
    for t=1:1:size(zone,1)
        % %zonechangeP% = zone transition of all trajectories
        zoneChangeP(t,s) = zone(t,1);
        % %zonechangeT% = time transition of zones of all trajectories
        zoneChangeT(t,s) = time(t,1);
    end
end
% %zoneChangeT% = total time passed in one zone
zoneChangeT = diff(zoneChangeT,1);

clearvars s t zone index time

%% populate the transition an times of transitions data to workspace
for s=1:1:size(zoneChangeP,2)
    % %f% = zone transitions by single trajectory
    f = find(zoneChangeP(:,s));
    if(isempty(f))
        continue;
    end
    % %subtime% time to make transition in each zone by single trajectory
    subtime = zoneChangeT(f(1:size(f,1)-1,1),s);
    % %subzone% copy of %f%
    subzone = zoneChangeP(f,s);
    for t=1:1:size(subzone,1)-1
        if POS_TRA_ID(s,1)==1
            % %TRANSITIONP% 183x183 => number of transitions by +ve trajectories in total time of simulation => zone(n-1) x zone(n)
            TRANSITIONP(subzone(t,1),subzone(t+1,1)) = TRANSITIONP(subzone(t,1),subzone(t+1,1)) + 1;
            % %DELTAP% 183x183x162 => number of transitions by +ve trajectories in particular time => zone(n-1) x zone(n) x time(quantized)
            DELTAP(subzone(t,1),subzone(t+1,1),max(find(quan<=subtime(t,1)))) = DELTAP(subzone(t,1),subzone(t+1,1),max(find(quan<=subtime(t,1))))+1;
            a = find(zone0(:,1) == subzone(t,1));
            if ~isempty(a)
                zone0(a,2) = zone0(a,2)+1;
            end
        else
            % %TRANSITIONN% 183x183 => number of transitions by -ve trajectories in total time of simulation => zone(n-1) x zone(n)
            TRANSITIONN(subzone(t,1),subzone(t+1,1)) = TRANSITIONN(subzone(t,1),subzone(t+1,1)) + 1;
            % %DELTAN% 183x183x162 => number of transitions by -ve trajectories in particular time => zone(n-1) x zone(n) x time(quantized)
            DELTAN(subzone(t,1),subzone(t+1,1),max(find(quan<=subtime(t,1)))) = DELTAN(subzone(t,1),subzone(t+1,1),max(find(quan<=subtime(t,1))))+1;
            % %a% checks if the zone underconsideration is one of starting
            % zones given in %zone0%
            a = find(zone0(:,1) == subzone(t,1));
            if ~isempty(a)
                zone0(a,3) = zone0(a,3)+1;
            end
        end
    end
    clearvars subzone subtime
end
clearvars s t a
%% savefiles would save important variables to work directory to be used again
saveFiles
end