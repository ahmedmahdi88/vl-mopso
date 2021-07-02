% clear;close all;
for problemNumber=10:14
for Scenario=1:10
    AddRequiredPaths;
    if nobjArr(1)==2
   pareto=res.paretoFront;
   paretovl  = resvl.paretoFront;
    paretowm = reswm.paretoFront;
    pareton2 = n.paretoFront.solutionsObjectiveValues;
    hv(Scenario)=HyperVolume(pareto);
    hvvl(Scenario)=HyperVolume(paretovl);
    hvwm(Scenario)=HyperVolume(paretowm);
    hvn2(Scenario)=HyperVolume(pareton2); 
    else
        p=pwd;p(p=='\')='/';
    hvvl=load([p '/results/' problems{problemNumber} '/hvValues/HV.mat']);
    hvvl=hvvl.v_VL(Scenario);
    hv=load([p '/results/' problems{problemNumber} '/hvValues/HV.mat']);
    hv=hv.v_MOmut(Scenario);
    hvwm=load([p '/results/' problems{problemNumber} '/hvValues/HV.mat']);
    hvwm=hvwm.v_MO(Scenario);
    hvn2=load([p '/results/' problems{problemNumber} '/hvValues/HV.mat']);
    hvn2=hvn2.v_N2(Scenario);
    end
end
meanhv(problemNumber)=mean(hv);
meanhvvl(problemNumber)=mean(hvvl);
meanhvwm(problemNumber)=mean(hvwm);
meanhvn2(problemNumber)=mean(hvn2);
end
[~,pvm]=ttest(meanhv,meanhvvl);
[~,pvwm]=ttest(meanhvwm,meanhvvl);
[~,pvn]=ttest(meanhvn2,meanhvvl);
f1=figure;
boxplot([meanhv' meanhvwm'  meanhvvl'  meanhvn2' ],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II'});
title('Comparison between SC-MOPSO and other algorithms in terms of HV for mathematical functions')
 set(gca,'FontSize',12);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
f2=figure;
title('HV T-Test for all mathematical functions');
set(gca,'FontSize',16);
 set(gca,'LineWidth', 2);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
bdata=[pvm;pvwm;pvn];
coloredBar(bdata);
set(gca,'xticklabel',{[]})
legend({'ttest(SC-MOPSO,m-MOPSO)','ttest(SC-MOPSO,MOPSO)','ttest(SC-MOPSO,NSGA-II)'},'location','northoutside')
p=pwd;p(p=='\')='/';
folder='mathAverage';
% saveas(f1, [p '/results images/' folder '/HvAverage.png'])
% saveas(f2, [p '/results images/' folder '/HvAverageTtest.png'])
clc;
% close all;
disp('save is done');