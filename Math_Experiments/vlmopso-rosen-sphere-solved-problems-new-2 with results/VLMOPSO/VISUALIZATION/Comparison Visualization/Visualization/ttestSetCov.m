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
plot(C_VL_MO,'linewidth',2);xlabel('scenario');ylabel('setCoverage');
hold on; 
plot(C_MO_VL,'linewidth',2);legend({'C(VL-MOPSO,MOPSO)','C(MOPSO,VL-MOPSO)'});
f2=figure;
plot(C_VL_N2,'linewidth',2);xlabel('scenario');ylabel('setCoverage');
hold on; 
plot(C_N2_VL,'linewidth',2);legend({'C(VL-MOPSO,NSGA-II)','C(NSGA-II,VL-MOPSO)'});
f3=figure;
plot(C_VL_MOmut,'linewidth',2);xlabel('scenario');ylabel('setCoverage');
hold on; 
plot(C_MOmut_VL,'linewidth',2);legend({'C(VL-MOPSO,MOPSO-Mutation)','C(MOPSO-Mutation,VL-MOPSO)'});

[~,pvm]=ttest(C_VL_MOmut,C_MOmut_VL);
[~,pvwm]=ttest(C_VL_MO,C_MO_VL);
[~,pvn]=ttest(C_VL_N2,C_N2_VL);
somedata=[pvwm pvm pvn];
somenames={'ttest(VL-MOPSO,MOPSO)', 'ttest(VL-MOPSO,MOPSO-Mutation)','ttest(VL-MOPSO,NSGA-II)'};
f4=figure;
bar(somedata);set(gca,'xticklabel',somenames);
suptitle(['ttest ']);
p=pwd;
saveas(f3,[p '\images\SetCoverage(mopsoMut-vlmopso)-rsp-allScenarios.png']);
saveas(f1,[p '\images\SetCoverage(mopso-vlmopso)-rsp-allScenarios.png']);
saveas(f2,[p '\images\SetCoverage(nsga2-vlmopso)-rsp-allScenarios.png']);
saveas(f4,[p '\images\SetCoverage-ttest-rsp-allScenarios.png']);