% function RelativeGenerationalDistanceVis(s)
% Scenario=s;
% AddRequiredPaths;

trueParetoFront=find_opt_objs(paretoFront,paretoFrontvl,pno,paretoFrontwm,paretoFrontws,nobjArr(1));
% fl=[];
% for i=1:length(pop)
%     if ~(pop(i).IsDominated)
% fl=[fl; pop(i).cost];
%     end
% end
% 
% vl=[];
% for i=1:length(paretovl)
%     if paretovl(i,:)~=[inf,inf]
% vl=[vl;paretovl(i,:)];%[];
%     end
%     end

dFl= GenerationalDistance(paretoFront,trueParetoFront,2);
dVl= GenerationalDistance(paretoFrontvl,trueParetoFront,2);
dn=  GenerationalDistance(pno,trueParetoFront,2);
d=   GenerationalDistance(paretoFrontwm,trueParetoFront,2);
dw = GenerationalDistance(paretoFrontws,trueParetoFront,2);
somedata=[dVl d dFl  dn dw];
somenames={'SC-MOPSO','MOPSO','m-MOPSO' ,'NSGA-II','WS-VLPSO'};
bar(somedata);set(gca,'xticklabel',somenames)
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

title(['Relative Generational Distanse']);
% title([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);

