
somedata=[reswm.t res.t resvl.t  n.t resws.t ];
somenames={'MOPSO', 'm-MOPSO','SC-MOPSO' , 'NSGA-II' , 'WS-VLPSO'};
% subplot(3,1,1)
bar(somedata);set(gca,'xticklabel',somenames)
title('Execution Time' );
