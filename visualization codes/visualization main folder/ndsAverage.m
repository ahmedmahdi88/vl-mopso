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
h=boxplot([meanndsvl' meannds' meanndswm'  meanndsn2' meanndsws'],'Labels',{...
    'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'});
title('Comparison between SC-MOPSO and other algorithms in terms of NDs for mathematical functions')
set(gcf,'color','w');
set(gca,'FontSize',12);
set(h,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
%% save xlsx
SC_MOPSO = meanndsvl';
m_MOPSO = meannds';
MOPSO = meanndswm';
NSGA_II = meanndsn2';
WS_VLPSO = meanndsws'; 
T=table (SC_MOPSO,m_MOPSO,MOPSO,NSGA_II,WS_VLPSO);
filename=[cd '/tables/Comparison between SC-MOPSO and other algorithms in terms of NDS for all mathematical functions.xlsx'];
writetable(T,filename,'Sheet',1)
%%
f2=figure;
title('NDS T-Test for all mathematical functions');
set(gcf,'color','w');
set(gca,'FontSize',16);
set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

bdata=[pvm;pvwm;pvn;pvws];
coloredBar(bdata);
set(gcf,'color','w');
set(gca,'xticklabel',{[]})
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

legend({'ttest(SC-MOPSO,m-MOPSO)','ttest(SC-MOPSO,MOPSO)','ttest(SC-MOPSO,NSGA-II)',...
    'ttest(SC-MOPSO,WS-VLPSO)'},'location','northoutside')
p=pwd;p(p=='\')='/';
folder='mathAll-Functions';
saveas(f1, [p '/results images/' folder '/ndsAll.png'])
saveas(f2, [p '/results images/' folder '/ndsAllTtest.png'])
clc;
close all;
disp('save is done');