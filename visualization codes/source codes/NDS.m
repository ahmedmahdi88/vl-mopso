% function [fl vl]=NDS(s)
% Scenario=s;
% AddRequiredPaths;

    nv=length(paretoFrontvl);
fl=length(paretoFront);
ffl=length(paretoFrontwm);
nsga2=length(pno);
ws = length(paretoFrontvl);
somedata=[nv,ffl,fl,nsga2,ws];
somenames={'SC-MOPSO','MOPSO','m-MOPSO','NSGA-II','WS-VLPSO'};

bar(somedata);title('NDS');
set(gcf,'color','w');
set(gca,'xticklabel',somenames)
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
% title([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);

