% loadFiles 
% loads data files obtained from learning
% these workspace variables explanation are shown below

% countPositives[1,1] = total positive trajectories during learning
% 
% countPositives[1,2] = total negative trajectories during learning
% 
% DELTAN 183x183x162 => number of transitions by -ve trajectories in 
% particular time => zone(n-1) x zone(n) x time(quantized)
% 
% DELTAP 183x183x162 => number of transitions by +ve trajectories in 
% particular time => zone(n-1) x zone(n) x time(quantized)
% 
% quan 162x1 => this contain the ranges of time quantized over 0:6000 stamps
% 
% TRANSITIONN 183x183 => number of transitions by -ve trajectories in total
% time of simulation => zone(n-1) x zone(n)
%
% TRANSITIONP 183x183 => number of transitions by +ve trajectories in total
% time of simulation => zone(n-1) x zone(n)
% 
% ZONE 183x4 => contains 4 points of rectangle for each zone boundry in x-y 
% plane.
% 
% zone0 16x3 => contains the data for starting zones => zone0[:,1] = starting
% zone numbers, zone0[:,2] = total +ve trajectories through particular zone, 
% zone0[:,3] = total -ve trajectories through particular zone.

load('TRANSITIONN.mat');
load('TRANSITIONP.mat');
load('ZONE.mat');
load('DELTAN.mat');
load('DELTAP.mat');
load('quan.mat');
load('countPositives.mat');
load('zone0.mat');