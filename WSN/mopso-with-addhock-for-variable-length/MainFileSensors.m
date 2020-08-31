clear;clc;
AddRequiredPaths;
popSize=150;
% nobjArr=[2 2 2 3 2 3 2 3 3 2];
nobj=2;
posDim=10;
lowerBound_pos=1;
heigherBound_pos=100;
lowerBound_dim=20;
higherBound_dim=50;
numberOfIter=100;
RepSize=popSize;
% objfunList={'Griewanks_Rastrigin','Griewanks_sphere','Rosen_Ackley','Rosen_Ackley_DRastrigin'...
%     'Rosen_Griewanks' 'Rosen_Griewanks_Rastrigin' 'Rosen_sphere' 'sphere_Ackley_DRastrigin'...
%     'sphere_Ackley_Rastrigin', 'Weierstrass_Griewanks'};
objfunStr='@CovCost';
objfun=@CovCost;
nGrid=7;plot(paretoFront(:,1),paretoFront(:,2),'bP');hold on;
alpha=0.1;
w=0.4;
mutProb=0.1;
mutRatio=0.5;
for s=2:10
%     nobj=nobjArr(s);
%     objfun=eval(['@' objfunList{s}]);
% objfun=eval(objfunStr);
    rng(s);
%     popSize=round(unifrnd(100,100));
    RepSize=popSize;

[t,paretoFront,paretoSet ,NC,classes,pop]=RunAlgorithmSensors(s,objfun,popSize,nobj,RepSize,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,nGrid,alpha,numberOfIter,w,mutProb,mutRatio);
 currentFolder=pwd;
path2 =[currentFolder '\Results_Sensors_mut\scenario-' num2str(s) '\scenario-' num2str(s) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
% objFcn=objfunList{s};

       save([path2 '\scenario-' num2str(s) ] ,'paretoFront','paretoSet','NC','classes','popSize','pop','t');
end