% function ClassesHistogramVis(s)
% Scenario=s;
% AddRequiredPaths;

vlCount=zeros(1,NCvl);
if problemNumber==1
for cvl=1:NCvl
    for i=1:length(paretoSetvl)
        if(length(paretoSetvl{i})==classesvl(cvl))
            vlCount(cvl)=vlCount(cvl)+1;
        end
    end
end

else
  for cvl=1:NCvl
    for i=1:numel(paretoSetvl)
        if(length(paretoSetvl{1,i}{1,1})==classesvl(cvl))
            vlCount(cvl)=vlCount(cvl)+1;
        end
    end
  end  
end
Count=zeros(1,NC);

cssvl=classesvl(vlCount~=0);
vlCount(vlCount==0)=[];
bar(cssvl,vlCount);title('VL');xlabel('classes');ylabel('number of solutions');
set(gca, 'XTick', cssvl,'fontsize',6)
set(gca,'xTickLabel',cssvl);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

title('SC-MOPSO')
            