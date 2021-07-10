if nobjArr(1)==3
plot3(paretoFrontvl(:,1),paretoFrontvl(:,2),paretoFrontvl(:,3),'ro');
hold on;
plot3(paretoFront(:,1),paretoFront(:,2),paretoFront(:,3),'bP');
xlabel('obj1');
ylabel('obj2');
zlabel('obj3');
title('Pareto Front');


plot3(paretoFrontwm(:,1),paretoFrontwm(:,2),paretoFrontwm(:,3),'mp');
plot3(pno(:,1),pno(:,2),pno(:,3),'gs')
plot3(paretoFrontws(:,1),paretoFrontws(:,2),paretoFrontws(:,3),'k^')

legend({'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'})
set(gcf,'color','w');
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

hold off;
else
    hold on;
    plot(paretoFrontvl(:,1),paretoFrontvl(:,2),'ro');
plot(paretoFront(:,1),paretoFront(:,2),'bP');
plot(paretoFrontwm(:,1),paretoFrontwm(:,2),'mp');
plot(pno(:,1),pno(:,2),'gs')
plot(paretoFrontws(:,1),paretoFrontws(:,2),'k^');
set(gcf,'color','w');

xlabel('obj1');
ylabel('obj2');
title('Pareto Front');
set(gcf,'color','w');
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
% hold on;
% plot(paretoFrontwm(:,1),paretoFrontwm(:,2),'mp');
% plot(pno(:,1),pno(:,2),'gs')
% plot(paretoFrontws(:,1),paretoFrontws(:,2),'k^');
set(gcf,'color','w');
set(gca,'FontSize',6);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
legend({'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'})
hold off;
end
    