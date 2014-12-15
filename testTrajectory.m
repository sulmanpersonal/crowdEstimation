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
%%
[~,index] = unique(zones,'first');
zones = zones(sort(index));
time = time(sort(index));
clearvars s xi yi index id

%%
pk = countPositives(1,1)/(countPositives(1,1)+countPositives(1,2));
ans = sum(zone0,1);
p0 = zone0(find(zone0(:,1)==75),2)/ans(1,2);
Prob = ProbFunc1(75,p0*pk,TRANSITIONPnorm,DELTAPnorm);
clearvars pk ans p0