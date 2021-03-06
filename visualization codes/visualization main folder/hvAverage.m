% clear;close all;
cont = 1;
for problemNumber=1:9
for Scenario=1:10
    AddRequiredPaths;
   
   pareto=res.paretoFront;
   paretovl  = resvl.paretoFront;
    paretowm = reswm.paretoFront;
    paretows = paretoFrontws;
    pareton2 = n.paretoFront.solutionsObjectiveValues;
     if nobjArr(1)==2
    hv=HyperVolume(pareto);
    hvvl=HyperVolume(paretovl);
    hvwm=HyperVolume(paretowm);
    hvws=HyperVolume(paretows);
    hvn2=HyperVolume(pareton2); 
    else
       tmp = [pareto(:,1),pareto(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [pareto(:,1),pareto(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [pareto(:,2),pareto(:,3)];
        hv3 = HyperVolume(tmp);
        hv = mean([hv1 hv2 hv3]);
        %%%
        tmp = [paretovl(:,1),paretovl(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretovl(:,1),paretovl(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretovl(:,2),paretovl(:,3)];
        hv3 = HyperVolume(tmp);
        hvvl = mean([hv1 hv2 hv3]);
        %%% 
        tmp = [paretowm(:,1),paretowm(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretowm(:,1),paretowm(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretowm(:,2),paretowm(:,3)];
        hv3 = HyperVolume(tmp);
        hvwm = mean([hv1 hv2 hv3]);
         %%% 
        tmp = [paretows(:,1),paretows(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretows(:,1),paretows(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretows(:,2),paretows(:,3)];
        hv3 = HyperVolume(tmp);
        hvws = mean([hv1 hv2 hv3]);
         %%% 
        tmp = [pareton2(:,1),pareton2(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [pareton2(:,1),pareton2(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [pareton2(:,2),pareton2(:,3)];
        hv3 = HyperVolume(tmp);
        hvn2 = mean([hv1 hv2 hv3]);
   
    end

meanhv(cont)=(hv);
meanhvvl(cont)=(hvvl);
meanhvwm(cont)=(hvwm);
meanhvws(cont)=(hvws);
meanhvn2(cont)=(hvn2);
cont = cont  + 1;
end
end
[~,pvm]=ttest(meanhv,meanhvvl);
[~,pvwm]=ttest(meanhvwm,meanhvvl);
[~,pvws]=ttest(meanhvws,meanhvvl);
[~,pvn]=ttest(meanhvn2,meanhvvl);
f1=figure;
h=boxplot([meanhvvl' meanhv' meanhvwm' meanhvn2' meanhvws'],'Labels',{...
    'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'});
title('Comparison between SC-MOPSO and other algorithms in terms of HV for CEC2020 functions')
set(gcf,'color','w');
set(gca,'FontSize',12);
set(h,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',13,'LineWidth',2) 
%% save xlsx
SC_MOPSO = meanhvvl';
m_MOPSO = meanhv';
MOPSO =  meanhvwm';
NSGA_II = meanhvn2';
WS_VLPSO = meanhvws'; 
T=table (SC_MOPSO,m_MOPSO,MOPSO,NSGA_II,WS_VLPSO);
filename=[cd '/tables/Comparison between SC-MOPSO and other algorithms in terms of HV for CEC2020 functions.xlsx'];
writetable(T,filename,'Sheet',1)
%%
f2=figure;
title('HV T-Test for CEC2020 functions');
set(gcf,'color','w');
set(gca,'FontSize',16);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',13,'LineWidth',2) 
bdata=[pvm;pvwm;pvn;pvws];
coloredBar(bdata);
set(gcf,'color','w');
set(gca,'xticklabel',{[]})
legend({'ttest(SC-MOPSO,m-MOPSO)','ttest(SC-MOPSO,MOPSO)','ttest(SC-MOPSO,NSGA-II)',...
   'ttest(SC-MOPSO,WS-VLPSO)'},'location','northoutside')
p=pwd;p(p=='\')='/';
folder='mathAll-Functions';
saveas(f1, [p '/results images/' folder '/HvAll.png'])
saveas(f2, [p '/results images/' folder '/HvAllTtest.png'])
clc;
close all;
disp('save is done');