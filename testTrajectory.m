clear
clc
loadFiles
normalizeMatrices
readFileTest
index = find(IDx == 82);
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
result = 0;
pk = countPositives(1,1)/(countPositives(1,1)+countPositives(1,2));
ans = sum(zone0,1);
p0 = zone0(find(zone0(:,1)==75),2)/ans(1,2);
[Prob,Neighbor] = ProbFunc1(75,p0*pk,TRANSITIONPnorm,DELTAPnorm);
ans1 = diff(time,1);
maximum = max(Prob,[],1);
x = find(Prob(:,max(find(quan<=ans1(1,1))))==maximum(1,max(find(quan<=ans1(1,1)))));
result(1,1) = Neighbor(x,1);
result(1,2) = zones(2,1);
for s=2:1:size(ans1,1)
    [Prob,Neighbor] = ProbFunc1(result(s-1,2),Prob(find(Neighbor==result(s-1,2)),max(find(quan<=ans1(s-1,1)))),TRANSITIONPnorm,DELTAPnorm);
    maximum = max(Prob,[],1);
    x = find(Prob(:,max(find(quan<=ans1(s,1))))==maximum(1,max(find(quan<=ans1(s,1)))));
    t = 1;
    while size(x,1)>1
        x = find(Prob(:,max(find(quan<=ans1(s-t,1))))==maximum(1,max(find(quan<=ans1(s-t,1)))));
        t = t+1;
    end
    result(s,1) = Neighbor(x,1);
    result(s,2) = zones(s+1,1);
end
clearvars pk ans p0 maximum s