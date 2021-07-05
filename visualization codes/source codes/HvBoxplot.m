
% clear;close all;
if nobjs(problemNumber)==2
for Scenario=1:10
    AddRequiredPaths;
   v_MOmut(Scenario) = HyperVolume(paretoFront);
    v_VL(Scenario) = HyperVolume(paretoFrontvl);
    v_MO(Scenario) = HyperVolume(paretoFrontwm);
    v_WS(Scenario) = HyperVolume(paretoFrontws);
    v_N2(Scenario) = HyperVolume(pno);
end
else
    for Scenario=1:10
    AddRequiredPaths;
     tmp = [paretoFront(:,1),paretoFront(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretoFront(:,1),paretoFront(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretoFront(:,2),paretoFront(:,3)];
        hv3 = HyperVolume(tmp);
        hv = mean([hv1 hv2 hv3]);
        %%%
   v_MOmut(Scenario) = hv;
   tmp = [paretoFrontvl(:,1),paretoFrontvl(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretoFrontvl(:,1),paretoFrontvl(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretoFrontvl(:,2),paretoFrontvl(:,3)];
        hv3 = HyperVolume(tmp);
        hvvl = mean([hv1 hv2 hv3]);
        %%% 
    v_VL(Scenario) = hvvl;
    tmp = [paretoFrontwm(:,1),paretoFrontwm(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretoFrontwm(:,1),paretoFrontwm(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretoFrontwm(:,2),paretoFrontwm(:,3)];
        hv3 = HyperVolume(tmp);
        hvwm = mean([hv1 hv2 hv3]);
         %%% 
    v_MO(Scenario) = hvwm;
    tmp = [paretoFrontws(:,1),paretoFrontws(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretoFrontws(:,1),paretoFrontws(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretoFrontws(:,2),paretoFrontws(:,3)];
        hv3 = HyperVolume(tmp);
         hvws= mean([hv1 hv2 hv3]);
         %%% 
    v_WS(Scenario) = hvws;
    %%%
     tmp = [pno(:,1),pno(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [pno(:,1),pno(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [pno(:,2),pno(:,3)];
        hv3 = HyperVolume(tmp);
        hvn2 = mean([hv1 hv2 hv3]); 
    v_N2(Scenario) = hvn2;

    end
        
        
        
       
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
imwrite(F.cdata, [p '/results images/' folder '/HVBoxPlot.png'], 'png')
close all;
clc;
disp('saving is done');
