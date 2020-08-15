% insert W,H for the environment, sensors positions vector
% sensors positions are in linear indices
clear;clc;close all;
W=10;
H=10;
pos=[1 2 3];
% or you can load sensor position from results , so uncomment the following
% select scenario number
scenario=9;
% cd ..
% cd ..
% cd Results_Sensors
% load(['scenario-' num2str(scenario) '/scenario-' num2str(scenario) '.mat/scenario-' num2str(scenario) '.mat']);
% % select random index
% randomIndex= round(unifrnd(1,length(paretoSet)));
% pos=paretoSet{1,randomIndex};
% % or select Index that satisfy coverage objective=0
% index=find(paretoFront(:,1)==0,1);
% if isempty(index)
%     disp('can not find coverage objective=0');
% else
% pos2=paretoSet{1,index};
% end
% % environment visualization
% cd ..
% cd VISUALIZATION/CovSensorVis
% title(['cov= ' num2str(paretoFront(randomIndex,1)) ' | cost= ' num2str(paretoFront(randomIndex,2))]);
% if ~isempty(index)
% figure;
% visSensors(W,H,pos2);
% title(['cov= ' num2str(paretoFront(index,1)) ' | cost= ' num2str(paretoFront(index,2))]);
% end
figure;
visSensors(W,H,pos);
% visulaize pareto with length
figure;
Length_pareto_vis;



