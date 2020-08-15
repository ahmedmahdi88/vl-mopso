cd ..
cd ..
% uncomment the following line for select the scenario number
% scenario=10;
% if you want to visualize mathematical functions results uncomment the
% following line and comment the next line
% results='Results';
Scenario=scenario;
results='Results_Sensors';
path= [ results '\Scenario-' num2str(scenario) '\Scenario-' num2str(scenario) '.mat'];
cd(path);
res=load(['Scenario-'  num2str(scenario) '.mat']);
% rep=res.rep;
paretoSet=res.paretoSet;
paretoFront=res.paretoFront;
% lowerLength=res.lowerBound_dim;
% higherLength=res.higherBound_dim;

if (size(paretoFront,2))==2
for i=1:size(paretoSet,1)
    p=paretoSet(paretoSet(i,:)~=0);
    plot3(paretoFront(i,1),paretoFront(i,2),length(p),'b*');hold on;
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

    