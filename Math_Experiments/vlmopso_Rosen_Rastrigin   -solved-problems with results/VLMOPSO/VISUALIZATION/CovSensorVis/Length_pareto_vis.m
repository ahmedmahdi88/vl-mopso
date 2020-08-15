% clear;clc;close all;
cd ..
cd ..
% Scenario=1;
% if you want to visualize mathematical functions results uncomment the
% following line and comment the next line
% results='Results';
Scenario=scenario;
results='Results_Sensors';
path= [ results '\Scenario-' num2str(Scenario) '\Scenario-' num2str(Scenario) '.mat'];
cd(path);
res=load(['Scenario-'  num2str(Scenario) '.mat']);
% rep=res.rep;
paretoSet=res.paretoSet;
paretoFront=res.paretoFront;
% lowerLength=res.lowerBound_dim;
% higherLength=res.higherBound_dim;
if (size(paretoFront,2))==2
for i=1:numel(paretoSet)
    plot3(paretoFront(i,1),paretoFront(i,2),length(paretoSet{1,i}),'b*');hold on;
end

else
    disp('cant visualize');
    end

% title(['Scenario-' num2str(Scenario) ' /lowerLength=' num2str(lowerLength) ' /higherLength=' ...
%     num2str(higherLength)]);
xlabel('obj1');
ylabel('obj2');
zlabel('length');

cd ..
cd ..
cd ..
cd 'VISUALIZATION'

    