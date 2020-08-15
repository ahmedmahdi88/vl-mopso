function ttest_Vis()
AddRequiredPaths;

m=min(length(paretoFrontvl),length(paretoFront));
[~,pvf]=ttest(paretoFrontvl(1:m,:),paretoFront(1:m,:));
m=min(length(paretoFrontvl),length(pno));
[~,pvn]=ttest(paretoFrontvl(1:m,:),pno(1:m,:));
m=min(length(paretoFront),length(pno));
[~,pfn]=ttest(paretoFront(1:m,:),pno(1:m,:));

obj=1;

somedata=[pvf(obj) pvn(obj) pfn(obj) ];
somenames={'ttest(vl,fl)', 'ttest(vl,nsga2)', 'ttest(fl,nsga2)'};

bar(somedata);set(gca,'xticklabel',somenames);title([ 'obj-' num2str(obj)]);
suptitle(['ttest /scenario-' num2str(Scenario)]);

