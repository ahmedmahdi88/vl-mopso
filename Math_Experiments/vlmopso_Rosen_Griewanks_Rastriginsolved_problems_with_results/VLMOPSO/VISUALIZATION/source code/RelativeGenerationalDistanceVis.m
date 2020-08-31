function RelativeGenerationalDistanceVis(s)
Scenario=s;
AddRequiredPaths;

trueParetoFront=find_opt_objs(Scenario);
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
somedata=[d dFl dVl dn ];
somenames={'MOPSO','m-MOPSO' ,'SC-MOPSO','NSGA-II'};
bar(somedata);set(gca,'xticklabel',somenames)
suptitle(['Relative Generational Distanse']);
% title([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);

