function ClassesHistogramVis(s)
Scenario=s;
AddRequiredPaths;

vlCount=zeros(1,NCvl);
for cvl=1:NCvl
    for i=1:length(paretoSetvl)
        if(length(paretoSetvl{1,i})==classesvl(cvl))
            vlCount(cvl)=vlCount(cvl)+1;
        end
    end
end
Count=zeros(1,NC);

cssvl=classesvl(vlCount~=0);
vlCount(vlCount==0)=[];
bar(cssvl,vlCount);title('VL');xlabel('classes');ylabel('number of solutions');
title('SC-MOPSO')
end
            
            