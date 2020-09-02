clear;clc;
AddRequiredPaths;
popSize=2;

lowerBound_pos=-100;
heigherBound_pos=100;
lowerBound_dim=1;
higherBound_dim=35;
numberOfIter=200;
RepSize=popSize;
p_mutation=0.1;
mutatedRatio=0.5;


nGrid=7;
alpha=0.1;
w=0.4;
for scenario=1:10
     nobj=2;
   objfun=@sphere_stybtang;
rng(scenario);

[t,population,enhancement_timeout,paretoFront,paretoSet ,NC,classes,v]=RunAlgorithmMoveToLowerClass(alpha,nGrid,RepSize,scenario,objfun,popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,numberOfIter,w,p_mutation,mutatedRatio);
 currentFolder=pwd;
path2 =[currentFolder '\Results_Math_sphere_stybtang\scenario-' num2str(scenario) '\scenario-' num2str(scenario) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
objFcn=objfun;
       save([path2 '\scenario-' num2str(scenario) ] ,'t','paretoFront','paretoSet','NC','classes','enhancement_timeout','popSize','population','objFcn','higherBound_dim');
end