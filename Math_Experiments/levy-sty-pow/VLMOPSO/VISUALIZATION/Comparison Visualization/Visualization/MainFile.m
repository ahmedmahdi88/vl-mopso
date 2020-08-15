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
% figure(4);HvVisualizationComp(Scenario);
f8=figure(8);plotPAreto;
p=pwd;
saveas(f1,[p '/MathFigures-levy-sty-pow/setCoverage-levy-sty-pow-scenario' num2str(Scenario) '.png'])
saveas(f2,[p '/MathFigures-levy-sty-pow/RGD-levy-sty-pow-scenario' num2str(Scenario) '.png'])
saveas(f3,[p '/MathFigures-levy-sty-pow/NDS-levy-sty-pow-scenario' num2str(Scenario) '.png'])
saveas(f5,[p '/MathFigures-levy-sty-pow/histogram-vlmopso-levy-sty-pow-scenario' num2str(Scenario) '.png'])
saveas(f6,[p '/MathFigures-levy-sty-pow/histogram-mopso-levy-sty-pow-scenario' num2str(Scenario) '.png'])
saveas(f7,[p '/MathFigures-levy-sty-pow/histogram-nsga2-levy-sty-pow-scenario' num2str(Scenario) '.png'])
saveas(f8,[p '/MathFigures-levy-sty-pow/pareto-levy-sty-pow-scenario' num2str(Scenario) '.png'])
% saveas(f4,[p '/HV-levy-sty-pow-scenario' num2str(Scenario) '.png'])
