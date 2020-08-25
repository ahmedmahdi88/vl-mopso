clear;clc;close all;
Scenario=10;
AddRequiredPaths;
f1=figure(1);SetCoverageVisualizationComp(Scenario);drawnow
f2=figure(2);RelativeGenerationalDistanceVis(Scenario);drawnow
f3=figure(3);NDS(Scenario);drawnow
f5=figure(5);ClassesHistogramVis(Scenario);drawnow
f6=figure(6);ClassesHistogramVisMoPso(Scenario);drawnow
f9=figure(9);ClassesHistogramVisMoPso2(Scenario);drawnow
f7=figure(7);ClassesHistogramVisNSGA2(Scenario);drawnow
% if you need to visualize hyper volume uncomment the following row;
% f4=figure(4);HvVisualizationComp(Scenario);
f8=figure(8);plotPAreto;
p=pwd;
p(p=='\')='/';
saveas(f1,[p '/images/setCoverage-scenario' num2str(Scenario) '.png'])
saveas(f2,[p '/images/RGD-scenario' num2str(Scenario) '.png'])
saveas(f3,[p '/images/NDS-scenario' num2str(Scenario) '.png'])
saveas(f5,[p '/images/histogram-vlmopso-scenario' num2str(Scenario) '.png'])
saveas(f9,[p '/images/histogram-mopso-scenario' num2str(Scenario) '.png'])
saveas(f6,[p '/images/histogram-mopsoMut-scenario' num2str(Scenario) '.png'])
saveas(f7,[p '/images/histogram-nsga2-scenario' num2str(Scenario) '.png'])
saveas(f8,[p '/images/pareto-scenario' num2str(Scenario) '.png'])
% saveas(f4,[p '/images/HV-scenario' num2str(Scenario) '.png'])
clc;disp('save done');
close all;