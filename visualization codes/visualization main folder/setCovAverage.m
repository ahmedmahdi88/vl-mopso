% clear;close all;
for problemNumber=10:14
for Scenario=1:10
    AddRequiredPaths;
    C_VL_MOmut(Scenario) = SetCoverage2(paretoFrontvl,paretoFront);
    C_MOmut_VL(Scenario) = SetCoverage2(paretoFront,paretoFrontvl);
    C_MO_VL(Scenario) = SetCoverage2(paretoFrontwm,paretoFrontvl);
    C_VL_MO(Scenario) = SetCoverage2(paretoFrontvl,paretoFrontwm);
    C_VL_N2(Scenario) = SetCoverage2(paretoFrontvl,pno);
    C_N2_VL(Scenario) = SetCoverage2(pno,paretoFrontvl);
end
meanC_VL_MOmut(problemNumber)=mean(C_VL_MOmut);
meanMOmut_VL(problemNumber)=mean(C_MOmut_VL);
meanC_MO_VL(problemNumber)=mean(C_MO_VL);
meanC_VL_MO(problemNumber)=mean(C_VL_MO);
meanC_VL_N2(problemNumber)=mean(C_VL_N2);
meanC_N2_VL(problemNumber)=mean(C_N2_VL);
end
[~,pvm]=ttest(meanC_VL_MOmut,meanMOmut_VL);
[~,pvwm]=ttest(meanC_MO_VL,meanC_VL_MO);
[~,pvn]=ttest(meanC_VL_N2,meanC_N2_VL);
f1=figure;
boxplot([meanC_VL_MOmut' meanMOmut_VL'  meanC_VL_MO'  meanC_MO_VL'   meanC_VL_N2' meanC_N2_VL' ],'Labels',{'C(SC-MOPSO,m-MOPSO)'...
    ,'C(m-MOPSO,SC-MOPSO)','C(SC-MOPSO,MOPSO)','C(MOPSO,SC-MOPSO)','C(SC-MOPSO,NSGA-II)','C(NSGA-II,SC-MOPSO)'});
title('Comparison between SC-MOPSO and other algorithms in terms of SetCoverage for mathematical functions')
 set(gca,'FontSize',8);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
f2=figure;
title('SetCov T-Test for all mathematical functions');
set(gca,'FontSize',16);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
bdata=[pvm;pvwm;pvn];
coloredBar(bdata);
set(gca,'xticklabel',{[]})
legend({'ttest(SC-MOPSO,m-MOPSO)','ttest(SC-MOPSO,MOPSO)','ttest(SC-MOPSO,NSGA-II)'},'location','northoutside')
p=pwd;p(p=='\')='/';
folder='mathAverage';
% saveas(f1, [p '/results images/' folder '/setCovAverage.png'])
% saveas(f2, [p '/results images/' folder '/setCovAverageTtest.png'])
clc;
% close all;
disp('save is done');