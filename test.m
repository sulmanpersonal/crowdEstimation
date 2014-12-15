clear
clc
load('IDx.mat')
load('TimeStamp.mat')
load('Xi.mat')
load('Yi.mat')
load('ZONE.mat')
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
TRANSITIONP = zeros(183,183);
TRANSITIONN = zeros(183,183);
for s=1:1:size(zoneChangeP,2)
    subzone = zoneChangeP(find(zoneChangeP(:,s)),s);
    for t=1:1:size(subzone,1)-1
        if POS_TRA_ID(s,1)==1
            TRANSITIONP(subzone(t,1),subzone(t+1,1)) = TRANSITIONP(subzone(t,1),subzone(t+1,1)) + 1;
        else
            TRANSITIONN(subzone(t,1),subzone(t+1,1)) = TRANSITIONN(subzone(t,1),subzone(t+1,1)) + 1;
        end
    end
    clearvars subzone
end
clearvars s t
save('TRANSITIONP.mat','TRANSITIONP');
save('TRANSITIONN.mat','TRANSITIONN');

%%
dp = [];
for i = 1:100
    for t = 1:46
        if zoneChangeT(t,i) >=0
            dp = [dp zoneChangeT(t,i)];
        end
        if zoneChangeT(t,i)<0
            break;
        end
    end
end
clearvars i t










