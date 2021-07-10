% clear;close all;
for Scenario=1:10
    AddRequiredPaths;
   v_MOmut(Scenario) = DeltaQuotMetric(paretoFront);
    v_VL(Scenario) = DeltaQuotMetric(paretoFrontvl);
    v_MO(Scenario) = DeltaQuotMetric(paretoFrontwm);
    v_WS(Scenario) = DeltaQuotMetric(paretoFrontws);
    v_N2(Scenario) = DeltaQuotMetric(pno);
end
f1=figure('position',get(0, 'Screensize'));
h=boxplot([v_VL' v_MOmut' v_MO' v_N2' v_WS'],'Labels',{...
    'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'});
set(gcf,'color','w');
set(h,'linew',2)
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
title('Comparison between SC-MOPSO and other algorithms in terms of Delta measure within 10 Scenarios ')

p=pwd;p(p=='\')='/';
F = getframe(f1);
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
imwrite(F.cdata, [p '/results images/' folder '/DeltaBoxPlot.png'], 'png')
%% save xlsx
SC_MOPSO = v_VL'; 
m_MOPSO= v_MOmut'; 
MOPSO = v_MO'  ;
NSGA_II = v_N2'  ;
WS_VLPSO = v_WS' ;
T=[SC_MOPSO, m_MOPSO, MOPSO,NSGA_II ,WS_VLPSO];
baseFileName = 'Comp(SC-MOPSO,others)Delta measure 10 Scenarios.xlsx';
fold=[p '/results images/' folder];
fullFileName = fullfile(fold, baseFileName);
 tt={'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'}
xlswrite(fullFileName,tt,'Range','A1')
xlswrite(fullFileName,T,'Range','A2')
%%
clc;
disp('saving is done');