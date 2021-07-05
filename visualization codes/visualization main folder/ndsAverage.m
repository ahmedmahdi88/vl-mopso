% clear;close all;
cont = 1;
for problemNumber=1:14
for Scenario=1:10
    AddRequiredPaths;
   pareto=res.paretoFront;
   paretovl  = resvl.paretoFront;
    paretowm = reswm.paretoFront;
    paretows = paretoFrontws;
    pareton2 = n.paretoFront.solutionsObjectiveValues;
    nds=size(pareto,1);
    ndsvl=size(paretovl,1);
    ndswm=size(paretowm,1);
    ndsws=size(paretows,1);
    ndsn2=size(pareton2,1); 

meannds(cont)=(nds);
meanndsvl(cont)=(ndsvl);
meanndswm(cont)=(ndswm);
meanndsws(cont)=(ndsws);
meanndsn2(cont)=(ndsn2);
cont = cont + 1;
end
end
[~,pvm]=ttest(meannds,meanndsvl);
[~,pvwm]=ttest(meanndswm,meanndsvl);
[~,pvws]=ttest(meanndsws,meanndsvl);
[~,pvn]=ttest(meanndsn2,meanndsvl);
f1=figure;
boxplot([meannds' meanndswm'  meanndsvl'  meanndsn2' meanndsws'],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'});
title('Comparison between SC-MOPSO and other algorithms in terms of NDs for mathematical functions')
 set(gca,'FontSize',12);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
f2=figure;
title('NDS T-Test for all mathematical functions');
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
saveas(f1, [p '/results images/' folder '/ndsAll.png'])
saveas(f2, [p '/results images/' folder '/ndsAllTtest.png'])
clc;
close all;
disp('save is done');