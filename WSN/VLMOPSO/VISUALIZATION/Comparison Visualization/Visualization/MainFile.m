clear;clc;close all;

for Scenario=1:10;
AddRequiredPaths;
f1=figure(1);SetCoverageVisualizationComp(Scenario);
f2=figure(2);RelativeGenerationalDistanceVis(Scenario);
f3=figure(3);NDS(Scenario);
f5=figure(5);ClassesHistogramVis(Scenario);
f6=figure(6);ClassesHistogramVisMoPso(Scenario);
% f9=figure(9);ClassesHistogramVisMoPso2(Scenario);
f7=figure(7);ClassesHistogramVisNSGA2(Scenario);
% if you need to visualize hyper volume uncomment the following row;
f4=figure(4);HvVisualizationComp(Scenario);
f8=figure(8);plotPAreto;
p=pwd;
saveas(f1,[p '/images/setCoverage-rl-scenario' num2str(Scenario) '.png'])
saveas(f2,[p '/images/RGD-rl-scenario' num2str(Scenario) '.png'])
saveas(f3,[p '/images/NDS-rl-scenario' num2str(Scenario) '.png'])
saveas(f5,[p '/images/histogram-vlmopso-rl-scenario' num2str(Scenario) '.png'])
saveas(f6,[p '/images/histogram-mopsoMut-rl-scenario' num2str(Scenario) '.png'])
% saveas(f9,[p '/images/histogram-mopso-rl-scenario' num2str(Scenario) '.png'])
saveas(f7,[p '/images/histogram-nsga2-rl-scenario' num2str(Scenario) '.png'])
saveas(f8,[p '/images/pareto-rl-scenario' num2str(Scenario) '.png'])
saveas(f4,[p '/images/HV-rl-scenario' num2str(Scenario) '.png'])
clc;disp('save is done');
close all;
end