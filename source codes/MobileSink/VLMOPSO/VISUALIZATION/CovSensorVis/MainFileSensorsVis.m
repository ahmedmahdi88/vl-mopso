% insert W,H for the environment, sensors positions vector
% sensors positions are in linear indices
clear;clc;
W=10;
H=10;
pos=round(unifrnd(1,100,1,10));
% or you can load sensor position from results , so uncomment the following
% select scenario number
scenario=10;
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
% pos2=paretoSet{1,paretoFront(:,1)==0};
% end
% % environment visualization
% cd ..
% cd VISUALIZATION/CovSensorVis
% if ~isempty(index)
% figure;
% title(['full coverage | cov= ' num2str(paretoFront(index,1)) ' | sensors= ' num2str(length(pos2))]);
% visSensors(W,H,pos2);
% end
figure;
% title(['random coverage | cov= ' num2str(paretoFront(randomIndex,1)) ' | sensors= ' num2str(length(pos))]);
visSensors(W,H,pos,'g',1);
%%% visulaize pareto with length
figure;
Length_pareto_vis;
cd 'CovSensorVis'


