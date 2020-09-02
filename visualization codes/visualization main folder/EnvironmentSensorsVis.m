%% initialization
% clear;clc;close all
W=10;
H=10;
p=pwd;p(p=='\')='/';
% addpath([p '/../source codes']);
%% select scenario number
Scenario=3;%randi(10);
AddRequiredPaths
%% random vlmopso solution visualization
randomIndex= round(unifrnd(1,length(paretoSetvl)));
randPosvl=paretoSetvl{1,randomIndex};
%% full coverage vlmopso solution selection
index=find(paretoFrontvl(:,1)==0,1);
if isempty(index)
    disp('can not find vlmopso coverage objective=1');
else
fullCovPosvl=paretoSetvl{1,index};
end
%% random m-mopso solution selection
randomIndexMM= round(unifrnd(1,size(paretoSet,1)));
randPosMM=paretoSet(randomIndexMM,paretoSet(randomIndexMM,:)~=0);
%% full coverage m-mopso solution selection
indexMM=find(paretoFront(:,1)==0,1);
if isempty(indexMM)
    disp('can not find m-mopso coverage objective=1');
else
fullCovPosMM=paretoSet(indexMM,paretoSet(indexMM,:)~=0);
end
%% random mopso solution selection
randomIndexWM= round(unifrnd(1,size(paretoSetwm,1)));
randPosWM=paretoSetwm(randomIndexWM,paretoSetwm(randomIndexWM,:)~=0);
%% full coverage mopso solution selection
indexWM=find(paretoFrontwm(:,1)==0,1);
if isempty(indexWM)
    disp('can not find mopso coverage objective=1');
else
fullCovPosWM=paretoSetwm(indexWM,paretoSetwm(indexWM,:)~=0);
end
%% random NSGA-II solution selection
randomIndexN= round(unifrnd(1,size(pns,1)));
randPosN=pns(randomIndexN).pos(1:pns(randomIndexN).dim);
%% full coverage NSGA-II solution selection
indexN=find(pno(:,1)==0,1);
if isempty(indexN)
    disp('can not find NSGA-II coverage objective=1');
else
fullCovPosN=pns(indexN).pos(1:pns(indexN).dim);
end
%% environment visualization
%% full coverage vlmopso
if ~isempty(index)
f1=figure;
title(['full coverage | cov= ' num2str(1-paretoFrontvl(index,1)) ' | sensors= ' num2str(length(fullCovPosvl))]);
suptitle('SC-MOPSO');
visSensors(W,H,fullCovPosvl,'g',1);
end
%%  random vlmopso
f2=figure;
title(['random coverage | cov= ' num2str(1-paretoFrontvl(randomIndex,1)) ' | sensors= ' num2str(length(randPosvl))]);
suptitle('SC-MOPSO');
visSensors(W,H,randPosvl,'g',1);
%% full coverage m-mopso
if ~isempty(indexMM)
f3=figure;
title(['full coverage | cov= ' num2str(1-paretoFront(indexMM,1)) ' | sensors= ' num2str(length(fullCovPosMM(fullCovPosMM~=0)))]);
suptitle('m-MOPSO');
visSensors(W,H,fullCovPosMM(fullCovPosMM~=0),'g',1);
end 
%%  random m-mopso
f4=figure;
randPosMM=randPosMM(randPosMM~=0);
title(['random coverage | cov= ' num2str(1-paretoFront(randomIndexMM,1)) ' | sensors= ' num2str(length(randPosMM))]);
suptitle('m-MOPSO');
visSensors(W,H,randPosMM,'g',1);
%% full coverage mopso
if ~isempty(indexWM)
f5=figure;
fullCovPosWM=fullCovPosWM(fullCovPosWM~=0);
title(['full coverage | cov= ' num2str(1-paretoFrontwm(indexWM,1)) ' | sensors= ' num2str(length(fullCovPosWM))]);
suptitle('MOPSO');
visSensors(W,H,fullCovPosWM,'g',1);
end 
%%  random mopso
f6=figure;
randPosWM=randPosWM(randPosWM~=0);
title(['random coverage | cov= ' num2str(1-paretoFrontwm(randomIndexWM,1)) ' | sensors= ' num2str(length(randPosWM))]);
suptitle('MOPSO');
visSensors(W,H,randPosWM,'g',1);
%% full coverage NSGA-II
if ~isempty(indexN)
f7=figure;
fullCovPosN=fullCovPosN(fullCovPosN~=0);
title(['full coverage | cov= ' num2str(1-pno(indexN,1)) ' | sensors= ' num2str(pns(indexN).dim)]);
suptitle('NSGA-II');
visSensors(W,H,fullCovPosN,'g',1);
end 
%%  random NSGA-II
f8=figure;
randPosN=randPosN(randPosN~=0);
title(['random coverage | cov= ' num2str(1-pno(randomIndexN,1)) ' | sensors= ' num2str(pns(randomIndexN).dim)]);
suptitle('NSGA-II');
visSensors(W,H,randPosN,'g',1);
%% visulaize vlmopso pareto with length
f9=figure;title({'SC-MOPSO','paretoFront with solution length'});
for i=1:numel(paretoSetvl)
    plot3(paretoFrontvl(i,1),paretoFrontvl(i,2),length(paretoSetvl{1,i}),'b*');hold on;
end
xlabel('non-coverage');ylabel('cost');zlabel('number of sensors');
title('SC-MOPSO');
%% visulaize m-mopso pareto with length
f10=figure;title({'m-MOPSO','paretoFront with solution length'});
for i=1:size(paretoSet,1)
    plot3(paretoFront(i,1),paretoFront(i,2),length(paretoSet(i,(paretoSet(i,:)~=0))),'b*');hold on;
end
xlabel('non-coverage');ylabel('cost');zlabel('number of sensors');
title('m-MOPSO');
%% visulaize mopso pareto with length
f11=figure;title({'MOPSO','paretoFront with solution length'});
for i=1:size(paretoSetwm,1)
    plot3(paretoFrontwm(i,1),paretoFrontwm(i,2),length(paretoSetwm(i,(paretoSetwm(i,:)~=0))),'b*');hold on;
end
xlabel('non-coverage');ylabel('cost');zlabel('number of sensors');
title('MOPSO');
%% visulaize NSGA-II pareto with length
f12=figure;title({'NSGA-II','paretoFront with solution length'});
for i=1:size(pns,1)
    plot3(pno(i,1),pno(i,2),pns(i).dim,'b*');hold on;
end
xlabel('non-coverage');ylabel('cost');zlabel('number of sensors');
title('NSGA-II');
%% saving
folder='WSN';
saveas(f1,[p '/results images/' folder '/fullCov-SC-MOPSO-scenario-' num2str(Scenario) '.png']);
saveas(f2,[p '/results images/' folder '/randCov-SC-MOPSO-scenario-' num2str(Scenario) '.png']);
saveas(f3,[p '/results images/' folder '/fullCov-m-MOPSO-scenario-' num2str(Scenario) '.png']);
saveas(f4,[p '/results images/' folder '/randCov-m-MOPSO-scenario-' num2str(Scenario) '.png']);
saveas(f5,[p '/results images/' folder '/fullCov-MOPSO-scenario-' num2str(Scenario) '.png']);
saveas(f6,[p '/results images/' folder '/randCov-MOPSO-scenario-' num2str(Scenario) '.png']);
saveas(f7,[p '/results images/' folder '/fullCov-nsga2-scenario-' num2str(Scenario) '.png']);
saveas(f8,[p '/results images/' folder '/randCov-nsga2-scenario-' num2str(Scenario) '.png']);
saveas(f9,[p '/results images/' folder '/paretoWithLength-SC-MOPSO-scenario-' num2str(Scenario) '.png']);
saveas(f10,[p '/results images/' folder '/paretoWithLength-m-MOPSO-scenario-' num2str(Scenario) '.png']);
saveas(f11,[p '/results images/' folder '/paretoWithLength-MOPSO-scenario-' num2str(Scenario) '.png']);
saveas(f12,[p '/results images/' folder '/paretoWithLength-nsga2-scenario-' num2str(Scenario) '.png']);
%%
clc;
disp('save is done');
%% the end