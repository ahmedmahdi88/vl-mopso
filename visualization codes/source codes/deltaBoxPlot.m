% clear;close all;
for Scenario=1:10
    AddRequiredPaths;
   v_MOmut(Scenario) = DeltaQuotMetric(paretoFront);
    v_VL(Scenario) = DeltaQuotMetric(paretoFrontvl);
    v_MO(Scenario) = DeltaQuotMetric(paretoFrontwm);
    v_WS(Scenario) = DeltaQuotMetric(paretoFrontws);
    v_N2(Scenario) = DeltaQuotMetric(pno);
end
f1=figure('position',get(0, 'Screensize'));
boxplot([v_MOmut' v_MO'  v_VL'  v_N2' v_WS'],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'});
title('Comparison between SC-MOPSO and other algorithms in terms of Delta measure within 10 Scenarios ')
p=pwd;p(p=='\')='/';
F = getframe(f1);
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
% imwrite(F.cdata, [p '/results images/' folder '/DeltaBoxPlot.png'], 'png')
% clc;
% disp('saving is done');