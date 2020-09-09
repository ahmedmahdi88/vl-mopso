% clear;close all;
for problemNumber=1:9
for Scenario=1:10
    AddRequiredPaths;
   pareto=res.paretoFront
   paretovl  = resvl.paretoFront;
    paretowm = reswm.paretoFront;
    pareton2 = n.paretoFront.solutionsObjectiveValues;
    delta(Scenario)=DeltaQuotMetric(pareto);
    deltavl(Scenario)=DeltaQuotMetric(paretovl);
    deltawm(Scenario)=DeltaQuotMetric(paretowm);
    deltan2(Scenario)=DeltaQuotMetric(pareton2); 
end
meanDelta(problemNumber)=mean(delta);
meanDeltavl(problemNumber)=mean(deltavl);
meanDeltawm(problemNumber)=mean(deltawm);
meanDeltan2(problemNumber)=mean(deltan2);
end
[~,pvm]=ttest(meanDelta,meanDeltavl);
[~,pvwm]=ttest(meanDeltawm,meanDeltavl);
[~,pvn]=ttest(meanDeltan2,meanDeltavl);
f1=figure;
boxplot([meanDelta' meanDeltawm'  meanDeltavl'  meanDeltan2' ],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II'});
title('Comparison between SC-MOPSO and other algorithms in terms of Delta for mathematical functions')
 set(gca,'FontSize',12);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
f2=figure;
title('Delta T-Test for all mathematical functions');
set(gca,'FontSize',16);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
bdata=[pvm;pvwm;pvn];
coloredBar(bdata);
set(gca,'xticklabel',{[]})
legend({'ttest(SC-MOPSO,m-MOPSO)','ttest(SC-MOPSO,MOPSO)','ttest(SC-MOPSO,NSGA-II)'},'location','northoutside')
p=pwd;p(p=='\')='/';
folder='mathAverage';
saveas(f1, [p '/results images/' folder '/deltaAverage.png'])
saveas(f2, [p '/results images/' folder '/deltaAverageTtest.png'])
clc;
% close all;
disp('save is done');