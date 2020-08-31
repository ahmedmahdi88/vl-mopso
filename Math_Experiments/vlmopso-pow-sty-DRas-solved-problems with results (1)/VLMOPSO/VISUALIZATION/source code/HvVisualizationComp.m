function HvVisualizationComp(s)
Scenario=s;
AddRequiredPaths;
somedata=[HyperVolume(paretoFrontwm),HyperVolume(paretoFront),HyperVolume(paretoFrontvl),HyperVolume(pno)]
somenames={'MOPSO','m-MOPSO','SC-MOPSO','NSGA-II'};
bar(somedata);
set(gca,'xticklabel',somenames)
suptitle('HV')
end







