% clear;close all;
for Scenario=1:10
    AddRequiredPaths;
    C_VL_MOmut(Scenario) = SetCoverage2(paretoFrontvl,paretoFront);
    C_MOmut_VL(Scenario) = SetCoverage2(paretoFront,paretoFrontvl);
    C_MO_VL(Scenario) = SetCoverage2(paretoFrontwm,paretoFrontvl);
    C_VL_MO(Scenario) = SetCoverage2(paretoFrontvl,paretoFrontwm);
    C_WS_VL(Scenario) = SetCoverage2(paretoFrontws,paretoFrontvl);
    C_VL_WS(Scenario) = SetCoverage2(paretoFrontvl,paretoFrontws);
    C_VL_N2(Scenario) = SetCoverage2(paretoFrontvl,pno);
    C_N2_VL(Scenario) = SetCoverage2(pno,paretoFrontvl);
end
C_VL_MOmut;
C_MOmut_VL;
f1=figure;
ax=boxplot([C_VL_MOmut' C_MOmut_VL'  C_VL_MO' C_MO_VL' C_VL_N2' C_N2_VL' C_VL_WS' C_WS_VL' ],'Labels',{'C(SC-MOPSO,m-MOPSO)'...
    ,'C(m-MOPSO,SC-MOPSO)','C(SC-MOPSO,MOPSO)','C(MOPSO,SC-MOPSO)','C(SC-MOPSO,NSGA-II)','C(NSGA-II,SC-MOPSO)','C(SC-MOPSO,WS-VLPSO)','C(WS-VLPSO,SC-MOPSO)'});
title('Comparison between SC-MOPSO and other algorithms in terms of SetCoverage within 10 Scenarios ')
set(gca,'FontSize',6);
set(ax,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
p=pwd;p(p=='\')='/';
F    = getframe(f1);
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
% saveas(gcf, [p '/results images/' folder '/SetCoverageBoxPlot.png'], 'png')
