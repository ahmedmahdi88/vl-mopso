%% initialization
clear;clc;close all;
%% adding required paths
AddRequiredPaths;
%% input parameters
popSize=300;
lowerBound_pos=0;
heigherBound_pos=1;
Vmin=-0.1*(heigherBound_pos-lowerBound_pos);
Vmax=-Vmin;
lowerBound_dims=[2*ones(1,9),1,2,2,2,2,1];
higherBound_dims=[20*ones(1,13),10,10];
numberOfIter=500;
RepSize=popSize;
p_mutation=1;
mutatedRatio=0.5;
nGrid=7;
alpha=0.1; 
w=0.5;
scale = 0.1;
shrink = 0.5;
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
    if of==10
        lowerBound_pos = -4;
        heigherBound_pos = 4;
    else
        lowerBound_pos=0;
        heigherBound_pos=1;
    end
for scenario=1:10
rng(scenario);
[pop,t,population,maxEnhancementTimeOut,paretoFront,paretoSet ,NC, classes,v]...
    =RunAlgorithmMoveToLowerClass(alpha,nGrid,RepSize,scenario,objfun,...
    popSize,nobj,lowerBound_pos,heigherBound_pos,lowerBound_dim,...
    higherBound_dim,numberOfIter,w,p_mutation,mutatedRatio,Vmin,Vmax,scale,shrink);
%  currentFolder=pwd;
path2 =[cd '/../../../results/' objFunsStrings{of} '/VLMOPSO/scenario-' num2str(scenario) '\scenario-' num2str(scenario) '.mat' ];
if ~exist(path2, 'dir')
       mkdir(path2)
end
objFcn=objfun;
       save([path2 '\scenario-' num2str(scenario) ] ,'t','paretoFront','paretoSet','NC','classes','maxEnhancementTimeOut','popSize','population','objFcn','higherBound_dim');
end
end