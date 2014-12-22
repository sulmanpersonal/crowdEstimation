ZoneNumber = 105;
Neighbor = findNeighbours(ZoneNumber,ZONE);
figure;
for i=1:8
    if Neighbor(i,1)~=0
        scatter(1:162,DELTAP(ZoneNumber,Neighbor(i,1),:));
        while(waitforbuttonpress~=1)
        end
    end
end
close all
clearvars i
