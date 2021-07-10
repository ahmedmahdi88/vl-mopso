% clear;clc;close all;
for Scenario=1:10
    AddRequiredPaths;
    trueParetoFront=find_opt_objs(paretoFront,paretoFrontvl,pno,paretoFrontwm,paretoFrontws,nobjArr);
    R_MOmut(Scenario) = GenerationalDistance(paretoFront,trueParetoFront,2);
    R_VL(Scenario) = GenerationalDistance(paretoFrontvl,trueParetoFront,2);
    R_MO(Scenario) = GenerationalDistance(paretoFrontwm,trueParetoFront,2);
    R_WS(Scenario) = GenerationalDistance(paretoFrontws,trueParetoFront,2);
    R_N2(Scenario) = GenerationalDistance(pno,trueParetoFront,2);
end

f1=figure('position',get(0, 'Screensize'));
h = boxplot([R_VL' R_MOmut' R_MO'  R_N2' R_WS' ],'Labels',{...
    'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'});    
title('Comparison between SC-MOPSO and other algorithms in terms of RGD within 10 Scenarios ')
set(gcf,'color','w');
set(h,'linew',2)
set(gca,'FontSize',6);
set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

p=pwd;p(p=='\')='/';
F    = getframe(f1);
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
imwrite(F.cdata, [p '/results images/' folder '/RGDBoxPlot.png'], 'png')
%% save xlsx
SC_MOPSO = R_VL'; 
m_MOPSO= R_MOmut'; 
MOPSO = R_MO'  ;
NSGA_II = R_N2'  ;
WS_VLPSO = R_WS' ;
T=[SC_MOPSO, m_MOPSO, MOPSO,NSGA_II ,WS_VLPSO];
baseFileName = 'Comp(SC-MOPSO,others)RGD 10 Scenarios.xlsx';
fold=[p '/results images/' folder];
fullFileName = fullfile(fold, baseFileName);
 tt={'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'}
xlswrite(fullFileName,tt,'Range','A1')
xlswrite(fullFileName,T,'Range','A2')
%%