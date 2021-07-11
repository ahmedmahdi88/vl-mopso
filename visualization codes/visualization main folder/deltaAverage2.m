% clear;close all;
cont = 1;
for problemNumber=[10:14]
for Scenario=1:10
   AddRequiredPaths;
    pareto = res.paretoFront
    paretovl  = resvl.paretoFront;
    paretowm = reswm.paretoFront;
    paretows = paretoFrontws;
    pareton2 = n.paretoFront.solutionsObjectiveValues;
    
    delta=DeltaQuotMetric(pareto);
    try
    deltavl=DeltaQuotMetric(paretovl);
    catch
        disp('dd');
    end
    deltawm=DeltaQuotMetric(paretowm);
     deltaws=DeltaQuotMetric(paretows);
    deltan2=DeltaQuotMetric(pareton2); 
    

meanDelta(cont)=(delta);
meanDeltavl(cont)=(deltavl);
meanDeltawm(cont)=(deltawm);
meanDeltaws(cont)=(deltaws);
meanDeltan2(cont)=(deltan2);
cont = cont + 1;
end
end
[~,pvm]=ttest(meanDelta,meanDeltavl);
[~,pvwm]=ttest(meanDeltawm,meanDeltavl);
[~,pvws]=ttest(meanDeltaws,meanDeltavl);
[~,pvn]=ttest(meanDeltan2,meanDeltavl);
f1=figure;
h=boxplot([meanDeltavl' meanDelta' meanDeltawm'  meanDeltan2' meanDeltaws' ],'Labels',{...
   'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'});
title('Comparison between SC-MOPSO and other algorithms in terms of Delta for Fonseca & ZDT functions')
set(gcf,'color','w');
set(gca,'FontSize',12);
set(h,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
%% save xlsx
SC_MOPSO = meanDeltavl';
m_MOPSO = meanDelta';
MOPSO = meanDeltawm';
NSGA_II = meanDeltan2';
WS_VLPSO = meanDeltaws'; 
T=table (SC_MOPSO,m_MOPSO,MOPSO,NSGA_II,WS_VLPSO);
filename = [cd '/tables/Comparison between SC-MOPSO and other algorithms in terms of Delta for Fonseca & ZDT functions.xlsx'];
writetable(T,filename,'Sheet',1)
%%
f2=figure;
title('Delta T-Test for Fonseca & ZDT functions');
set(gca,'FontSize',16);
set(gcf,'color','w');
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

bdata=[pvm;pvwm;pvn;pvws];
coloredBar(bdata);
set(gcf,'color','w');
set(gca,'xticklabel',{[]})
legend({'ttest(SC-MOPSO,m-MOPSO)','ttest(SC-MOPSO,MOPSO)','ttest(SC-MOPSO,NSGA-II)',...
    'ttest(SC-MOPSO,WS-VLPSO)'},'location','northoutside')
p=pwd;p(p=='\')='/';
folder='mathAll-Functions';
saveas(f1, [p '/results images/' folder '/deltaAll2.png'])
saveas(f2, [p '/results images/' folder '/deltaAllTtest2.png'])
clc;
% close all;
disp('save is done');