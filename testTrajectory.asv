clear
clc
loadFiles
normalizeMatrices
readFileTest
index = find(IDx == 97);
id = IDx(index);
time = TimeStamp(index);
xi = Xi(index);
yi = Yi(index);
clearvars IDx index TimeStamp Xi Yi
%%
showMap
hold on
plot(xi,yi)
hold off

%%
zones = zeros(size(xi,1),1);
for s=1:1:size(xi,1)
    zones(s,1) = findZone(xi(s,1),yi(s,1),ZONE);
end
[~,index] = unique(zones,'first');
zones = zones(sort(index));
time = time(sort(index));
clearvars s xi yi index id

%%
neighbor = findNeighbours(zones(1,1),ZONE);
for s=1:1:8
    if neighbor(s,1)~=0
       neighbor(s,2)= TRANSITIONPnorm(zones(1,1),neighbor(s,1));
       neighbor(s,3)= TRANSITIONNnorm(zones(1,1),neighbor(s,1));
       neighbor(s,4) = neighbor(s,2)/(neighbor(s,2)+neighbor(s,3));
    else
       neighbor(s,2)=0;
       neighbor(s,3)=0;
       neighbor(s,4)=0;
    end
end
clearvars s