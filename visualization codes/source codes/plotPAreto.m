if nobjArr(1)==3
plot3(paretoFront(:,1),paretoFront(:,2),paretoFront(:,3),'bP');hold on;
plot3(paretoFrontwm(:,1),paretoFrontwm(:,2),paretoFrontwm(:,3),'mp');
xlabel('obj1');
ylabel('obj2');
zlabel('obj3');
title('Pareto Front');
hold on;
plot3(pno(:,1),pno(:,2),pno(:,3),'gs')
plot3(paretoFrontvl(:,1),paretoFrontvl(:,2),paretoFrontvl(:,3),'ro');
plot3(paretoFrontws(:,1),paretoFrontws(:,2),paretoFrontws(:,3),'k^')

legend({'m-MOPSO','MOPSO','NSGA-II','SC-MOPSO','WS-VLPSO'})
hold off;
else
    plot(paretoFront(:,1),paretoFront(:,2),'bP');hold on;
plot(paretoFrontwm(:,1),paretoFrontwm(:,2),'mp');
xlabel('obj1');
ylabel('obj2');
title('Pareto Front');
hold on;
plot(pno(:,1),pno(:,2),'gs')
plot(paretoFrontvl(:,1),paretoFrontvl(:,2),'ro');
plot(paretoFrontws(:,1),paretoFrontws(:,2),'k^');

legend({'m-MOPSO','MOPSO','NSGA-II','SC-MOPSO','WS-VLPSO'})
hold off;
end
    