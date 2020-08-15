function [rvp,isFixed]=RVP_CheckConstraints(rvp,sensorPos,covThreshold,DistThreShold,AddedSensorsThreshold,env,lowerBound_pos,heigherBound_pos,d)
isFixed=0;
tmp.x=rvp.x(1:d);
tmp.y=rvp.y(1:d);
cov=computeCov(tmp,env);
 while cov <covThreshold
     [tmp,nonCoveredSensors] = computeAddedSensors(tmp,sensorPos,DistThreShold);
rvpArr=[];
for i=1:length(tmp.x)
    rvpArr=[rvpArr tmp.numberOfAddedSensors(i)];
end
senArr=[];
for i=1:length(tmp.x)
    senArr=[senArr tmp.addedSensors(i).values];
    uniqSenArr=unique(senArr);
    [a,b]=hist(senArr,uniqSenArr);
end
[~,minR]=min(rvpArr);
[~,maxS]=max(a);
maxCoveredSensor=b(maxS);
rvpMaxSen=[];
for r=1:length(tmp.x)
    if any(ismember(tmp.addedSensors(r).values,maxCoveredSensor))
        rvpMaxSen=[rvpMaxSen r];
    end
end
% rvp.x
% rvp.y
% maxCoveredSensor
% rvp.addedSensors.values
% rvpArr
minRR=rvpArr(rvpMaxSen(1));
minR=rvpMaxSen(1);
% rvpArr
for i=1:length(tmp.x)
    if ismember(i,rvpMaxSen)
        if rvpArr(i)<minRR
            minRR=rvpArr(i);
            minR=i;
        end
    end
end
% select non covered sensor
nonCoveredSensor=0;
% while ismember(nonCoveredSensor,senArr) ||  nonCoveredSensor==0
%     nonCoveredSensor=randperm(length(sensorPos.x));
% end
% minR

nonCoveredSensors=find(nonCoveredSensors==0);
minR=find(tmp.numberOfAddedSensors==0);
minn=min(length(minR),length(nonCoveredSensors));
if minn~=0
for m=1:minn
     tmp.x(minR(m))=unifrnd(sensorPos.x(nonCoveredSensors(m))-(DistThreShold/2),sensorPos.x(nonCoveredSensors(m))+(DistThreShold/2));
     tmp.y(minR(m))=unifrnd(sensorPos.y(nonCoveredSensors(m))-(DistThreShold/2),sensorPos.y(nonCoveredSensors(m))+(DistThreShold/2));
end
else
[~,minR]=min(tmp.numberOfAddedSensors);
m=1;
tmp.x(minR(m))=unifrnd(sensorPos.x(nonCoveredSensors(m))-(DistThreShold/2),sensorPos.x(nonCoveredSensors(m))+(DistThreShold/2));
tmp.y(minR(m))=unifrnd(sensorPos.y(nonCoveredSensors(m))-(DistThreShold/2),sensorPos.y(nonCoveredSensors(m))+(DistThreShold/2));
end    

     tmp=checkXYBounds(tmp,lowerBound_pos,heigherBound_pos);
     tmp=checkBoundsSink(tmp,d,env);    
     cov=computeCov(tmp,env);
     isFixed=1;
 end
 rvp.x(1:d)=tmp.x(1:d);
  rvp.y(1:d)=tmp.y(1:d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
function [rvp,nonCoverdSensors] = computeAddedSensors(rvp,sensorPos,DistThreShold)
    rvp.numberOfAddedSensors=zeros(size(rvp.x));
    nonCoverdSensors=zeros(size(sensorPos.x));
for i=1:length(rvp.x)
    rvp.addedSensors(i).values=[];
    xr=rvp.x(i);
        yr=rvp.y(i);
        pr=[xr yr];
for s=1:length(sensorPos.x)  
        xs=sensorPos.x(s);
        ys=sensorPos.y(s);
        ps=[xs ys];
        if equlidianDist(pr,ps)<=DistThreShold
            rvp.addedSensors(i).values= [rvp.addedSensors(i).values s];
            rvp.numberOfAddedSensors(i)=rvp.numberOfAddedSensors(i)+1;
            nonCoverdSensors(s)=1;
        end
    end
 end
end