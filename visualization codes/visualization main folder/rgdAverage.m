% clear;close all;
for problemNumber=10:14
for Scenario=1:10
    AddRequiredPaths;
   pareto=res.paretoFront
   paretovl  = resvl.paretoFront;
    paretowm = reswm.paretoFront;
    pareton2 = n.paretoFront.solutionsObjectiveValues;
  trueParetoFront=find_opt_objs(pareto,paretovl,pareton2,paretowm,nobjArr);
    rgd(Scenario)=GenerationalDistance(pareto,trueParetoFront,2);
    rgdvl(Scenario)=GenerationalDistance(paretovl,trueParetoFront,2);
    rgdwm(Scenario)=GenerationalDistance(paretowm,trueParetoFront,2);
    rgdn2(Scenario)=GenerationalDistance(pareton2,trueParetoFront,2); 
end
meanrgd(problemNumber)=mean(rgd);
meanrgdvl(problemNumber)=mean(rgdvl);
meanrgdwm(problemNumber)=mean(rgdwm);
meanrgdn2(problemNumber)=mean(rgdn2);
end
[~,pvm]=ttest(meanrgd,meanrgdvl);
[~,pvwm]=ttest(meanrgdwm,meanrgdvl);
[~,pvn]=ttest(meanrgdn2,meanrgdvl);
f1=figure;
boxplot([meanrgd' meanrgdwm'  meanrgdvl'  meanrgdn2' ],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II'});
title('Comparison between SC-MOPSO and other algorithms in terms of RGD for mathematical functions')
 set(gca,'FontSize',12);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
f2=figure;
title('RGD T-Test for all mathematical functions');
set(gca,'FontSize',16);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
bdata=[pvm;pvwm;pvn];
coloredBar(bdata);
set(gca,'xticklabel',{[]})
legend({'ttest(SC-MOPSO,m-MOPSO)','ttest(SC-MOPSO,MOPSO)','ttest(SC-MOPSO,NSGA-II)'},'location','northoutside')
p=pwd;p(p=='\')='/';
folder='mathAverage';
% saveas(f1, [p '/results images/' folder '/rgdAverage.png'])
% saveas(f2, [p '/results images/' folder '/rgdAverageTtest.png'])
clc;
% close all;
disp('save is done');