clear;clc;
AddRequiredPaths;
popSize=200;
nobj=3;
lowerBound_pos=-600;
heigherBound_pos=600;
lowerBound_dim=1;
higherBound_dim=20;
numberOfIter=200;
RepSize=popSize;
pMutate=0.1;
mutationRatio=0.5;
nGrid=7;
alpha=0.1;
w=0.4;
for s=1:10
    objfun= @Rosen_Griewanks_Rastrigin;
    rng(s);
[t,paretoFront,paretoSet ,NC,classes,pop]=RunAlgorithm(s,objfun,popSize,nobj,RepSize,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,nGrid,alpha,numberOfIter,w,pMutate,mutationRatio);
 currentFolder=pwd;
path2 =[currentFolder '\Results_Math_Rosen_Griewanks_Rastrigin\scenario-' num2str(s) '\scenario-' num2str(s) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
objFcn=objfun;

       save([path2 '\scenario-' num2str(s) ] ,'t','paretoFront','paretoSet','NC','classes','popSize','pop','objFcn','higherBound_dim');
end