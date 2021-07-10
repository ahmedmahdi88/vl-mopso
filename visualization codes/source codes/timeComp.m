
somedata=[resvl.t  reswm.t res.t  n.t resws.t ];
somenames={'SC-MOPSO' ,'MOPSO', 'm-MOPSO', 'NSGA-II' , 'WS-VLPSO'};
% subplot(3,1,1)
bar(somedata);set(gca,'xticklabel',somenames)
set(gcf,'color','w');
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
title('Execution Time' );
