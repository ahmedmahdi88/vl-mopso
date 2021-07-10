function[]=coloredBar(bdata)
colors = ['b','g','r','y','c','m'];
 hold on
sz=size(bdata,1);
for i = 1:sz
    bar(i,bdata(i),colors(i),'linewidth',2)
    set(gcf,'units','normalized','outerposition',[0 0 1 1])
    set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
  
end