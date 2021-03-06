% insert W,H for the environment, sensors positions vector
% sensors positions are in linear indices
clear;clc;close all;
W=10;
H=10;
% enter some position vector
pos=[1 2 3];
% or you can load sensor position from results , so uncomment the following
% lines
% select scenario number
scenario=1;
cd ..
cd ..
cd Results_Sensors
load(['scenario-' num2str(scenario) '/scenario-' num2str(scenario) '.mat/scenario-' num2str(scenario) '.mat']);
% select random index
randomIndex= round(unifrnd(1,size(paretoSet,1)));
pos=paretoSet(randomIndex,:);
% or select Index that satisfy coverage objective=0
index=find(paretoFront(:,1)==0,1);
if isempty(index)
    disp('can not find coverage objective=0');
else
pos2=paretoSet(index,:);
end
% environment visualization
cd ..
cd VISUALIZATION/CovSensorVis
if ~isempty(index)
figure;
visSensors(W,H,pos2);
p=pos2(pos2~=0);
title(['full coverage | cov= ' num2str(paretoFront(index,1)) ' | sensors= ' num2str(length(p))]);
end
figure;
p=pos(pos~=0);
title(['random coverage | ' 'cov= ' num2str(paretoFront(randomIndex,1)) ' | sensors= ' num2str(length(p))]);
visSensors(W,H,pos);
% visulaize pareto with length
figure;
Length_pareto_vis;
cd 'CovSensorVis'


