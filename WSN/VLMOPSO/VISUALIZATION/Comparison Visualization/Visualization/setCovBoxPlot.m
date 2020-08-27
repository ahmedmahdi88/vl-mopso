clear;clc;close all;
for Scenario=1:10
    AddRequiredPaths;
    C_VL_MOmut(Scenario) = SetCoverage2(paretoFrontvl,paretoFront);
    C_MOmut_VL(Scenario) = SetCoverage2(paretoFront,paretoFrontvl);
    C_VL_N2(Scenario) = SetCoverage2(paretoFrontvl,pno);
    C_N2_VL(Scenario) = SetCoverage2(pno,paretoFrontvl);
end
C_VL_MOmut;
C_MOmut_VL;
f1=figure('position',get(0, 'Screensize'));
boxplot([C_VL_MOmut' C_MOmut_VL'   C_VL_N2' C_N2_VL'],'Labels',{'C(SC-MOPSO,MOPSO)','C(MOPSO,SC-MOPSO)','C(SC-MOPSO,NSGA-II)','C(NSGA-II,SC-MOPSO)'});
title('Comparison between SC-MOPSO and other algorithms in terms of SetCoverage within 10 Scenarios ')
p=pwd;
F    = getframe(f1);
imwrite(F.cdata, [p '\images\SetCoverageBoxPlot.png'], 'png')
