clear;clc;close all;
for Scenario=1:10
    AddRequiredPaths;
   f1=figure; HvVisualizationComp(Scenario);
   p=pwd;
p(p=='\')='/';
    saveas(f1,[p '/images/Hv-Scenario-' num2str(Scenario) '.png']);
end