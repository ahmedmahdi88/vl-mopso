% function [fl vl]=NDS(s)
% Scenario=s;
% AddRequiredPaths;

    nv=length(paretoFrontvl);
fl=length(paretoFront);
ffl=length(paretoFrontwm);
nsga2=length(pno);
ws = length(paretoFrontvl);
somedata=[ffl,fl,nv,nsga2,ws];
somenames={'MOPSO','m-MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'};

bar(somedata);title('NDS');
set(gca,'xticklabel',somenames)

% title([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);

