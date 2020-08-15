function optimal_objectives= find_opt_objs()
clear;clc;
AddRequiredPaths;


% fl=[];
% for i=1:length(pop)
%     if ~(pop(i).IsDominated)
% fl=[fl; pop(i).cost];
%     end
% end

% vl=[];
% for i=1:length(popvl)
%     if ~(popvl(i).IsDominated)
% vl=[vl ;popvl(i).cost];
%     end
% end
% vl=[];
% for i=1:length(paretovl)
%     if paretovl(i,:)~=[inf,inf]
% vl=[vl;paretovl(i,:)];%[];
%     end
%     end

ob1=[paretoFront(:,1);paretoFrontvl(:,1)];
ob2=[paretoFront(:,2);paretoFrontvl(:,2)];
if nobjArr(Scenario)==3
    ob3=[paretoFront(:,3);paretoFrontvl(:,3)];
end
optimal_objectives=[min(ob1),min(ob2)];
if nobjArr(Scenario)==3
    optimal_objectives=[min(ob1),min(ob2),min(ob3)];
end
end
