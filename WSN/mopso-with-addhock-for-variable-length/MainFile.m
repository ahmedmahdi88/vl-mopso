clear;clc;
AddRequiredPaths;
popSize=200;
nobjArr=[2 2 2 3 2 3 2 3 3 2];
nobj=2;
posDim=10;
lowerBound_pos=-600;
heigherBound_pos=600;
lowerBound_dim=1;
higherBound_dim=20;
numberOfIter=200;
RepSize=popSize;
objfunList={'Griewanks_Rastrigin','Griewanks_sphere','Rosen_Ackley','Rosen_Ackley_DRastrigin'...
    'Rosen_Griewanks' 'Rosen_Griewanks_Rastrigin' 'Rosen_sphere' 'sphere_Ackley_DRastrigin'...
    'sphere_Ackley_Rastrigin', 'Weierstrass_Griewanks'};
objfunStr='@CovCost';
nGrid=7;
alpha=0.1;
pMutate=0.1;
mutateRatio=0.5;
w=1;
for s=7:7
    nobj=nobjArr(s);
    objfun=eval(['@' objfunList{s}]);
% objfun=eval(objfunStr);
    rng(s);
%     popSize=round(unifrnd(200,200));
    RepSize=popSize;
% lowerBound_dim=round(unifrnd(1,1));
% higherBound_dim=round(unifrnd(lowerBound_dim,20));
[t,paretoFront,paretoSet ,NC,classes,pop]=RunAlgorithm(s,objfun,popSize,nobj,RepSize,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,nGrid,alpha,numberOfIter,w,pMutate,mutateRatio);
 currentFolder=pwd;
path2 =[currentFolder '\Results_pop100\scenario-' num2str(s) '\scenario-' num2str(s) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
objFcn=objfunList{s};

       save([path2 '\scenario-' num2str(s) ] ,'t','paretoFront','paretoSet','NC','classes','popSize','pop','objFcn');
end