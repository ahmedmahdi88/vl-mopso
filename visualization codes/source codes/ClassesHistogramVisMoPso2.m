% function ClassesHistogramVisMoPso(s)
% Scenario=s;
% AddRequiredPaths;
Count=zeros(1,NC);
c=0;

% if problemNumber==7 ||  problemNumber==8 || problemNumber==9 || problemNumber==3 || problemNumber==2 || problemNumber==4 || problemNumber==5 || problemNumber==6 || problemNumber==10
if problemNumber~=1   
for i=1:numel(paretoSetwm)
        c=0;
       for c=1:NC
        if (paretoSetwm(i).Dim==reswm.classes(c))
            Count(c)=Count(c)+1;
        end
       end
end
else
    for i=1:size(paretoSetwm,1)
        c=0;
       for c=1:NC
        if length(paretoSetwm(i,paretoSetwm(i,:)~=0))==reswm.classes(c)
            Count(c)=Count(c)+1;
        end
       end
    end
end
% else
%     for i=1:size(paretoSetwm,1)
%         c=0;
%        for c=1:NC
%         if length(paretoSetwm(i,paretoSetwm(i,:)~=0))==res.classes(c)
%             Count(c)=Count(c)+1;
%         end
%        end
%     end     
% end
cssvl=classes(Count~=0);
Count(Count==0)=[];
bar(cssvl,Count);title('mopso');xlabel('classes');ylabel('number of solutions');
title('MOPSO');
            
            