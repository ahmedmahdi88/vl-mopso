clear;clc;
AddRequiredPaths;
popSize=500;
nobjArr=[2 2 2 3 2 3 2 3 3 2];
nobjArr=2*ones(1,10);
lowerBound_pos=-5.12;
heigherBound_pos=5.12;
lowerBound_dim=1;
higherBound_dim=30;
numberOfIter=200;
RepSize=100;
p_mutation=0.1;
mutatedRatio=0.5;

objfunList={'Griewanks_Rastrigin','Griewanks_sphere','Rosen_Ackley','Rosen_Ackley_DRastrigin'...
    'Rosen_Griewanks' 'Rosen_Griewanks_Rastrigin' 'Rosen_sphere' 'sphere_Ackley_DRastrigin'...
    'sphere_Ackley_Rastrigin', 'Weierstrass_Griewanks'};
nGrid=7;
alpha=0.1;
w=0.4;
for scenario=1:10
     nobj=nobjArr(scenario);
   objfun=@Rosen_Rastrigin;
rng(scenario);
% popSize=round(unifrnd(100,100));
% enhancement_timeout=round(unifrnd(20,50));
% lowerBound_dim=round(unifrnd(1,1));
% higherBound_dim=round(unifrnd(lowerBound_dim,20));
[pop,t,population,maxEnhancementTimeOut,paretoFront,paretoSet ,NC, classes,v]=RunAlgorithmMoveToLowerClass(alpha,nGrid,RepSize,scenario,objfun,popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,numberOfIter,w,p_mutation,mutatedRatio); currentFolder=pwd;
path2 =[currentFolder '\Results_Math_Rosen_Rastrigin\scenario-' num2str(scenario) '\scenario-' num2str(scenario) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
objFcn=objfun;
       save([path2 '\scenario-' num2str(scenario) ] ,'t','paretoFront','paretoSet','NC','classes','maxEnhancementTimeOut','popSize','population','objFcn','higherBound_dim');
end