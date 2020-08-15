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
f4=figure(4);HvVisualizationComp(Scenario);
f8=figure(8);plotPAreto;
p=pwd;
saveas(f1,[p '/rosenSphereFigs/setCoverage-rosenSphere-scenario' num2str(Scenario) '.png'])
saveas(f2,[p '/rosenSphereFigs/RGD-rosenSphere-scenario' num2str(Scenario) '.png'])
saveas(f3,[p '/rosenSphereFigs/NDS-rosenSphere-scenario' num2str(Scenario) '.png'])
saveas(f5,[p '/rosenSphereFigs/histogram-vlmopso-rosenSphere-scenario' num2str(Scenario) '.png'])
saveas(f6,[p '/rosenSphereFigs/histogram-mopso-rosenSphere-scenario' num2str(Scenario) '.png'])
saveas(f7,[p '/rosenSphereFigs/histogram-nsga2-rosenSphere-scenario' num2str(Scenario) '.png'])
saveas(f8,[p '/rosenSphereFigs/pareto-rosenSphere-scenario' num2str(Scenario) '.png'])
saveas(f4,[p '/rosenSphereFigs/HV-rosenSphere-scenario' num2str(Scenario) '.png'])
