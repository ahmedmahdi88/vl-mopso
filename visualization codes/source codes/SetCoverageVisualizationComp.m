% function   SetCoverageVisualizationComp(s)
% Scenario=s;
% AddRequiredPaths;
somedata=[SetCoverage2(paretoFront,paretoFrontvl) SetCoverage2(paretoFrontvl,paretoFront) ];
somenames={'c(m-MOPSO,SC-MOPSO)', 'c(SC-MOPSO,m-MOPSO)'};
subplot(3,1,1)
bar(somedata);set(gca,'xticklabel',somenames)

somedata=[SetCoverage2(pno,paretoFrontvl) SetCoverage2(paretoFrontvl,pno) ];
somenames={'c(NSGA-II,SC-MOPSO)', 'c(SC-MOPSO,NSGA-II)'};
subplot(3,1,3)
bar(somedata);set(gca,'xticklabel',somenames)

somedata=[SetCoverage2(paretoFrontwm,paretoFrontvl) SetCoverage2(paretoFrontvl,paretoFrontwm) ];
somenames={'c(MOPSO,SC-MOPSO)', 'c(SC-MOPSO,MOPSO)'};
subplot(3,1,2)
bar(somedata);set(gca,'xticklabel',somenames)

suptitle('set coverage' );
% end