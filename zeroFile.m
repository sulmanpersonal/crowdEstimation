load('ZONE.mat');
load('quan.mat');
TRANSITIONP = zeros(183,183);
TRANSITIONN = zeros(183,183);
DELTAN=zeros(183,183,162);
DELTAP=zeros(183,183,162);
countPositives = [0 0];
zone0 = [71 0 0;75 0 0;81 0 0;89 0 0;96 0 0;103 0 0;116 0 0;131 0 0;146 0 0;161 0 0;174 0 0;23 0 0;34 0 0;45 0 0;55 0 0;66 0 0];
saveFiles
clc