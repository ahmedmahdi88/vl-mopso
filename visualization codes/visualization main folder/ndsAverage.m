% clear;close all;
for problemNumber=1:9
for Scenario=1:10
    AddRequiredPaths;
   pareto=res.paretoFront;
   paretovl  = resvl.paretoFront;
    paretowm = reswm.paretoFront;
    pareton2 = n.paretoFront.solutionsObjectiveValues;
    nds(Scenario)=size(pareto,1);
    ndsvl(Scenario)=size(paretovl,1);
    ndswm(Scenario)=size(paretowm,1);
    ndsn2(Scenario)=size(pareton2,1); 
end
meannds(problemNumber)=mean(nds);
meanndsvl(problemNumber)=mean(ndsvl);
meanndswm(problemNumber)=mean(ndswm);
meanndsn2(problemNumber)=mean(ndsn2);
end
[~,pvm]=ttest(meannds,meanndsvl);
[~,pvwm]=ttest(meanndswm,meanndsvl);
[~,pvn]=ttest(meanndsn2,meanndsvl);
f1=figure;
boxplot([meannds' meanndswm'  meanndsvl'  meanndsn2' ],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II'});
title('Comparison between SC-MOPSO and other algorithms in terms of NDs for mathematical functions')
 set(gca,'FontSize',12);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
f2=figure;
title('NDS T-Test for all mathematical functions');
set(gca,'FontSize',16);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
bdata=[pvm;pvwm;pvn];
coloredBar(bdata);
set(gca,'xticklabel',{[]})
legend({'ttest(SC-MOPSO,m-MOPSO)','ttest(SC-MOPSO,MOPSO)','ttest(SC-MOPSO,NSGA-II)'},'location','northoutside')
p=pwd;p(p=='\')='/';
folder='mathAverage';
saveas(f1, [p '/results images/' folder '/ndsAverage.png'])
saveas(f2, [p '/results images/' folder '/ndsAverageTtest.png'])
clc;
% close all;
disp('save is done');