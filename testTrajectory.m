clear
clc
loadFiles
normalizeMatrices
readFileTest
index = find(IDx == 65);
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
p0 = zone0(find(zone0(:,1)==45),2)/ans(1,2);
[Prob,Neighbor] = ProbFunc1(45,p0*pk,TRANSITIONPnorm,DELTAPnorm);
ans1 = diff(time,1);
maximum = max(Prob,[],1);
x = find(Prob(:,max(find(quan<=ans1(1,1))))==maximum(1,max(find(quan<=ans1(1,1)))));
y = Prob(x,max(find(quan<=ans1(1,1))));
result(1,1) = Neighbor(x,1);
result(1,2) = zones(2,1);
for s=2:1:size(ans1,1)
    %y = Prob(find(Neighbor==result(s-1,1)),max(find(quan<=ans1(s-1,1))));
    [Prob,Neighbor] = ProbFunc1(result(s-1,2),y,TRANSITIONPnorm,DELTAPnorm);
    maximum = max(Prob,[],1);
    a = max(find(quan<=ans1(s,1)));
    x = find(Prob(:,a)==maximum(1,a));
    t = 1;
    while size(x,1)>1
        a = max(find(quan<=ans1(s-t,1)));
        x = find(Prob(:,a)==maximum(1,a));
        t = t+1;
    end
    result(s,1) = Neighbor(x,1);
    result(s,2) = zones(s+1,1);
    y = Prob(x,a);
end
clearvars pk ans p0 maximum s Prob Neighbor ans1 maximum x t zones time y a

%%
showAllTrajectories('C:\Users\sulman.baig\Documents\DATA\50-100\20130510T101303.dat')
%showMap
hold on
plot(ZONE(result(:,1),1)+0.3,ZONE(result(:,1),2)+1.2,'c*','color',[0.5,0.5,0.5],'MarkerSize',20);
plot(ZONE(result(:,2),1)+0.3,ZONE(result(:,2),2)+1.2,'LineWidth',3,'color',[1,0,0]);
hold off