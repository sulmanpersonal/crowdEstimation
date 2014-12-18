function [Prob,neighbor] = ProbFunc1(zoneNumber,preProb,TRANSITIONPnorm, DELTAPnorm)
    loadFiles;
    neighbor = findNeighbours(zoneNumber,ZONE);
    Prob = zeros(8,162);
    for s=1:1:8
        if neighbor(s,1)~=0
            Prob(s,:) = TRANSITIONPnorm(zoneNumber,neighbor(s,1)) * DELTAPnorm(zoneNumber,neighbor(s,1),:) * preProb;
        end
    end
end