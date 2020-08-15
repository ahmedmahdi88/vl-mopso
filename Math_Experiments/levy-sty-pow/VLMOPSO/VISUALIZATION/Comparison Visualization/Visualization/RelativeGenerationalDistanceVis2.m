function RelativeGenerationalDistanceVis()
clear;clc;
AddRequiredPaths;

trueParetoFront=find_opt_objs();
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

somedata=[dFl dVl dn ];
somenames={'Fixed', 'Variable','nsga2'};
bar(somedata);set(gca,'xticklabel',somenames)
suptitle(['Relative Generational Distanse']);
title([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);

