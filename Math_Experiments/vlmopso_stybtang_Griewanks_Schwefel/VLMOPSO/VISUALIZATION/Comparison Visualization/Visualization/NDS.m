function [fl vl]=NDS(s)
Scenario=s;
AddRequiredPaths;

% fl=0;
% for i=1:length(pop)
%     if ~(pop(i).IsDominated)
% fl=fl+1;
%     end
% end

% vl=0;
% for i=1:length(popvl)
%     if ~(popvl(i).IsDominated)
% vl=vl+1;
%     end
% end
% vl=[];
% for i=1:length(paretovl)
%     if paretovl(i,:)~=[inf,inf]
% vl=[vl;paretovl(i,:)];%[];
%     end
% end
    nv=length(paretoFrontvl);
fl=length(paretoFront);
nsga2=length(pno);
somedata=[fl,nv,nsga2];
somenames={'MOPSO','VL-MOPSO','NSGA-II'};

bar(somedata);title('NDS');
set(gca,'xticklabel',somenames)
suptitle('NDS')
% title([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);

