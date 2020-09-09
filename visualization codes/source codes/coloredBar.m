function[]=coloredBar(bdata)
colors = ['b','g','r','y','c','m'];
 hold on
sz=size(bdata,1);
for i = 1:sz
    bar(i,bdata(i),colors(i),'linewidth',2)
   
end