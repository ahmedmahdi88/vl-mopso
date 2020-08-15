function timeVis(s)
Scenario=s;
AddRequiredPaths;
tv=resvl.t;
tm=res.t;
tn=n.t;
somedata=[tv tm tn];
somenames={'VL-MOPSO', 'MOPSO','NSGA-II'};
figure;
g=bar(somedata);set(gca,'xticklabel',somenames);
title('Execution Time');
saveas(g,['figures/Time-scenario-' num2str(Scenario) '.png']);
end
