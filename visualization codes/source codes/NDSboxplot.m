% clear;close all;
for Scenario=1:10
    AddRequiredPaths;
   nds_MOmut(Scenario) = length(paretoFront);
    nds_VL(Scenario) = length(paretoFrontvl);
    nds_MO(Scenario) = length(paretoFrontwm);
    nds_WS(Scenario) = length(paretoFrontws);
    nds_N2(Scenario) = length(pno);
end
f1=figure('position',get(0, 'Screensize'));
h = boxplot([nds_VL' nds_MOmut' nds_MO'   nds_N2' nds_WS' ],'Labels',{...
   'SC-MOPSO', 'm-MOPSO','MOPSO','NSGA-II','WS-VLPSO'});
set(gcf,'color','w');
set(gca,'FontSize',6);
set(gca,'LineWidth', 2);
set(h,'LineWidth', 2);

set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
title('Comparison between SC-MOPSO and other algorithms in terms of NDS within 10 Scenarios ')
p=pwd;p(p=='\')='/';
F    = getframe(f1);
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
imwrite(F.cdata, [p '/results images/' folder '/NDSBoxPlot.png'], 'png')
clc;
close all;
%% save xlsx
SC_MOPSO = nds_VL'; 
m_MOPSO= nds_MOmut'; 
MOPSO = nds_MO'  ;
NSGA_II = nds_N2'  ;
WS_VLPSO = nds_WS' ;
T=[SC_MOPSO, m_MOPSO, MOPSO,NSGA_II ,WS_VLPSO];
baseFileName = 'Comp(SC-MOPSO,others)NDS 10 Scenarios.xlsx';
fold=[p '/results images/' folder];
fullFileName = fullfile(fold, baseFileName);
 tt={'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'}
xlswrite(fullFileName,tt,'Range','A1')
xlswrite(fullFileName,T,'Range','A2')
%%
disp('save is done');