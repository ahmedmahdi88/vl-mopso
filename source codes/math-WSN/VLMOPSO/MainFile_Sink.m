clear;clc;
AddRequiredPaths;
popSize=300;
nobj=2;
lowerBound_pos=0;
heigherBound_pos=19.9;
lowerBound_dim=10;
higherBound_dim=30;
numberOfIter=200;
% RepSize=popSize;
% nGrid=7;
% alpha=0.1;
w=0.4;
objfun=@MobileSinkObjFun;
nSensors=15;
for scenario=1:10
%      nobj=nobjArr(scenario);
rng(scenario);
% popSize=round(unifrnd(150,150));
% enhancement_timeout=round(unifrnd(20,50));
% lowerBound_dim=round(unifrnd(1,1));
% higherBound_dim=round(unifrnd(lowerBound_dim,20));
[pop,env,population,enhancement_timeout,paretoFront,paretoSet ,NC,classes,v]=RunAlgorithmSink(nSensors,scenario,objfun,popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,higherBound_dim,numberOfIter,w);
 currentFolder=pwd;
path2 =[currentFolder '\Results_Sink\scenario-' num2str(scenario) '\scenario-' num2str(scenario) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
% objFcn=objfunList{scenario};
       save([path2 '\scenario-' num2str(scenario) ] ,'paretoFront','paretoSet','NC','classes','enhancement_timeout','popSize','population','env','pop');
end