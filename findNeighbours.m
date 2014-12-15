function Neighbour = findNeighbours(ZoneNumber,ZONE)
Boxx=0.6;
Boxy=2.5;
Neighbour = zeros(8,1);
temp = ZONE(ZoneNumber,:);
% for 1
x = temp(1,3)+(Boxx/2);
y = temp(1,4)+(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(1,1) = a;
end

% for 2
x = temp(1,3)+(Boxx/2);
y = temp(1,2)+(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(2,1) = a;
end

% for 3
x = temp(1,3)+(Boxx/2);
y = temp(1,2)-(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(3,1) = a;
end

% for 4
x = (temp(1,3) + temp(1,1))/2;
y = temp(1,2)-(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(4,1) = a;
end

% for 5
x = temp(1,1)-(Boxx/2);
y = temp(1,2)-(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(5,1) = a;
end

% for 6
x = temp(1,1)-(Boxx/2);
y = temp(1,2)+(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(6,1) = a;
end

% for 7
x = temp(1,1)-(Boxx/2);
y = temp(1,4)+(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(7,1) = a;
end

% for 8
x = (temp(1,3) + temp(1,1))/2;
y = temp(1,4)+(Boxy/2);
a = find(ZONE(:,1)<=x(1,1) & ZONE(:,3)>x(1,1) & ZONE(:,2)<=y(1,1) & ZONE(:,4)>y(1,1));
if(~isempty(a))
    Neighbour(8,1) = a;
end

end