
somedata=[reswm.t res.t resvl.t  n.t  ];
somenames={'MOPSO', 'm-MOPSO','SC-MOPSO' , 'NSGA-II'};
% subplot(3,1,1)
bar(somedata);set(gca,'xticklabel',somenames)
title('Execution Time' );
