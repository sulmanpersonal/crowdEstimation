function showAllTrajectories(FileName)
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
loadFiles
normalizeMatrices
showMap
hold on
for s=min(IDx):1:max(IDx)
    index = find(IDx == s);
    xi = Xi(index);
    yi = Yi(index);
    plot(xi,yi);
end
hold off
end
