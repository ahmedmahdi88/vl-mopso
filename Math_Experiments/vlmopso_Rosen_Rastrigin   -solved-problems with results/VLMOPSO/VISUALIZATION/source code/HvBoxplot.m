
clear;close all;
for Scenario=1:10
    AddRequiredPaths;
   v_MOmut(Scenario) = HyperVolume(paretoFront);
    v_VL(Scenario) = HyperVolume(paretoFrontvl);
    v_MO(Scenario) = HyperVolume(paretoFrontwm);
    v_N2(Scenario) = HyperVolume(pno);
end
f1=figure('position',get(0, 'Screensize'));
boxplot([v_MOmut' v_MO'  v_VL'  v_N2' ],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II'});
title('Comparison between SC-MOPSO and other algorithms in terms of HV within 10 Scenarios ')
p=pwd;p(p=='\')='/';
F = getframe(f1);
imwrite(F.cdata, [p '/../../../images/HVBoxPlot.png'], 'png')
close all;
clc;
disp('saving is done');
