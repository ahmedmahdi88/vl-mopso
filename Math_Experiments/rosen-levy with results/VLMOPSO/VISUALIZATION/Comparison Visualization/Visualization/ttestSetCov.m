clear;clc;close all;
for Scenario=1:10
    AddRequiredPaths;
    C_VL_MOmut(Scenario) = SetCoverage2(paretoFrontvl,paretoFront);
    C_MOmut_VL(Scenario) = SetCoverage2(paretoFront,paretoFrontvl);
    C_VL_MO(Scenario) = SetCoverage2(paretoFrontvl,paretoFrontwm);
    C_MO_VL(Scenario) = SetCoverage2(paretoFrontwm,paretoFrontvl);
    C_VL_N2(Scenario) = SetCoverage2(paretoFrontvl,pno);
    C_N2_VL(Scenario) = SetCoverage2(pno,paretoFrontvl);
end
f1=figure;
plot(C_VL_MOmut,'linewidth',2);xlabel('scenario');ylabel('setCoverage');
hold on; 
plot(C_MOmut_VL,'linewidth',2);legend({'C(SC-MOPSO,m-MOPSO)','C(m-MOPSO,SC-MOPSO)'});
f2=figure;
plot(C_VL_N2,'linewidth',2);xlabel('scenario');ylabel('setCoverage');
hold on; 
plot(C_N2_VL,'linewidth',2);legend({'C(SC-MOPSO,NSGA-II)','C(NSGA-II,SC-MOPSO)'});
f3=figure;
plot(C_VL_MO,'linewidth',2);xlabel('scenario');ylabel('setCoverage');
hold on; 
plot(C_MO_VL,'linewidth',2);legend({'C(SC-MOPSO,MOPSO)','C(MOPSO,SC-MOPSO)'});

[~,pvm]=ttest(C_VL_MOmut,C_MOmut_VL);
[~,pvwm]=ttest(C_VL_MO,C_MO_VL);
[~,pvn]=ttest(C_VL_N2,C_N2_VL);
somedata=[pvwm pvm pvn];
somenames={'ttest(SC-MOPSO,MOPSO)','ttest(SC-MOPSO,m-MOPSO)', 'ttest(SC-MOPSO,NSGA-II)'};
f4=figure;
bar(somedata);set(gca,'xticklabel',somenames);
suptitle(['ttest ']);
p=pwd;
saveas(f1,[p '\images\SetCoverage(mopsomut-vlmopso)-rl-allScenarios.png']);
saveas(f3,[p '\images\SetCoverage(mopso-vlmopso)-rl-allScenarios.png']);
saveas(f2,[p '\images\SetCoverage(nsga2-vlmopso)-rl-allScenarios.png']);
saveas(f4,[p '\images\SetCoverage-ttest-rl-allScenarios.png']);