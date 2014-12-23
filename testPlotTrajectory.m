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
showMap
hold on
pk = countPositives(1,1)/(countPositives(1,1)+countPositives(1,2));
ans1 = sum(zone0,1);
cZero = 0;
j=1;
while cZero == 0
    cZero = findZone(xi(j),yi(j),ZONE);
    plot(xi(j),yi(j),'*')
    s = num2str(cZero);
    h = text(xi(j)+0.15,yi(j)+0.5,s,'BackgroundColor',[.7 .9 .7],'FontSize',14);
    pause(0.001)
    delete(h);
    j = j+1;
end
%p0 = zone0(find(zone0(:,1)==cZero),2)/ans1(1,2);
[Prob,Neighbor] = ProbFunc1(cZero,1,TRANSITIONPnorm,DELTAPnorm);
maximum = max(Prob,[],1);
x = find(Prob(:,max(find(quan<=1)))==maximum(1,max(find(quan<=1))));
y = Prob(x,max(find(quan<=1)));
estimatedZone = Neighbor(x,1);
counter=1;
for i =j:length(xi)
    
    zoneNumber = findZone(xi(i),yi(i),ZONE);
    if(zoneNumber == 0)
        continue;
    end
    if(cZero == zoneNumber)
        counter = counter+1;
    else
        counter = 1;
        cZero = zoneNumber;
    end
    [Prob,Neighbor] = ProbFunc1(zoneNumber,1,TRANSITIONPnorm,DELTAPnorm);
    maximum = max(Prob,[],1);
    x = find(Prob(:,max(find(quan<=counter)))==maximum(1,max(find(quan<=counter))));
    y = Prob(x,max(find(quan<=counter)));
    estimatedZone = Neighbor(x(1,1),1);
   
    plot(xi(i),yi(i),'*')
    s = 'Z: ';
    s = strcat(s,num2str(zoneNumber));
    r = 'EZ: ';
    r = strcat(r,num2str(estimatedZone));
    h = text(xi(i)+0.15,yi(i)+0.5,s,'BackgroundColor',[.7 .9 .7],'FontSize',14);
    g = text(xi(i)-0.7,yi(i)+0.5,r,'BackgroundColor',[.5 .5 .9],'FontSize',14);
   %hold on %%%
   
    pause(0.001)
    delete(h);
    delete(g);
   %hold off
end
hold off
close all