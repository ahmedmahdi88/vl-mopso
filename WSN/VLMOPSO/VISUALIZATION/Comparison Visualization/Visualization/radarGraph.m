clear;clc;close all;
%% find mean of HV 
for Scenario=1:10
    AddRequiredPaths;
   v_MOmut(Scenario) = HyperVolume(paretoFront);
    v_VL(Scenario) = HyperVolume(paretoFrontvl);
    v_N2(Scenario) = HyperVolume(pno);
end
meanVmmut=mean(v_MOmut);
meanVvl=mean(v_VL);
meanVn2=mean(v_N2);
hv=[ meanVmmut meanVvl meanVn2];
hv=hv./max(hv);
%%%%%%%%%%%%
%% find mean of IRGD 
for Scenario=1:10
    AddRequiredPaths;
    trueParetoFront=find_opt_objs(Scenario);
    R_MOmut(Scenario) = GenerationalDistance(paretoFront,trueParetoFront,2);
    R_VL(Scenario) = GenerationalDistance(paretoFrontvl,trueParetoFront,2);
    R_N2(Scenario) = GenerationalDistance(pno,trueParetoFront,2);
end
meanDmmut=mean(R_MOmut);
meanDvl=mean(R_VL);
meanDn2=mean(R_N2);
rgd=1./[ meanDmmut meanDvl meanDn2];
rgd=rgd./max(rgd);
%%%%%%%%%%%%%%%%%%%%%%%%
%% find mean of NDS 
for Scenario=1:10
    AddRequiredPaths;
   nds_MOmut(Scenario) = length(paretoFront);
    nds_VL(Scenario) = length(paretoFrontvl);
    nds_N2(Scenario) = length(pno);
end
meanNmmut=mean(nds_MOmut);
meanNvl=mean(nds_VL);
meanNn2=mean(nds_N2);
nds=[ meanNmmut meanNvl meanNn2];
nds=nds./max(nds);
%%%%%%%%%%%%%%%%%%%%
%% find mean of delata 
for Scenario=1:10
    AddRequiredPaths;
   dt_MOmut(Scenario) = DeltaQuotMetric(paretoFront);
    dt_VL(Scenario) = DeltaQuotMetric(paretoFrontvl);
    dy_N2(Scenario) = DeltaQuotMetric(pno);
end
meanDTmmut=mean(dt_MOmut);
meanDTvl=mean(dt_VL);
meanDTn2=mean(dy_N2);
delta=[ meanDTmmut meanDTvl meanDTn2];
delta=1./delta;
delta=delta./max(delta);
%%%%%%%%%%%%%
%%
P=[[rgd(1) hv(1) nds(1) delta(1)] ; [rgd(2) hv(2) nds(2) delta(2)]; 
    [rgd(3) hv(3) nds(3) delta(3)] ];
titl='mean of measures within 10 Scenarios';
frg=styledRadar(P,{'MOPSO','SC-MOPSO','NSGA-II'},{'IRGD','HV','NDS','IDelta'},titl,'on')
%% saving
cf=pwd;
cf(cf=='\')='/';
saveas(frg,[cf '/images/rosen-levy-radarGraph.png']);

