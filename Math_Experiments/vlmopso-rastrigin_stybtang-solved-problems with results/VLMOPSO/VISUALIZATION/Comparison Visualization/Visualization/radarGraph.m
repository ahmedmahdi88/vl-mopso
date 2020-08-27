clear;clc;close all;
%% find mean of HV 
for Scenario=1:10
    AddRequiredPaths;
   v_MOmut(Scenario) = HyperVolume(paretoFront);
    v_VL(Scenario) = HyperVolume(paretoFrontvl);
    v_MO(Scenario) = HyperVolume(paretoFrontwm);
    v_N2(Scenario) = HyperVolume(pno);
end
meanVm=mean(v_MO);
meanVmmut=mean(v_MOmut);
meanVvl=mean(v_VL);
meanVn2=mean(v_N2);
hv=[meanVm meanVmmut meanVvl meanVn2];
hv=hv./max(hv);
%%%%%%%%%%%%
%% find mean of IRGD 
for Scenario=1:10
    AddRequiredPaths;
    trueParetoFront=find_opt_objs(Scenario);
    R_MOmut(Scenario) = GenerationalDistance(paretoFront,trueParetoFront,2);
    R_VL(Scenario) = GenerationalDistance(paretoFrontvl,trueParetoFront,2);
    R_MO(Scenario) = GenerationalDistance(paretoFrontwm,trueParetoFront,2);
    R_N2(Scenario) = GenerationalDistance(pno,trueParetoFront,2);
end
meanDm=mean(R_MO);
meanDmmut=mean(R_MOmut);
meanDvl=mean(R_VL);
meanDn2=mean(R_N2);
rgd=1./[meanDm meanDmmut meanDvl meanDn2];
rgd=rgd./max(rgd);
%%%%%%%%%%%%%%%%%%%%%%%%
%% find mean of NDS 
for Scenario=1:10
    AddRequiredPaths;
   nds_MOmut(Scenario) = length(paretoFront);
    nds_VL(Scenario) = length(paretoFrontvl);
    nds_MO(Scenario) = length(paretoFrontwm);
    nds_N2(Scenario) = length(pno);
end
meanNm=mean(nds_MO);
meanNmmut=mean(nds_MOmut);
meanNvl=mean(nds_VL);
meanNn2=mean(nds_N2);
nds=[meanNm meanNmmut meanNvl meanNn2];
nds=nds./max(nds);
%%%%%%%%%%%%%%%%%%%%
%% find mean of delata 
for Scenario=1:10
    AddRequiredPaths;
   dt_MOmut(Scenario) = DeltaQuotMetric(paretoFront);
    dt_VL(Scenario) = DeltaQuotMetric(paretoFrontvl);
    dt_MO(Scenario) = DeltaQuotMetric(paretoFrontwm);
    dy_N2(Scenario) = DeltaQuotMetric(pno);
end
meanDTm=mean(dt_MO);
meanDTmmut=mean(dt_MOmut);
meanDTvl=mean(dt_VL);
meanDTn2=mean(dy_N2);
delta=[meanDTm meanDTmmut meanDTvl meanDTn2];
delta=1./delta;
delta=delta./max(delta);
%%%%%%%%%%%%%
%%
P=[[rgd(1) hv(1) nds(1) delta(1)] ; [rgd(2) hv(2) nds(2) delta(2)]; 
    [rgd(3) hv(3) nds(3) delta(3)] ; [rgd(4) hv(4) nds(4) delta(4)]];
titl='mean of measures within 10 Scenarios';
frg=styledRadar(P,{'MOPSO','m-MOPSO','SC-MOPSO','NSGA-II'},{'IRGD','HV','NDS','IDelta'},titl,'on')
%% saving
cf=pwd;
cf(cf=='\')='/';
saveas(frg,[cf '/images/rosen-levy-radarGraph.png']);

