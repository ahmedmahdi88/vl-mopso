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
set(gcf,'color','w');
set(gca,'FontSize',6);
set(ax,'LineWidth', 2);
set(gca,'XTickLabelRotation', 45);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

p=pwd;p(p=='\')='/';
F    = getframe(f1);
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
saveas(gcf, [p '/results images/' folder '/SetCoverageBoxPlot.png'], 'png')
%% save xlsx
SC_MOPSO__m_MOPSO = C_VL_MOmut'; 
m_MOPSO__SC_MOPSO = C_MOmut_VL'; 
SC_MOPSO__MOPSO = C_VL_MO'  ;
MOPSO__SC_MOPSO = C_MO_VL'  ;
SC_MOPSO__NSGA_II = C_VL_N2' ;
NSGA_II__SC_MOPSO = C_N2_VL' ;
SC_MOPSO__WS_VLPSO = C_VL_WS';
WS_VLPSO__SC_MOPSO = C_WS_VL';
T=[SC_MOPSO__m_MOPSO, m_MOPSO__SC_MOPSO, SC_MOPSO__MOPSO,...
    MOPSO__SC_MOPSO ,SC_MOPSO__NSGA_II, NSGA_II__SC_MOPSO ,SC_MOPSO__WS_VLPSO,WS_VLPSO__SC_MOPSO];
baseFileName = 'Comp(SC-MOPSO,others)SetCoverage 10 Scenarios.xlsx';
fold=[p '/results images/' folder];
fullFileName = fullfile(fold, baseFileName);
 tt={'C(SC-MOPSO,m-MOPSO)'...
    ,'C(m-MOPSO,SC-MOPSO)','C(SC-MOPSO,MOPSO)','C(MOPSO,SC-MOPSO)','C(SC-MOPSO,NSGA-II)','C(NSGA-II,SC-MOPSO)','C(SC-MOPSO,WS-VLPSO)','C(WS-VLPSO,SC-MOPSO)'}
xlswrite(fullFileName,tt,'Range','A1')
xlswrite(fullFileName,T,'Range','A2')
%%