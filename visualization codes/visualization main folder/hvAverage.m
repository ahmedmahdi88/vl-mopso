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
boxplot([meanhv' meanhvwm'  meanhvvl'  meanhvn2' meanhvws'],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'});
title('Comparison between SC-MOPSO and other algorithms in terms of HV for mathematical functions')
 set(gca,'FontSize',12);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
f2=figure;
title('HV T-Test for all mathematical functions');
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
saveas(f1, [p '/results images/' folder '/HvAll.png'])
saveas(f2, [p '/results images/' folder '/HvAllTtest.png'])
clc;
close all;
disp('save is done');