function   SetCoverageVisualizationComp()
% to visualize setCoverage, we assume that algorithm1 is DamopsoA
% algorithm2: string variable that is the name of the other algorithm that
% you want to compare damopsoA with it
% paretoFront2: the pareto front for the other algorithm that
% you want to compare damopsoA with it
AddRequiredPaths;
% maxNObjs=5;
% [a,b]=hist(optimized_objs,unique(optimized_objs));
% bb= optimized_objs== optimized_objs(b(max(a)));
% bin=ones(size(bb));
% bin(min(find(bb==1)))=0;
% optimized_objs(~bin)=0;
% index_objs=zeros(1,maxNObjs);
% L=0;


% if mod(maxNObjs,daes4.numberOfObjectives)==0
%     L=daes4.numberOfObjectives;
% else
%    
%     mm=mod(maxNObjs,daes4.numberOfObjectives);
%     nn=daes4.numberOfObjectives-mm;
%     L=maxNObjs+nn;
% end
% index_objs=zeros(1,L);
% for i=1:maxNObjs
%     
%     index_objs(i)=find(optimized_objs==i);
%     
% end
% paretoIndex=zeros(1,L);
% ii=1;
% for i=1:daes4.numberOfObjectives:L
%     if bin(i)~=0
%     paretoIndex(i)=ii;
%     end
%     if bin(i+1)~=0
%          paretoIndex(i+1)=ii;
%     end
%     ii=ii+1;
% end
% subObj=L/daes4.numberOfObjectives;
% indexObjsPart=reshape(index_objs,1,2,subObj);
% fl=[];
% for i=1:length(pop)
%     if ~(pop(i).IsDominated)
% fl=[fl; pop(i).cost];
%     end
% end
% vl=[];
% for i=1:length(paretovl)
%     if paretovl(i,:)~=[inf,inf]
% vl=[vl;paretovl(i,:)];%[];
%     end
%     end
% for i=1:length(popvl)
%     if ~(popvl(i).IsDominated)
% vl=[vl ;popvl(i).cost];
%     end
% end
% d=daes2.paretoFront.solutionsObjectiveValues;
somedata=[SetCoverage2(paretoFront,paretoFrontvl) SetCoverage2(paretoFrontvl,paretoFront)];
somenames={'c(FixedLength,VariableLength)', 'c(VariableLength,FixedLength)'};
bar(somedata);set(gca,'xticklabel',somenames)
suptitle('set coverage' );
title([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);
end