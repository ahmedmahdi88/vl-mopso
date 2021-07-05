% clear;clc;close all;
for Scenario=1:10
    AddRequiredPaths;
    trueParetoFront=find_opt_objs(paretoFront,paretoFrontvl,pno,paretoFrontwm,paretoFrontws,nobjArr);
    R_MOmut(Scenario) = GenerationalDistance(paretoFront,trueParetoFront,2);
    R_VL(Scenario) = GenerationalDistance(paretoFrontvl,trueParetoFront,2);
    R_MO(Scenario) = GenerationalDistance(paretoFrontwm,trueParetoFront,2);
    R_WS(Scenario) = GenerationalDistance(paretoFrontws,trueParetoFront,2);
    R_N2(Scenario) = GenerationalDistance(pno,trueParetoFront,2);
end

f1=figure('position',get(0, 'Screensize'));
boxplot([R_MOmut' R_MO'  R_VL'  R_N2' R_WS' ],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'});
    
title('Comparison between SC-MOPSO and other algorithms in terms of RGD within 10 Scenarios ')

p=pwd;p(p=='\')='/';
F    = getframe(f1);
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
imwrite(F.cdata, [p '/results images/' folder '/RGDBoxPlot.png'], 'png')
