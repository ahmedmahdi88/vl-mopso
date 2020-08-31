function [fl vl]=NDS(s)
Scenario=s;
AddRequiredPaths;

    nv=length(paretoFrontvl);
fl=length(paretoFront);
ffl=length(paretoFrontwm);
nsga2=length(pno);
somedata=[ffl,fl,nv,nsga2];
somenames={'MOPSO','m-MOPSO','SC-MOPSO','NSGA-II'};

bar(somedata);title('NDS');
set(gca,'xticklabel',somenames)
suptitle('NDS')
% title([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);

