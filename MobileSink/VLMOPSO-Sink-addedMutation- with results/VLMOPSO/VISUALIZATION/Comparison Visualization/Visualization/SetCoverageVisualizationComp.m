function   SetCoverageVisualizationComp(s)
Scenario=s;
AddRequiredPaths;
somedata=[SetCoverage2(paretoFront,paretoFrontvl) SetCoverage2(paretoFrontvl,paretoFront) ];
somenames={'c(FixedLength,VariableLength)', 'c(VariableLength,FixedLength)'};
subplot(3,1,1)
bar(somedata);set(gca,'xticklabel',somenames)

somedata=[SetCoverage2(pno,paretoFrontvl) SetCoverage2(paretoFrontvl,pno) ];
somenames={'c(nsga2,VariableLength)', 'c(VariableLength,nsga2)'};
subplot(3,1,2)
bar(somedata);set(gca,'xticklabel',somenames)

somedata=[SetCoverage2(paretoFront,pno) SetCoverage2(pno,paretoFront) ];
somenames={'c(FixedLength,nsga2)', 'c(nsga2,FixedLength)'};
subplot(3,1,3)
bar(somedata);set(gca,'xticklabel',somenames)

suptitle('set coverage' );
% title([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);
end