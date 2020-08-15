clear;clc;close all;
Scenario=10;
AddRequiredPaths;
figure(1);SetCoverageVisualizationComp(Scenario);drawnow
figure(2);RelativeGenerationalDistanceVis(Scenario);drawnow
figure(3);NDS(Scenario);drawnow
figure(5);ClassesHistogramVis(Scenario);drawnow
figure(6);ClassesHistogramVisMoPso(Scenario);drawnow
figure(7);ClassesHistogramVisNSGA2(Scenario);drawnow
% if you need to visualize hyper volume uncomment the following row;
figure(4);HvVisualizationComp(Scenario);
figure(8);plotPAreto;