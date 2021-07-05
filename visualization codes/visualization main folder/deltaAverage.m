% clear;close all;
cont = 1;
for problemNumber=[1:5 10:14]
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
boxplot([meanDelta' meanDeltawm'  meanDeltavl'  meanDeltan2' meanDeltaws' ],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'});
title('Comparison between SC-MOPSO and other algorithms in terms of Delta for mathematical functions')
 set(gca,'FontSize',12);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
f2=figure;
title('Delta T-Test for all mathematical functions');
set(gca,'FontSize',16);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
bdata=[pvm;pvwm;pvn;pvws];
coloredBar(bdata);
set(gca,'xticklabel',{[]})
legend({'ttest(SC-MOPSO,m-MOPSO)','ttest(SC-MOPSO,MOPSO)','ttest(SC-MOPSO,NSGA-II)',...
    'ttest(SC-MOPSO,WS-VLPSO)'},'location','northoutside')
p=pwd;p(p=='\')='/';
folder='mathAll-Functions';
saveas(f1, [p '/results images/' folder '/deltaAll.png'])
saveas(f2, [p '/results images/' folder '/deltaAllTtest.png'])
clc;
% close all;
disp('save is done');