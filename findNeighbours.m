%% findNeighbours = find the neighbour zone numbers provided the current zone number
% @params:  ZoneNumber => zone whose neighbors to be found out
%           Zone => array containing the data of zones 4 point of each
%           rectangular zones
% @return:  Neighbour => array containg the name to 8 neighbours
%           Neighbour[1,1] = Top right neighbour
%           Neighbour[2,1] = Right neighbour
%           Neighbour[3,1] = Bottom right neighbour
%           Neighbour[4,1] = Bottom neighbour
%           Neighbour[5,1] = Bottom left neighbour
%           Neighbour[6,1] = left neighbour
%           Neighbour[7,1] = Top left neighbour
%           Neighbour[8,1] = Top neighbour
function Neighbour = findNeighbours(ZoneNumber,ZONE)
% %Boxx% = the size x of zone normally provided in %ZONE% array
Boxx=0.6;
%Boxy% = the size y of zone normally provided in %ZONE% array
Boxy=2.5;
Neighbour = zeros(8,1);
temp = ZONE(ZoneNumber,:);
% for Neighbour 1
x = temp(1,3)+(Boxx/2);
y = temp(1,4)+(Boxy/2);
% %a% finds the reguired zone in %ZONE% array if has neighbour or not
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(1,1) = a;
end

% for Neighbour 2
x = temp(1,3)+(Boxx/2);
y = temp(1,2)+(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(2,1) = a;
end

% for Neighbour 3
x = temp(1,3)+(Boxx/2);
y = temp(1,2)-(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(3,1) = a;
end

% for Neighbour 4
x = (temp(1,3) + temp(1,1))/2;
y = temp(1,2)-(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(4,1) = a;
end

% for Neighbour 5
x = temp(1,1)-(Boxx/2);
y = temp(1,2)-(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(5,1) = a;
end

% for Neighbour 6
x = temp(1,1)-(Boxx/2);
y = temp(1,2)+(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(6,1) = a;
end

% for Neighbour 7
x = temp(1,1)-(Boxx/2);
y = temp(1,4)+(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(7,1) = a;
end

% for Neighbour 8
x = (temp(1,3) + temp(1,1))/2;
y = temp(1,4)+(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(8,1) = a;
end

end