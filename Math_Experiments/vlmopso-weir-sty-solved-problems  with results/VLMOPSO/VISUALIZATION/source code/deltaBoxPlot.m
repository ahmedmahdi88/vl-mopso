clear;close all;
for Scenario=1:10
    AddRequiredPaths;
   v_MOmut(Scenario) = DeltaQuotMetric(paretoFront);
    v_VL(Scenario) = DeltaQuotMetric(paretoFrontvl);
    v_MO(Scenario) = DeltaQuotMetric(paretoFrontwm);
    v_N2(Scenario) = DeltaQuotMetric(pno);
end
f1=figure('position',get(0, 'Screensize'));
boxplot([v_MOmut' v_MO'  v_VL'  v_N2' ],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II'});
title('Comparison between SC-MOPSO and other algorithms in terms of Delta measure within 10 Scenarios ')
p=pwd;p(p=='\')='/';
F = getframe(f1);
imwrite(F.cdata, [p '/../../../images/DeltaBoxPlot.png'], 'png')
clc;
disp('saving is done');