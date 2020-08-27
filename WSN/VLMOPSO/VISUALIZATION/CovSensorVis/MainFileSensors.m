% insert W,H for the environment, sensors positions vector
% sensors positions are in linear indices
clear;clc;close all;
W=10;
H=10;
pos=[1 2 3];
% or you can load sensor position from results , so uncomment the following
% select scenario number
Scenario=1;
% cd ..
% cd ..
% cd ..
% cd Results_Sensors-nsga2/NSGA2
% cd Results_Sensors
% cd \mopso-with-addhock-for-variable-length\Results_Sensors
% n=load(['Scenario-' num2str(Scenario) '/Scenario-' num2str(Scenario) '.mat']);
% % % load(['scenario-' num2str(scenario) '/scenario-' num2str(scenario) '.mat/scenario-' num2str(scenario) '.mat']);
% % % select random index
% paretoSet=n.paretoFront.solutions;
% paretoFN2=n.paretoFront;
% paretoFront=n.paretoFront.solutionsObjectiveValues;
% randomIndex= round(unifrnd(1,numel(paretoSet)));
% d=paretoSet(randomIndex).dim;
% pos=paretoSet(randomIndex).pos(1:d);
% % pos=paretoSet{1,randomIndex};
% cd ..
% cd ..
% cd VISUALIZATION/CovSensorVis
% f1=figure;
% visSensors(W,H,pos,'g',1);
% % % or select Index that satisfy coverage objective=0
% index=find(paretoFront(:,1)==0,1);
% title(['cov= ' num2str(1-paretoFront(randomIndex,1)) ' | cost= ' num2str(paretoFront(randomIndex,2))]);
% if isempty(index)
%     disp('can not find coverage objective=0');
% else
%     d=paretoSet(index).dim;
% pos2=paretoSet(index).pos(1:d);
% % pos2=paretoSet{1,index}
% end
% % % environment visualization
% % 
% if ~isempty(index)
% f2=figure;
% visSensors(W,H,pos2,'g',1);
% title(['cov= ' num2str(1-paretoFront(index,1)) ' | cost= ' num2str(paretoFront(index,2))]);
% end
% % % figure;
% % % visSensors(W,H,pos);
% % % % visulaize pareto with length
f3=figure;
Length_pareto_vis;
cd ..
cf=pwd;
% saveas(f1,[cf '\Comparison Visualization\Visualization\images\randomSolution_sensors_nsga2.png'])
% saveas(f2,[cf '\Comparison Visualization\Visualization\images\fullCovSolution-sensors-nsga2.png'])
saveas(f3,[cf '\Comparison Visualization\Visualization\images\pareto-length-sensors-MOPSO.png'])



