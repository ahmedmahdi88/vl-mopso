% % function HvVisualizationComp(s)
% Scenario=s;
% AddRequiredPaths;
if nobjArr(1)==2
somedata=[HyperVolume(paretoFrontwm),HyperVolume(paretoFront),HyperVolume(paretoFrontvl),HyperVolume(pno),HyperVolume(paretoFrontws)]
somenames={'MOPSO','m-MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'};
bar(somedata);
set(gca,'xticklabel',somenames)
suptitle('HV')
else
   tmp = [paretoFront(:,1),paretoFront(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretoFront(:,1),paretoFront(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretoFront(:,2),paretoFront(:,3)];
        hv3 = HyperVolume(tmp);
        hv = mean([hv1 hv2 hv3]);
        %%%
        tmp = [paretoFrontvl(:,1),paretoFrontvl(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretoFrontvl(:,1),paretoFrontvl(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretoFrontvl(:,2),paretoFrontvl(:,3)];
        hv3 = HyperVolume(tmp);
        hvvl = mean([hv1 hv2 hv3]);
        %%% 
        tmp = [paretoFrontwm(:,1),paretoFrontwm(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretoFrontwm(:,1),paretoFrontwm(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretoFrontwm(:,2),paretoFrontwm(:,3)];
        hv3 = HyperVolume(tmp);
        hvwm = mean([hv1 hv2 hv3]);
         %%% 
        tmp = [paretoFrontws(:,1),paretoFrontws(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretoFrontws(:,1),paretoFrontws(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretoFrontws(:,2),paretoFrontws(:,3)];
        hv3 = HyperVolume(tmp);
        hvws = mean([hv1 hv2 hv3]);
         %%% 
        tmp = [pno(:,1),pno(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [pno(:,1),pno(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [pno(:,2),pno(:,3)];
        hv3 = HyperVolume(tmp);
        hvn2 = mean([hv1 hv2 hv3]); 
somedata=[hvwm,hv,hvvl,hvn2,hvws]
somenames={'MOPSO','m-MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'};
bar(somedata);
set(gca,'xticklabel',somenames)
title('HV')
end
    
% end







