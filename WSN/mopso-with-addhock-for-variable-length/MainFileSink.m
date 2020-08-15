clear;clc;
AddRequiredPaths;
popSize=200;
nobj=2;
lowerBound_pos=0;
heigherBound_pos=19.9;
lowerBound_dim=9;
higherBound_dim=20;
numberOfIter=200;
RepSize=100;
nGrid=7;
alpha=0.1;
w=0.4;
objfun=@MobileSinkObjFun;
nSensors=15;
for scenario=1:1
%      nobj=nobjArr(scenario);
rng(scenario);
% popSize=round(unifrnd(150,150));
% enhancement_timeout=round(unifrnd(20,50));
% lowerBound_dim=round(unifrnd(1,1));
% higherBound_dim=round(unifrnd(lowerBound_dim,20));

[pop,env,paretoFront,paretoSet ,NC,classes]=RunAlgorithmSink(nSensors,scenario,objfun,popSize,nobj,RepSize,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,nGrid,alpha,numberOfIter,w);
 currentFolder=pwd;
path2 =[currentFolder '\Results_Sink\scenario-' num2str(scenario) '\scenario-' num2str(scenario) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
% objFcn=objfunList{scenario};
       save([path2 '\scenario-' num2str(scenario) ] ,'paretoFront','paretoSet','NC','classes','popSize','env','pop');
end
