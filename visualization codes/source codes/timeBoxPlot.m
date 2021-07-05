% clear;close all;
for Scenario=1:10
    AddRequiredPaths;
   t_MOmut(Scenario) = res.t;
    t_VL(Scenario) = resvl.t;
    t_MO(Scenario) = reswm.t;
    t_WS(Scenario) = resws.t;
    t_N2(Scenario) = n.t;
end
f1=figure('position',get(0, 'Screensize'));
boxplot([t_MOmut' t_MO'  t_VL'  t_N2' t_WS'],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'});
title('Comparison between SC-MOPSO and other algorithms in terms of Execution Time within 10 Scenarios ')
p=pwd;p(p=='\')='/';
F    = getframe(f1);
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
imwrite(F.cdata, [p '/results images/' folder '/TimeBoxPlot.png'], 'png')
clc;
close all;
disp('save is done');