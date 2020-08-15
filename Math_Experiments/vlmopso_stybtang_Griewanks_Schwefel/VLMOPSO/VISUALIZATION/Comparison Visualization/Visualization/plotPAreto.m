plot3(paretoFront(:,1),paretoFront(:,2),paretoFront(:,3),'bP');
xlabel('obj1');
ylabel('obj2');
zlabel('obj3');
title('Pareto Front');
hold on;
plot3(paretoFrontvl(:,1),paretoFrontvl(:,2),paretoFrontvl(:,3),'ro');
plot3(pno(:,1),pno(:,2),pno(:,3),'ks')
legend({'MOPSO','VL-MOPSO','NSGA-II'})
hold off;