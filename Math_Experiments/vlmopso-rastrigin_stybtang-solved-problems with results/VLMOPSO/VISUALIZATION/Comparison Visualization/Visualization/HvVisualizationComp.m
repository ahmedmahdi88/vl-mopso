function HvVisualizationComp(s)
Scenario=s;
AddRequiredPaths;




somedata=[HyperVolume(paretoFrontwm),HyperVolume(paretoFront),HyperVolume(paretoFrontvl),HyperVolume(pno)]
somenames={'MOPSO','m-MOPSO','SC-MOPSO','NSGA-II'};
bar(somedata);title('Hyper Volume');
set(gca,'xticklabel',somenames)
suptitle('HV')

% title([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);

end







