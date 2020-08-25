plot(paretoFront(:,1),paretoFront(:,2),'bP');
xlabel('obj1');
ylabel('obj2');
zlabel('obj3');
title('Pareto Front');
hold on;
plot(paretoFrontwm(:,1),paretoFrontwm(:,2),'mP');
plot(paretoFrontvl(:,1),paretoFrontvl(:,2),'ro');
plot(pno(:,1),pno(:,2),'ks')
legend({'MOPSO-Mutation','MOPSO','VL-MOPSO','NSGA-II'})
hold off;