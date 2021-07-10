%  clear;clc;close all;
cd ..
cd ..
scenario=1;
% if you want to visualize mathematical functions results uncomment the
% following line and comment the next line
% results='Results';
Scenario=scenario;
results='Results_sensors-nsga2\NSGA2';
path= [ results '\Scenario-' num2str(Scenario) ];
cd(path);
n=load(['Scenario-'  num2str(Scenario) '.mat']);
% rep=res.rep;
paretoSet=n.paretoFront.solutions;
paretoFront=n.paretoFront.solutionsObjectiveValues;
% lowerLength=res.lowerBound_dim;
% higherLength=res.higherBound_dim;
if (size(paretoFront,2))==2
for i=1:numel(paretoSet)
    plot3(paretoFront(i,1),paretoFront(i,2),paretoSet(i).dim,'b*');hold on;
    set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

end

else
    disp('cant visualize');
    end

% title(['Scenario-' num2str(Scenario) ' /lowerLength=' num2str(lowerLength) ' /higherLength=' ...
%     num2str(higherLength)]);
xlabel('obj1');
ylabel('obj2');
zlabel('length');
title('ParetoFront with Particle Length');
cd ..
cd ..
cd ..
cd 'VISUALIZATION'
cf=pwd;
saveas(gcf,[cf '/Comparison Visualization/Visualization/images/Length-vs-pareto-sensors-NSGA-II.png'])
    