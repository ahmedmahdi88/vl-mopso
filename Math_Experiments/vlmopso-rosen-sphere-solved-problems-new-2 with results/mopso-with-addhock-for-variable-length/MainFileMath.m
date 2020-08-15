clear;clc;
AddRequiredPaths;
popSize=500;
nobjArr=[2 2 2 3 2 3 2 3 3 2];
nobjArr=2*ones(1,10);
nobj=2;
posDim=10;
lowerBound_pos=-10;
heigherBound_pos=10;
lowerBound_dim=1;
higherBound_dim=30;
numberOfIter=200;
RepSize=100;
pMutate=0.1;
mutationRatio=0.5;
objfunList={'Griewanks_Rastrigin','Griewanks_sphere','Rosen_Ackley','Rosen_Ackley_DRastrigin'...
    'Rosen_Griewanks' 'Rosen_Griewanks_Rastrigin' 'Rosen_sphere' 'sphere_Ackley_DRastrigin'...
    'sphere_Ackley_Rastrigin', 'Weierstrass_Griewanks'};
objfunStr='@CovCost';
nGrid=7;
alpha=0.1;
w=0.4;
for s=1:10
    nobj=nobjArr(s);
    objfun= @Rosen_sphere;
% objfun=eval(objfunStr);
    rng(s);
%     popSize=round(unifrnd(200,200));
   
% lowerBound_dim=round(unifrnd(1,1));
% higherBound_dim=round(unifrnd(lowerBound_dim,20));
[t,paretoFront,paretoSet ,NC,classes,pop]=RunAlgorithm(s,objfun,popSize,nobj,RepSize,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,nGrid,alpha,numberOfIter,w,pMutate,mutationRatio);
 currentFolder=pwd;
path2 =[currentFolder '\Results_Math_Rosen_sphere\scenario-' num2str(s) '\scenario-' num2str(s) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
objFcn=objfun;

       save([path2 '\scenario-' num2str(s) ] ,'t','paretoFront','paretoSet','NC','classes','popSize','pop','objFcn','higherBound_dim');
end