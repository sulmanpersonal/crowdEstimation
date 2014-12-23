ZoneNumber = 105;
Neighbor = findNeighbours(ZoneNumber,ZONE);
figure;
for i=1:8
    if Neighbor(i,1)~=0
        scatter(1:162,DELTAPnorm(ZoneNumber,Neighbor(i,1),:));
        s = num2str(ZoneNumber);
        s = strcat(s,' -> ');
        s = strcat(s,num2str(Neighbor(i,1)));
        legend(s);
        xlabel('Quantized Time')
        ylabel('Normalized No. of People')
        while(waitforbuttonpress~=1)
        end
    end
end
close all
clearvars i
