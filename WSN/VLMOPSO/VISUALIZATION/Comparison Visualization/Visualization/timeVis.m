function g=timeVis(s)
Scenario=s;
AddRequiredPaths;
tv=resvl.t;
tm=res.t;
tn=n.t;
somedata=[tv tm tn];
somenames={'SC-MOPSO', 'MOPSO','NSGA-II'};
figure;
g=bar(somedata);set(gca,'xticklabel',somenames);
title('Execution Time');

end
