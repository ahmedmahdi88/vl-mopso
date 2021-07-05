% function ClassesHistogramVisNSGA2(s)
% Scenario=s;
% AddRequiredPaths;

Count=zeros(1,NC);
c=0;
    for i=1:size(pns,1)
        c=0;
       for c=1:NC
        if(pns(i).dim==classes(c))
            Count(c)=Count(c)+1;
        end
       end
    end

cssvl=classes(Count~=0);
Count(Count==0)=[];
bar(cssvl,Count);title('nsga2');xlabel('classes');ylabel('number of solutions');
set(gca, 'XTick', cssvl,'fontsize',6)

set(gca,'xTickLabels',cssvl);

title('NSGA-II');

            
            