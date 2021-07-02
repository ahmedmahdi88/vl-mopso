% % function HvVisualizationComp(s)
% Scenario=s;
% AddRequiredPaths;
if nobjArr(1)==2
somedata=[HyperVolume(paretoFrontwm),HyperVolume(paretoFront),HyperVolume(paretoFrontvl),HyperVolume(pno),HyperVolume(paretoFrontws)]
somenames={'MOPSO','m-MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'};
bar(somedata);
set(gca,'xticklabel',somenames)
suptitle('HV')
else
    p=pwd;p(p=='\')='/';
    vl=load([p '/results/' problems{problemNumber} '/hvValues/HV.mat']);
    vl=vl.v_VL(Scenario);
    mm=load([p '/results/' problems{problemNumber} '/hvValues/HV.mat']);
    mm=mm.v_MOmut(Scenario);
    m=load([p '/results/' problems{problemNumber} '/hvValues/HV.mat']);
    m=m.v_MO(Scenario);
    n2=load([p '/results/' problems{problemNumber} '/hvValues/HV.mat']);
    n2=n2.v_N2(Scenario);
somedata=[m,mm,vl,n2]
somenames={'MOPSO','m-MOPSO','SC-MOPSO','NSGA-II'};
bar(somedata);
set(gca,'xticklabel',somenames)
title('HV')
end
    
% end







