% % function HvVisualizationComp(s)
% Scenario=s;
% AddRequiredPaths;
if nobjArr(1)==2
somedata=[HyperVolume(paretoFrontvl),HyperVolume(paretoFrontwm),HyperVolume(paretoFront),HyperVolume(pno),HyperVolume(paretoFrontws)]
somenames={'SC-MOPSO','MOPSO','m-MOPSO','NSGA-II','WS-VLPSO'};
bar(somedata);
set(gca,'xticklabel',somenames)
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
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
somedata=[hvvl,hvwm,hv,hvn2,hvws];
somenames={'SC-MOPSO','MOPSO','m-MOPSO','NSGA-II','WS-VLPSO'};
bar(somedata);
set(gcf,'color','w');
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
set(gca,'xticklabel',somenames)
title('HV')
end
    
% end