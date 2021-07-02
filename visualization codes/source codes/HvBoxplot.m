
% clear;close all;
if ~ismember(7:10,problemNumber)
for Scenario=1:10
    AddRequiredPaths;
   v_MOmut(Scenario) = HyperVolume(paretoFront);
    v_VL(Scenario) = HyperVolume(paretoFrontvl);
    v_MO(Scenario) = HyperVolume(paretoFrontwm);
    v_WS(Scenario) = HyperVolume(paretoFrontws);
    v_N2(Scenario) = HyperVolume(pno);
end
else
    hvData=load([pwd '/results/' problems{problemNumber} '/hvValues/HV.mat']);
    v_MOmut=hvData.v_MOmut;
    v_VL=hvData.v_VL;
    v_N2=hvData.v_N2;
    v_MO=hvData.v_MO;
end
f1=figure('position',get(0, 'Screensize'));
boxplot([v_MOmut' v_MO'  v_VL'  v_N2' v_WS'],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'});
title('Comparison between SC-MOPSO and other algorithms in terms of HV within 10 Scenarios ')
p=pwd;p(p=='\')='/';
F = getframe(f1);
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
% imwrite(F.cdata, [p '/results images/' folder '/HVBoxPlot.png'], 'png')
% close all;
% clc;
% disp('saving is done');
