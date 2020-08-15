clear;clc;close all;
Scenario=10;
AddRequiredPaths;
f1=figure(1);SetCoverageVisualizationComp(Scenario);drawnow
f2=figure(2);RelativeGenerationalDistanceVis(Scenario);drawnow
f3=figure(3);NDS(Scenario);drawnow
f5=figure(5);ClassesHistogramVis(Scenario);drawnow
f6=figure(6);ClassesHistogramVisMoPso(Scenario);drawnow
f7=figure(7);ClassesHistogramVisNSGA2(Scenario);drawnow
% if you need to visualize hyper volume uncomment the following row;
% f4=figure(4);HvVisualizationComp(Scenario);
f8=figure(8);plotPAreto;
p=pwd;
saveas(f1,[p '/styb-gri-schwefel/setCoverage-sgs-scenario' num2str(Scenario) '.png'])
saveas(f2,[p '/styb-gri-schwefel/RGD-sgs-scenario' num2str(Scenario) '.png'])
saveas(f3,[p '/styb-gri-schwefel/NDS-sgs-scenario' num2str(Scenario) '.png'])
saveas(f5,[p '/styb-gri-schwefel/histogram-vlmopso-sgs-scenario' num2str(Scenario) '.png'])
saveas(f6,[p '/styb-gri-schwefel/histogram-mopso-sgs-scenario' num2str(Scenario) '.png'])
saveas(f7,[p '/styb-gri-schwefel/histogram-nsga2-sgs-scenario' num2str(Scenario) '.png'])
saveas(f8,[p '/styb-gri-schwefel/pareto-sgs-scenario' num2str(Scenario) '.png'])
% saveas(f4,[p '/styb-gri-schwefel/HV-sgs-scenario' num2str(Scenario) '.png'])
