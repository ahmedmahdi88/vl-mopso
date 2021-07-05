% function ClassesHistogramVisMoPso(s)
% Scenario=s;
% AddRequiredPaths;
Count=zeros(1,NC);
c=0;
if ~isstruct(paretoSet)
    for i=1:size(paretoSet,1)
        c=0;
       for c=1:NC
        if length(paretoSet(i,paretoSet(i,:)~=0))==res.classes(c)
            Count(c)=Count(c)+1;
        end
       end
    end
else
    for i=1:numel(paretoSet)
        c=0;
       for c=1:NC
        if(paretoSet(i).Dim==res.classes(c))
            Count(c)=Count(c)+1;
        end
       end
    end
end

cssvl=classes(Count~=0);
Count(Count==0)=[];
bar(cssvl,Count);title('mopso');xlabel('classes');ylabel('number of solutions');
set(gca, 'XTick', cssvl,'fontsize',6)

set(gca,'xTickLabels',cssvl);
title('m-MOPSO');
     
            