%% initialization
clear;clc;
%% adding required paths
AddRequiredPaths;
%% input params
popSize=300;
lowerBound_pos=0;
heigherBound_pos=1;
lowerBound_dims=[2*ones(1,9),1,2,2,2,2,1];
higherBound_dims=[20*ones(1,13),10,10];

numberOfIter=500;
RepSize=popSize;
pMutate=0;
mutationRatio=00;
nGrid=7;
alpha=0.1;
w=0.5;
Vmin=-0.1*(heigherBound_pos-lowerBound_pos);
Vmax=-Vmin;
%% objfunctions
%% objfunctions
objFuncs = {@MMF14,@MMF15,@MMF14_a,@MMF15_a,@MMF15_l,@MMF15_a_l,@MMF16_l1,...
    @MMF16_l2,@MMF16_l3,@FonsecaFleming_objfun,@TP_ZDT1_objfun,@TP_ZDT2_objfun,...
    @TP_ZDT3_objfun,@TP_ZDT6_objfun};
objFunsStrings = {'MMF14','MMF15','MMF14_a','MMF15_a','MMF15_l','MMF15_a_l',...
    'MMF16_l1','MMF16_l2','MMF16_l3','FonsecaFleming_objfun','TP_ZDT1_objfun',...
    'TP_ZDT2_objfun','TP_ZDT3_objfun','TP_ZDT6_objfun'};
nobjs = [2 2 2 2 2 3 3 3 3 2*ones(1,6)];
for of = 11:14
    nobj=nobjs(of);
    objfun= objFuncs{of};
    lowerBound_dim = lowerBound_dims(of);
    higherBound_dim = higherBound_dims(of);
    lowerBound_pos=0;
    heigherBound_pos=1;
     if of==10
        lowerBound_pos = -4;
        heigherBound_pos = 4;
    end
for s=1:10
    scenario = s;
    rng(s);
[t,paretoFront,paretoSet ,NC,classes,pop]=...
    RunAlgorithm(s,objfun,popSize,nobj,RepSize,lowerBound_pos,...
    heigherBound_pos,lowerBound_dim,higherBound_dim,nGrid,alpha,...
    numberOfIter,w,pMutate,mutationRatio,Vmin,Vmax);
 currentFolder=pwd;
path2 =[cd '/../../../results/' objFunsStrings{of} '/MOPSO/scenario-' num2str(scenario) '\scenario-' num2str(scenario) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
objFcn=objfun;
save([path2 '\scenario-' num2str(s) ] ,'t','paretoFront','paretoSet','NC','classes','popSize','pop','objFcn','higherBound_dim');
end
end