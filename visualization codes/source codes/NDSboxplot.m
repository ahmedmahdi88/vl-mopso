% clear;close all;
for Scenario=1:10
    AddRequiredPaths;
   nds_MOmut(Scenario) = length(paretoFront);
    nds_VL(Scenario) = length(paretoFrontvl);
    nds_MO(Scenario) = length(paretoFrontwm);
    nds_WS(Scenario) = length(paretoFrontws);
    nds_N2(Scenario) = length(pno);
end
f1=figure('position',get(0, 'Screensize'));
boxplot([nds_MOmut' nds_MO'  nds_VL'  nds_N2' nds_WS' ],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'});
title('Comparison between SC-MOPSO and other algorithms in terms of NDS within 10 Scenarios ')
p=pwd;p(p=='\')='/';
F    = getframe(f1);
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
imwrite(F.cdata, [p '/results images/' folder '/NDSBoxPlot.png'], 'png')
clc;
close all;
disp('save is done');