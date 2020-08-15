clear;clc;close all;
for Scenario=1:10
    AddRequiredPaths;
    C_VL_MO(Scenario) = SetCoverage2(paretoFrontvl,paretoFront);
    C_MO_VL(Scenario) = SetCoverage2(paretoFront,paretoFrontvl);
    C_VL_N2(Scenario) = SetCoverage2(paretoFrontvl,pno);
    C_N2_VL(Scenario) = SetCoverage2(pno,paretoFrontvl);
end
f1=figure;
plot(C_VL_MO,'linewidth',2);xlabel('scenario');ylabel('setCoverage');
hold on; 
plot(C_MO_VL,'linewidth',2);legend({'C(VL-MOPSO,MOPSO)','C(MOPSO,VL-MOPSO)'});
f2=figure;
plot(C_VL_N2,'linewidth',2);xlabel('scenario');ylabel('setCoverage');
hold on; 
plot(C_N2_VL,'linewidth',2);legend({'C(VL-MOPSO,NSGA-II)','C(NSGA-II,VL-MOPSO)'});
[~,pvm]=ttest(C_VL_MO,C_MO_VL);
[~,pvn]=ttest(C_VL_N2,C_N2_VL);
somedata=[pvm pvn];
somenames={'ttest(VL-MOPSO,MOPSO)', 'ttest(VL-MOPSO,NSGA-II)'};
f3=figure;
bar(somedata);set(gca,'xticklabel',somenames);
suptitle(['ttest ']);
p=pwd;
saveas(f1,[p '\rosenLevyFigs\SetCoverage(mopso-vlmopso)-rl-allScenarios.png']);
saveas(f2,[p '\rosenLevyFigs\SetCoverage(nsga2-vlmopso)-rl-allScenarios.png']);
saveas(f3,[p '\rosenLevyFigs\SetCoverage-ttest-rl-allScenarios.png']);