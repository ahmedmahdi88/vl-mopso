clear;clc;close all;
Scenario=10;
AddRequiredPaths;
f1=figure(1);SetCoverageVisualizationComp(Scenario);drawnow
f2=figure(2);RelativeGenerationalDistanceVis(Scenario);drawnow
f3=figure(3);NDS(Scenario);drawnow
f5=figure(5);ClassesHistogramVis(Scenario);drawnow
f6=figure(6);ClassesHistogramVisMOPSO(Scenario);drawnow
f7=figure(7);ClassesHistogramVisNSGA2(Scenario);drawnow
% if you need to visualize hyper volume uncomment the following row;
f4=figure(4);HvVisualizationComp(Scenario);
f8=figure(8);plotPAreto;
p=pwd;
saveas(f1,[p '/rastriginStybtangFigs/setCoverage-rs-scenario' num2str(Scenario) '.png'])
saveas(f2,[p '/rastriginStybtangFigs/RGD-rs-scenario' num2str(Scenario) '.png'])
saveas(f3,[p '/rastriginStybtangFigs/NDS-rs-scenario' num2str(Scenario) '.png'])
saveas(f5,[p '/rastriginStybtangFigs/histogram-vlmopso-rs-scenario' num2str(Scenario) '.png'])
saveas(f6,[p '/rastriginStybtangFigs/histogram-mopso-rs-scenario' num2str(Scenario) '.png'])
saveas(f7,[p '/rastriginStybtangFigs/histogram-nsga2-rs-scenario' num2str(Scenario) '.png'])
saveas(f8,[p '/rastriginStybtangFigs/pareto-rs-scenario' num2str(Scenario) '.png'])
saveas(f4,[p '/rastriginStybtangFigs/HV-rs-scenario' num2str(Scenario) '.png'])
