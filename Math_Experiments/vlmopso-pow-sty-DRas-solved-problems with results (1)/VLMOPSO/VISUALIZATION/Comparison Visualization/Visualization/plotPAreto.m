plot3(paretoFront(:,1),paretoFront(:,2),paretoFront(:,3),'bP');hold on;
plot3(paretoFrontwm(:,1),paretoFrontwm(:,2),paretoFrontwm(:,3),'mp');
xlabel('obj1');
ylabel('obj2');
title('Pareto Front');
hold on;
plot3(paretoFrontvl(:,1),paretoFrontvl(:,2),paretoFrontvl(:,3),'ro');
plot3(pno(:,1),pno(:,2),pno(:,3),'ks')
legend({'m-MOPSO','MOPSO','SC-MOPSO','NSGA-II'})
hold off;