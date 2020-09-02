%% initialization and adding required paths
p=pwd;
p(p=='\')='/';
addpath([p '/..']);
for Scenario=1:10
    clc;
    disp(['Scenario: ' num2str(Scenario)]);
    AddRequiredPaths;
   f1=figure; HvVisualizationComp(Scenario);
   saveas(f1,[p '/../../../images/Hv-Scenario-' num2str(Scenario) '.png']);
end
%% boxPlot
