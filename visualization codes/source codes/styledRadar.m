function[f]=styledRadar(bdata,Lgnd,AxesLabels,Titl,FillOption)
f=figure

hold on
spider_plot(bdata,'AxesLabels',AxesLabels,'FillOption',FillOption,'AxesLimits',[zeros(1,size(bdata,2));ones(1,size(bdata,2))])
title(Titl,'FontName','Times','LineWidth',1,'FontWeight','bold','FontSize',14);
set(gcf,'color','w');
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
legend(Lgnd,'FontName','Times','FontWeight','bold','FontSize',11);
