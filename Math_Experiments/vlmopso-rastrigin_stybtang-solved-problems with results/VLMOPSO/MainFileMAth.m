clear;clc;
AddRequiredPaths;
popSize=300;
lowerBound_pos=-5.12;
heigherBound_pos=5.12;
lowerBound_dim=1;
higherBound_dim=30;
numberOfIter=200;
RepSize=popSize;
p_mutation=0.1;
mutatedRatio=0.5;


nGrid=7;
alpha=0.1;
w=0.4;
for scenario=2:2
     nobj=2;
   objfun=@rastrigin_stybtang;
rng(scenario);

[pop,t,population,maxEnhancementTimeOut,paretoFront,paretoSet ,NC, classes,v]=RunAlgorithmMoveToLowerClass(alpha,nGrid,RepSize,scenario,objfun,popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,numberOfIter,w,p_mutation,mutatedRatio);
 currentFolder=pwd;
path2 =[currentFolder '\Results_Math_rastrigin_stybtang-pop=200\scenario-' num2str(scenario) '\scenario-' num2str(scenario) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
objFcn=objfun;
       save([path2 '\scenario-' num2str(scenario) ] ,'t','paretoFront','paretoSet','NC','classes','maxEnhancementTimeOut','popSize','population','objFcn','higherBound_dim');
end