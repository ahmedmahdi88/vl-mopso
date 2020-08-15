function HvVisualizationComp(s)
Scenario=s;
AddRequiredPaths;

% fl=[];
% for i=1:length(pop)
%     if ~(pop(i).IsDominated)
% fl=[fl; pop(i).cost];
%     end
% end

% vl=[];
% for i=1:length(popvl)
%     if ~(popvl(i).IsDominated)
% vl=[vl ;popvl(i).cost];
%     end
% end
% vl=[];
% for i=1:length(paretovl)
%     if paretovl(i,:)~=[inf,inf]
% vl=[vl;paretovl(i,:)];%[];
%     end
%     end

somedata=[HyperVolume(paretoFront),HyperVolume(paretoFrontvl),HyperVolume(pno)]
somenames={'MOPSO','VL-MOPSO','NSGA-II'};

bar(somedata);title('Hyper Volume');
set(gca,'xticklabel',somenames)
suptitle('HV')

% title([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);

end







