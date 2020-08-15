clear;clc;
AddRequiredPaths;
popSize=200;

lowerBound_pos=-600;
heigherBound_pos=600;
lowerBound_dim=1;
higherBound_dim=20;
numberOfIter=200;
RepSize=popSize;
p_mutation=0.1;
mutatedRatio=0.5;


nGrid=7;
alpha=0.1;
w=0.4;
for scenario=1:10
     nobj=3;
   objfun=@Rosen_Griewanks_Rastrigin;
rng(scenario);

[pop,t,population,maxEnhancementTimeOut,paretoFront,paretoSet ,NC, classes,v]=RunAlgorithmMoveToLowerClass(alpha,nGrid,RepSize,scenario,objfun,popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,numberOfIter,w,p_mutation,mutatedRatio);
 currentFolder=pwd;
path2 =[currentFolder '\Results_Math_Rosen_Griewanks_Rastrigin\scenario-' num2str(scenario) '\scenario-' num2str(scenario) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
objFcn=objfun;
       save([path2 '\scenario-' num2str(scenario) ] ,'t','paretoFront','paretoSet','NC','classes','maxEnhancementTimeOut','popSize','population','objFcn','higherBound_dim');
end