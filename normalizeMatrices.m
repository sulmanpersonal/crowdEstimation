TRANSITIONNnorm = TRANSITIONN./repmat(sum(TRANSITIONN,2),[1 size(TRANSITIONN,2)]);
TRANSITIONNnorm(isnan(TRANSITIONNnorm))=0;

TRANSITIONPnorm = TRANSITIONP./repmat(sum(TRANSITIONP,2),[1 size(TRANSITIONP,2)]);
TRANSITIONPnorm(isnan(TRANSITIONPnorm))=0;

DELTANnorm = DELTAN./repmat(sum(DELTAN,2),[1 size(DELTAN,2) 1]);
DELTANnorm(isnan(DELTANnorm))=0;

DELTAPnorm = DELTAP./repmat(sum(DELTAP,2),[1 size(DELTAP,2) 1]);
DELTAPnorm(isnan(DELTAPnorm))=0;