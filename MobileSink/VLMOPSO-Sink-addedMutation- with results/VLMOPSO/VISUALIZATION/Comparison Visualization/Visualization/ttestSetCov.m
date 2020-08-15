clear;clc;close all;
for Scenario=1:10
    AddRequiredPaths;
    C_VL_MO(Scenario) = SetCoverage2(paretoFrontvl,paretoFront);
    C_MO_VL(Scenario) = SetCoverage2(paretoFront,paretoFrontvl);
    C_VL_N2(Scenario) = SetCoverage2(paretoFrontvl,pno);
    C_N2_VL(Scenario) = SetCoverage2(pno,paretoFrontvl);
end
figure;
plot(C_VL_MO,'linewidth',2);xlabel('scenario');ylabel('setCoverage');
hold on; 
plot(C_MO_VL,'linewidth',2);legend({'C(Vl,FL)','C(FL,VL)'});
figure;
plot(C_VL_N2,'linewidth',2);xlabel('scenario');ylabel('setCoverage');
hold on; 
plot(C_N2_VL,'linewidth',2);legend({'C(Vl,N2)','C(N2,VL)'});
[~,pvm]=ttest(C_VL_MO,C_MO_VL);
[~,pvn]=ttest(C_VL_N2,C_N2_VL);
somedata=[pvm pvn];
somenames={'ttest(vl,mopso)', 'ttest(vl,nsga2)'};
figure;
bar(somedata);set(gca,'xticklabel',somenames);
suptitle(['ttest ']);
