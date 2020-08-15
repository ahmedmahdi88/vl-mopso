function ClassesHistogramVisMoPso(s)
Scenario=s;
AddRequiredPaths;
Count=zeros(1,NC);
c=0;
    for i=1:length(paretoSet)
        c=0;
       for c=1:NC
           x=paretoSet(i).x;
           x=x(x~=-1);
        if(length(x))==classesvl(c)
            Count(c)=Count(c)+1;
        end
       end
    end

% Count=zeros(1,NC);
% for c=1:NC
%     for i=1:length(pop)
%         if(length(pop(i).pos.x)==classes(c)) & ~pop(i).IsDominated
%             Count(c)=Count(c)+1;
%         end
%     end
% end
% subplot(1,2,1)
cssvl=classes(Count~=0);
Count(Count==0)=[];
bar(cssvl,Count);title('mopso');xlabel('classes');ylabel('number of solutions');
% subplot(1,2,2)
% classes=classes(Count~=0);
% Count(Count==0)=[];
% bar(classes,Count);title('FL');xlabel('classes');ylabel('number of solutions');
% suptitle([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);
end
            
            