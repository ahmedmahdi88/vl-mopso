% clear;close all;
cont = 1;
for problemNumber=10:14
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
h=boxplot([meanrgdvl' meanrgd' meanrgdwm'  meanrgdn2' meanrgdws'],'Labels',{...
  'SC-MOPSO', 'm-MOPSO','MOPSO','NSGA-II','WS-VLPSO'});
title('Comparison between SC-MOPSO and other algorithms in terms of RGD for Fonseca & ZDT functions')
set(gcf,'color','w');
set(gca,'FontSize',12);
set(h,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
%% save xlsx
SC_MOPSO = meanrgdvl';
m_MOPSO = meanrgd';
MOPSO =  meanrgdwm';
NSGA_II = meanrgdn2';
WS_VLPSO = meanrgdws'; 
T=table (SC_MOPSO,m_MOPSO,MOPSO,NSGA_II,WS_VLPSO);
filename=[cd '/tables/Comparison between SC-MOPSO and other algorithms in terms of RGD for Fonseca & ZDT functions.xlsx'];
writetable(T,filename,'Sheet',1)
%%
f2=figure;
title('RGD T-Test for Fonseca & ZDT functions');
set(gcf,'color','w');
set(gca,'FontSize',16);
set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

bdata=[pvm;pvwm;pvn;pvws];
coloredBar(bdata);
set(gcf,'color','w');
set(gca,'xticklabel',{[]})
legend({'ttest(SC-MOPSO,m-MOPSO)','ttest(SC-MOPSO,MOPSO)','ttest(SC-MOPSO,NSGA-II)',...
    'ttest(SC-MOPSO,WS-VLPSO)'},'location','northoutside')
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

p=pwd;p(p=='\')='/';
folder='mathAll-Functions';
saveas(f1, [p '/results images/' folder '/rgdAll.png'])
saveas(f2, [p '/results images/' folder '/rgdAllTtest.png'])
clc;
close all;
disp('save is done');