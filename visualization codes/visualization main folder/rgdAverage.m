% clear;close all;
cont = 1;
for problemNumber=1:14
for Scenario=1:10
    AddRequiredPaths;
   pareto=res.paretoFront
   paretovl  = resvl.paretoFront;
    paretowm = reswm.paretoFront;
    paretows = paretoFrontws;
    pareton2 = n.paretoFront.solutionsObjectiveValues;
  trueParetoFront=find_opt_objs(pareto,paretovl,pareton2,paretowm,paretows,nobjArr);
    rgd=GenerationalDistance(pareto,trueParetoFront,2);
    rgdvl=GenerationalDistance(paretovl,trueParetoFront,2);
    rgdwm=GenerationalDistance(paretowm,trueParetoFront,2);
    rgdws=GenerationalDistance(paretows,trueParetoFront,2);
    rgdn2=GenerationalDistance(pareton2,trueParetoFront,2); 
meanrgd(cont)=(rgd);
meanrgdvl(cont)=(rgdvl);
meanrgdwm(cont)=(rgdwm);
meanrgdws(cont)=(rgdws);
meanrgdn2(cont)=(rgdn2);
cont = cont+1;
end
end
[~,pvm]=ttest(meanrgd,meanrgdvl);
[~,pvwm]=ttest(meanrgdwm,meanrgdvl);
[~,pvws]=ttest(meanrgdws,meanrgdvl);
[~,pvn]=ttest(meanrgdn2,meanrgdvl);
f1=figure;
boxplot([meanrgd' meanrgdwm'  meanrgdvl'  meanrgdn2' meanrgdws'],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'});
title('Comparison between SC-MOPSO and other algorithms in terms of RGD for mathematical functions')
 set(gca,'FontSize',12);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
f2=figure;
title('RGD T-Test for all mathematical functions');
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
saveas(f1, [p '/results images/' folder '/rgdAll.png'])
saveas(f2, [p '/results images/' folder '/rgdAllTtest.png'])
clc;
close all;
disp('save is done');