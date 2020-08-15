clear;clc;
AddRequiredPaths;
popSize=50;
nobjArr=[2 2 2 3 2 3 2 3 3 2];
lowerBound_pos=-600;
heigherBound_pos=600;
lowerBound_dim=1;
higherBound_dim=5;
numberOfIter=200;
RepSize=popSize;
p_mutation=0.1;
mutatedRatio=0.5;

objfunList={'Griewanks_Rastrigin','Griewanks_sphere','Rosen_Ackley','Rosen_Ackley_DRastrigin'...
    'Rosen_Griewanks' 'Rosen_Griewanks_Rastrigin' 'Rosen_sphere' 'sphere_Ackley_DRastrigin'...
    'sphere_Ackley_Rastrigin', 'Weierstrass_Griewanks'};
nGrid=7;
alpha=0.1;
w=0.4;
for scenario=[1:1]
     nobj=nobjArr(scenario);
   objfun=eval(['@' objfunList{scenario}]);
rng(scenario);
% popSize=round(unifrnd(100,100));
% enhancement_timeout=round(unifrnd(20,50));
% lowerBound_dim=round(unifrnd(1,1));
% higherBound_dim=round(unifrnd(lowerBound_dim,20));
[t,population,enhancement_timeout,paretoFront,paretoSet ,NC,classes,v]=RunAlgorithmMoveToLowerClass(alpha,nGrid,RepSize,scenario,objfun,popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,numberOfIter,w,p_mutation,mutatedRatio);
 currentFolder=pwd;
path2 =[currentFolder '\Results-maxLen=20-allowTravellingToLowerClass\scenario-' num2str(scenario) '\scenario-' num2str(scenario) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
objFcn=objfunList{scenario};
       save([path2 '\scenario-' num2str(scenario) ] ,'t','paretoFront','paretoSet','NC','classes','enhancement_timeout','popSize','population','objFcn');
end