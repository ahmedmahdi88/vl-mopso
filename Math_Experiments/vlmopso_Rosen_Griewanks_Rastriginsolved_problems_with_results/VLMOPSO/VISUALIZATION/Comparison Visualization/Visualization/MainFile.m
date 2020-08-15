clear;clc;close all;
Scenario=9;
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
saveas(f1,[p '/rosen-grie-rastrigin/setCoverage-rgr-scenario' num2str(Scenario) '.png'])
saveas(f2,[p '/rosen-grie-rastrigin/RGD-rgr-scenario' num2str(Scenario) '.png'])
saveas(f3,[p '/rosen-grie-rastrigin/NDS-rgr-scenario' num2str(Scenario) '.png'])
saveas(f5,[p '/rosen-grie-rastrigin/histogram-vlmopso-rgr-scenario' num2str(Scenario) '.png'])
saveas(f6,[p '/rosen-grie-rastrigin/histogram-mopso-rgr-scenario' num2str(Scenario) '.png'])
saveas(f7,[p '/rosen-grie-rastrigin/histogram-nsga2-rgr-scenario' num2str(Scenario) '.png'])
saveas(f8,[p '/rosen-grie-rastrigin/pareto-rgr-scenario' num2str(Scenario) '.png'])
% saveas(f4,[p '/rosen-grie-rastrigin/HV-rgr-scenario' num2str(Scenario) '.png'])
