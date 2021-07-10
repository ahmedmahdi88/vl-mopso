%% initialization and adding required paths
%% generate all 10 scenarios measures figures and paretoFront using bars
for Scenario=1:10
    clc;
    disp(['Scenario: ' num2str(Scenario)]);
AddRequiredPaths;

f1=figure(1);SetCoverageVisualizationComp;
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

f2=figure(2);RelativeGenerationalDistanceVis;
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

f3=figure(3);NDS;
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

f5=figure(5);ClassesHistogramVis;
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

f6=figure(6);ClassesHistogramVisMoPso;
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

f9=figure(9);
ClassesHistogramVisMoPso2;
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

f7=figure(7);ClassesHistogramVisNSGA2;
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

f77=figure(77);ClassesHistogramVisWS;
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

% if you need to visualize hyper volume uncomment the following row;
f4=figure(4);HvVisualizationComp;
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

f8=figure(8);plotPAreto;
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

if problemNumber==1
    f10=figure(10);timeComp;
    set(gcf,'units','normalized','outerposition',[0 0 1 1])
    set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
end
%% saving all figures as png
p=pwd;
p(p=='\')='/';
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
fd = [cd '/results images/' folder];
if ~exist(fd,'dir')
    mkdir(fd);
end
saveas(f1,[p '/results images/' folder '/setCoverage-scenario' num2str(Scenario) '.png'])
saveas(f11,[p '/results images/' folder '/setCoverageConfMat-scenario' num2str(Scenario) '.png'])
saveas(f2,[p '/results images/' folder '/RGD-scenario' num2str(Scenario) '.png'])
saveas(f3,[p '/results images/' folder '/NDS-scenario' num2str(Scenario) '.png'])
saveas(f5,[p '/results images/' folder '/histogram-vlmopso-scenario' num2str(Scenario) '.png'])
saveas(f6,[p '/results images/' folder '/histogram-mopsoMut-scenario' num2str(Scenario) '.png'])
saveas(f9,[p '/results images/' folder '/histogram-mopso-scenario' num2str(Scenario) '.png'])
saveas(f77,[p '/results images/' folder '/histogram-wsvlpso-scenario' num2str(Scenario) '.png'])

saveas(f7,[p '/results images/' folder '/histogram-nsga2-scenario' num2str(Scenario) '.png'])
saveas(f8,[p '/results images/' folder '/pareto-scenario' num2str(Scenario) '.png'])
saveas(f4,[p '/results images/' folder '/HV-scenario' num2str(Scenario) '.png'])
if problemNumber==1
    saveas(f10,[p '/results images/' folder '/Time-scenario' num2str(Scenario) '.png'])
end
%%
clc;disp('save is done');
close all;
end
%% the end