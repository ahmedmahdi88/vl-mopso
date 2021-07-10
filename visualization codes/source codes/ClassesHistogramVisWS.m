cont = 1;
Count=[];
for c = classesws
    b = [paretoSetws.nvar]==c;
    Count(cont) = length(find(b==1));
    cont = cont + 1;
end
    
bar(classesws,Count);title('WS-VLPSO');xlabel('classes');ylabel('number of solutions');
title('WS-VLPSO');
set(gca, 'XTick', classesws,'fontsize',6)
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
set(gca,'xTickLabels',classesws);
