clear;clc;close all;
for Scenario=1:10
    AddRequiredPaths;
    trueParetoFront=find_opt_objs(Scenario);
    R_MOmut(Scenario) = GenerationalDistance(paretoFront,trueParetoFront,2);
    R_VL(Scenario) = GenerationalDistance(paretoFrontvl,trueParetoFront,2);
    R_MO(Scenario) = GenerationalDistance(paretoFrontwm,trueParetoFront,2);
    R_N2(Scenario) = GenerationalDistance(pno,trueParetoFront,2);
end

f1=figure('position',get(0, 'Screensize'));
boxplot([R_MOmut' R_MO'  R_VL'  R_N2' ],'Labels',{...
    'm-MOPSO','MOPSO','SC-MOPSO','NSGA-II'});
    
title('Comparison between SC-MOPSO and other algorithms in terms of RGD within 10 Scenarios ')

p=pwd;p(p=='\')='/';
F    = getframe(f1);
imwrite(F.cdata, [p '/../../../images/RGDBoxPlot.png'], 'png')
