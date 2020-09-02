clear;clc;close all;
AddRequiredPaths;
figure;SetCoverageVisualizationComp();drawnow
figure;RelativeGenerationalDistanceVis();drawnow
figure;NDS();drawnow
figure;ClassesHistogramVis();drawnow
% if you need to visualize hyper volume uncomment the following row;
% figure(4);HvVisualizationComp();