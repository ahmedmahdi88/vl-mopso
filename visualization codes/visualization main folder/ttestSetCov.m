%% initialization and adding required paths
p=pwd;
p(p=='\')='/';
addpath([p '/..']);
%% finding setcoverage for all 10 scenarios
for Scenario=1:10
    AddRequiredPaths;
    C_VL_MOmut(Scenario) = SetCoverage2(paretoFrontvl,paretoFront);
    C_MOmut_VL(Scenario) = SetCoverage2(paretoFront,paretoFrontvl);
    C_VL_MO(Scenario) = SetCoverage2(paretoFrontvl,paretoFrontwm);
    C_MO_VL(Scenario) = SetCoverage2(paretoFrontwm,paretoFrontvl);
    C_VL_N2(Scenario) = SetCoverage2(paretoFrontvl,pno);
    C_N2_VL(Scenario) = SetCoverage2(pno,paretoFrontvl);
end
%% visualizing the set coverage changing
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
%% copute T-Test values
[~,pvm]=ttest(C_VL_MOmut,C_MOmut_VL);
[~,pvwm]=ttest(C_VL_MO,C_MO_VL);
[~,pvn]=ttest(C_VL_N2,C_N2_VL);
%% visualizing T-Test
somedata=[pvwm pvm pvn];
somenames={'ttest(SC-MOPSO,MOPSO)','ttest(SC-MOPSO,m-MOPSO)', 'ttest(SC-MOPSO,NSGA-II)'};
f4=figure;
bar(somedata);set(gca,'xticklabel',somenames);
title(['T-Test ']);
%% saving
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
saveas(f1,[p '/results images/' folder '/SetCoverage(mopsomut-vlmopso)-allScenarios.png']);
saveas(f3,[p '/results images/' folder '/SetCoverage(mopso-vlmopso)-allScenarios.png']);
saveas(f2,[p '/results images/' folder '/SetCoverage(nsga2-vlmopso)-allScenarios.png']);
saveas(f4,[p '/results images/' folder '/SetCoverage-ttest-allScenarios.png']);
%% 
clc;
disp('save is done')