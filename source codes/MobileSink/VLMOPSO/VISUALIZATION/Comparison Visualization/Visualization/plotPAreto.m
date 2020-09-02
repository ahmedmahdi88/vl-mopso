plot(paretoFront(:,1),paretoFront(:,2),'bP');
xlabel('obj1');
ylabel('obj2');
title('Pareto Front');
hold on;
plot(paretoFrontvl(:,1),paretoFrontvl(:,2),'ro');
plot(pno(:,1),pno(:,2),'ks')
legend({'MOPSO','VL-MOPSO','NSGA-II'})
hold off;