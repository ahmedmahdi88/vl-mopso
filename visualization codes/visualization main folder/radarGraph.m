p=pwd;
p(p=='\')='/';
addpath([p '/..']);
%% find mean of HV 
if nobjs(problemNumber)==2
for Scenario=1:10
    AddRequiredPaths;
   v_MOmut(Scenario) = HyperVolume(paretoFront);
    v_VL(Scenario) = HyperVolume(paretoFrontvl);
    v_MO(Scenario) = HyperVolume(paretoFrontwm);
    v_WS(Scenario) = HyperVolume(paretoFrontws);
    v_N2(Scenario) = HyperVolume(pno);
end
else
    for Scenario=1:10
    AddRequiredPaths;
     tmp = [paretoFront(:,1),paretoFront(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretoFront(:,1),paretoFront(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretoFront(:,2),paretoFront(:,3)];
        hv3 = HyperVolume(tmp);
        hv = mean([hv1 hv2 hv3]);
        %%%
   v_MOmut(Scenario) = hv;
   tmp = [paretoFrontvl(:,1),paretoFrontvl(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretoFrontvl(:,1),paretoFrontvl(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretoFrontvl(:,2),paretoFrontvl(:,3)];
        hv3 = HyperVolume(tmp);
        hvvl = mean([hv1 hv2 hv3]);
        %%% 
    v_VL(Scenario) = hvvl;
    tmp = [paretoFrontwm(:,1),paretoFrontwm(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretoFrontwm(:,1),paretoFrontwm(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretoFrontwm(:,2),paretoFrontwm(:,3)];
        hv3 = HyperVolume(tmp);
        hvwm = mean([hv1 hv2 hv3]);
         %%% 
    v_MO(Scenario) = hvwm;
    tmp = [paretoFrontws(:,1),paretoFrontws(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [paretoFrontws(:,1),paretoFrontws(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [paretoFrontws(:,2),paretoFrontws(:,3)];
        hv3 = HyperVolume(tmp);
         hvws= mean([hv1 hv2 hv3]);
         %%% 
    v_WS(Scenario) = hvws;
    %%%
     tmp = [pno(:,1),pno(:,2)];
       hv1 = HyperVolume(tmp);
       tmp = [pno(:,1),pno(:,3)];
       hv2 = HyperVolume(tmp);
        tmp = [pno(:,2),pno(:,3)];
        hv3 = HyperVolume(tmp);
        hvn2 = mean([hv1 hv2 hv3]); 
    v_N2(Scenario) = hvn2;

    end      
end
meanVm=mean(v_MO);
meanVmmut=mean(v_MOmut);
meanVvl=mean(v_VL);
meanVn2=mean(v_N2);
meanVWS=mean(v_WS);

hv=[meanVm meanVmmut meanVvl meanVn2 meanVWS];
hv=hv./max(hv);
%%%%%%%%%%%%
%% find mean of IRGD 
for Scenario=1:10
    AddRequiredPaths;
    trueParetoFront=find_opt_objs(paretoFront,paretoFrontvl,pno,paretoFrontwm,paretoFrontws,nobjArr);
    R_MOmut(Scenario) = GenerationalDistance(paretoFront,trueParetoFront,2);
    R_VL(Scenario) = GenerationalDistance(paretoFrontvl,trueParetoFront,2);
    R_MO(Scenario) = GenerationalDistance(paretoFrontwm,trueParetoFront,2);
    R_N2(Scenario) = GenerationalDistance(pno,trueParetoFront,2);
        R_WS(Scenario) = GenerationalDistance(paretoFrontws,trueParetoFront,2);
end
meanDm=mean(R_MO);
meanDmmut=mean(R_MOmut);
meanDvl=mean(R_VL);
meanDn2=mean(R_N2);
meanDws=mean(R_WS);

rgd=1./[meanDm meanDmmut meanDvl meanDn2 meanDws];
rgd=rgd./max(rgd);
%%%%%%%%%%%%%%%%%%%%%%%%
%% find mean of NDS 
for Scenario=1:10
    AddRequiredPaths;
   nds_MOmut(Scenario) = length(paretoFront);
    nds_VL(Scenario) = length(paretoFrontvl);
    nds_MO(Scenario) = length(paretoFrontwm);
    nds_N2(Scenario) = length(pno);
    nds_ws(Scenario) = length(paretoFrontws);
end
meanNm=mean(nds_MO);
meanNmmut=mean(nds_MOmut);
meanNvl=mean(nds_VL);
meanNn2=mean(nds_N2);
meanNws=mean(nds_ws);

nds=[meanNm meanNmmut meanNvl meanNn2 meanNws];
nds=nds./max(nds);
%%%%%%%%%%%%%%%%%%%%
%% find mean of delata 
if nobjs(problemNumber)==2
for Scenario=1:10
    AddRequiredPaths;
   dt_MOmut(Scenario) = DeltaQuotMetric(paretoFront);
    dt_VL(Scenario) = DeltaQuotMetric(paretoFrontvl);
    dt_MO(Scenario) = DeltaQuotMetric(paretoFrontwm);
    dy_N2(Scenario) = DeltaQuotMetric(pno);
    dt_ws(Scenario) = DeltaQuotMetric(paretoFrontws);
end
meanDTm=mean(dt_MO);
meanDTmmut=mean(dt_MOmut);
meanDTvl=mean(dt_VL);
meanDTn2=mean(dy_N2);
meanDTws=mean(dt_ws);

delta=[meanDTm meanDTmmut meanDTvl meanDTn2 meanDTws];
delta=1./delta;
delta=delta./max(delta);
end
% %%%%%%%%%%%%%
%%
if nobjs(problemNumber)==2
    P=[[rgd(1) hv(1) nds(1) delta(1) ] ; [rgd(2) hv(2) nds(2) delta(2)]; 
    [rgd(3) hv(3) nds(3) delta(3)] ; [rgd(4) hv(4) nds(4) delta(4)];...
    [rgd(5) hv(5) nds(5) delta(5)]];
axes={'IRGD','HV','NDS','IDelta'};
else
P=[[rgd(1) hv(1) nds(1) ] ; [rgd(2) hv(2) nds(2) ]; 
    [rgd(3) hv(3) nds(3) ] ; [rgd(4) hv(4) nds(4)]; [rgd(5) hv(5) nds(5) ]];
axes={'IRGD','HV','NDS'};
end
titl='mean of measures within 10 Scenarios';

frg=styledRadar(P,{'MOPSO','m-MOPSO','SC-MOPSO','NSGA-II','WS-VLPSO'},axes,titl,'on')
%% saving
if problemNumber==1
    folder='WSN';
else
    folder=['math/' problems{problemNumber}];
end
saveas(frg,[p '/results images/' folder '/radarGraph.png']);

