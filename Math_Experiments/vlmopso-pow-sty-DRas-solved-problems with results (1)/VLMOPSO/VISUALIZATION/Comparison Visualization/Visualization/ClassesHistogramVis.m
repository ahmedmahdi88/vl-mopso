function ClassesHistogramVis(s)
Scenario=s;
AddRequiredPaths;

vlCount=zeros(1,NCvl);
for cvl=1:NCvl
    for i=1:length(paretoSetvl)
        if(length(paretoSetvl{i}{:})==classesvl(cvl))
            vlCount(cvl)=vlCount(cvl)+1;
        end
    end
end
Count=zeros(1,NC);
% for c=1:NC
%     for i=1:length(pop)
%         if(length(pop(i).pos.x)==classes(c)) & ~pop(i).IsDominated
%             Count(c)=Count(c)+1;
%         end
%     end
% end
% subplot(1,2,1)
cssvl=classesvl(vlCount~=0);
vlCount(vlCount==0)=[];
bar(cssvl,vlCount);title('VL');xlabel('classes');ylabel('number of solutions');
title('VL-MOPSO')
% subplot(1,2,2)
% classes=classes(Count~=0);
% Count(Count==0)=[];
% bar(classes,Count);title('FL');xlabel('classes');ylabel('number of solutions');
% suptitle([ 'popSize=' num2str(resvl.popSize) ' | enhancementTimeout= ' num2str(resvl.enhancement_timeout) ' | nobj= ' num2str(nobjArr(Scenario))]);
end
            
            