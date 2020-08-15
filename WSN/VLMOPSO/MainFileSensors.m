 clear;clc;
AddRequiredPaths;
popSize=150;
nobj=2;
minNumOfParticles=5;
% nobjArr=[2 2 2 3 2 3 2 3 3 2];
lowerBound_pos=1;
heigherBound_pos=100;
lowerBound_dim=20;
higherBound_dim=50;
numberOfIter=100;
RepSize=popSize;
% objfunList={'Griewanks_Rastrigin','Griewanks_sphere','Rosen_Ackley','Rosen_Ackley_DRastrigin'...
%     'Rosen_Griewanks' 'Rosen_Griewanks_Rastrigin' 'Rosen_sphere' 'sphere_Ackley_DRastrigin'...
%     'sphere_Ackley_Rastrigin', 'Weierstrass_Griewanks'};
nGrid=7;
alpha=0.1;
w=0.4;
for scenario=1:4
%      nobj=nobjArr(scenario);
   objfun=eval(['@CovCost']);
rng(scenario);
% popSize=round(unifrnd(150,150));
% enhancement_timeout=round(unifrnd(20,50));
% lowerBound_dim=round(unifrnd(1,1));
% higherBound_dim=round(unifrnd(lowerBound_dim,20));
[t,population,enhancement_timeout,paretoFront,paretoSet ,NC,classes,v]=RunAlgorithmSensors2(scenario,objfun,popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,numberOfIter,w,minNumOfParticles);
 currentFolder=pwd;
path2 =[currentFolder '\Results_Sensors_withTime\scenario-' num2str(scenario) '\scenario-' num2str(scenario) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
% objFcn=objfunList{scenario};
       save([path2 '\scenario-' num2str(scenario) ] ,'paretoFront','paretoSet','NC','classes','enhancement_timeout','popSize','population','t');
end