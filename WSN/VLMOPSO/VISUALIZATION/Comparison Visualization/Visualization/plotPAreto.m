plot(paretoFront(:,1),paretoFront(:,2),'bP');hold on;
xlabel('obj1');
ylabel('obj2');
title('Pareto Front');
hold on;
plot(paretoFrontvl(:,1),paretoFrontvl(:,2),'ro');
plot(pno(:,1),pno(:,2),'ks')
legend({'MOPSO','SC-MOPSO','NSGA-II'})
hold off;