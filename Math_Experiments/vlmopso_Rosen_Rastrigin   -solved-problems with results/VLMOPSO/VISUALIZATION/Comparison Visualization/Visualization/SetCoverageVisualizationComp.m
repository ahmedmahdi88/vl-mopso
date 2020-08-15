function   SetCoverageVisualizationComp(s)
Scenario=s;
AddRequiredPaths;
somedata=[SetCoverage2(paretoFront,paretoFrontvl) SetCoverage2(paretoFrontvl,paretoFront) ];
somenames={'c(MOPSO,VL-MOPSO)', 'c(VL-MOPSO,MOPSO)'};
subplot(3,1,1)
bar(somedata);set(gca,'xticklabel',somenames)

somedata=[SetCoverage2(pno,paretoFrontvl) SetCoverage2(paretoFrontvl,pno) ];
somenames={'c(NSGA-II,VL-MOPSO)', 'c(VL-MOPSO,NSGA-II)'};
subplot(3,1,2)
bar(somedata);set(gca,'xticklabel',somenames)

somedata=[SetCoverage2(paretoFront,pno) SetCoverage2(pno,paretoFront) ];
somenames={'c(MOPSO,NSGA-II)', 'c(NSGA-II,MOPSO)'};
subplot(3,1,3)
bar(somedata);set(gca,'xticklabel',somenames)

suptitle('set coverage' );
% title([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);
end