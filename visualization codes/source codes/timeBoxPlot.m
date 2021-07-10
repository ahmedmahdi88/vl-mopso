% clear;close all;
for Scenario=1:10
    AddRequiredPaths;
   t_MOmut(Scenario) = res.t;
    t_VL(Scenario) = resvl.t;
    t_MO(Scenario) = reswm.t;
    t_WS(Scenario) = resws.t;
    t_N2(Scenario) = n.t;
end
f1=figure('position',get(0, 'Screensize'));
h=boxplot([t_VL' t_MOmut' t_MO'    t_N2' t_WS'],'Labels',{...
   'SC-MOPSO', 'm-MOPSO','MOPSO','NSGA-II','WS-VLPSO'});
set(gcf,'color','w');
set(h,'LineWidth', 2);
set(gca,'FontSize',6);
set(ax,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
title('Comparison between SC-MOPSO and other algorithms in terms of Execution Time within 10 Scenarios ')
%% save xlsx
SC_MOPSO = t_VL'; 
m_MOPSO = t_MOmut'; 
MOPSO = t_MO'  ;
NSGA_II = t_N2'  ;
WS_VLPSO = t_WS' ;
T=table (SC_MOPSO,m_MOPSO,MOPSO,NSGA_II,WS_VLPSO);
filename = 'Comparison between SC-MOPSO and other algorithms in terms of Execution Time within 10 Scenarios.xlsx';
writetable(T,filename,'Sheet',1)
%%

p=pwd;p(p=='\')='/';
F    = getframe(f1);
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
imwrite(F.cdata, [p '/results images/' folder '/TimeBoxPlot.png'], 'png')
clc;
close all;
%% save xlsx
SC_MOPSO = t_VL'; 
m_MOPSO= t_MOmut'; 
MOPSO = t_MO'  ;
NSGA_II = t_N2'  ;
WS_VLPSO = t_WS' ;
T=[SC_MOPSO, m_MOPSO, MOPSO,NSGA_II ,WS_VLPSO];
baseFileName = 'Comp(SC-MOPSO,others)Execution-Time measure 10 Scenarios.xlsx';
fold=[p '/results images/' folder];
fullFileName = fullfile(fold, baseFileName);
 tt={'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'}
xlswrite(fullFileName,tt,'Range','A1')
xlswrite(fullFileName,T,'Range','A2')
%%
disp('save is done');