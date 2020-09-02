function [rvp,isFixed]=RVP_CheckConstraints(rvp,sensorPos,covThreshold,DistThreShold,AddedSensorsThreshold,env,lowerBound_pos,heigherBound_pos)
rvp.addedSensors=zeros(size(rvp.x));
rvp = computeAddedSensors(rvp,sensorPos,DistThreShold);

isFixed=0;
cov=computeCov(rvp,env);
 while cov <covThreshold
     for i=1:length(rvp.x)
         if rvp.addedSensors(i)<AddedSensorsThreshold
             sen=randperm(length(sensorPos.x),1);
             rndx=unifrnd(sensorPos.x(sen)-DistThreShold,sensorPos.x(sen)+DistThreShold);
             rndy=unifrnd(sensorPos.y(sen)-DistThreShold,sensorPos.y(sen)+DistThreShold);
% rndx=unifrnd(min(sensorPos.x),max(sensorPos.x));
% rndy=unifrnd(min(sensorPos.y),max(sensorPos.y));
             rvp.x(i)=rndx(1);
             rvp.y(i)=rndy(1);
         end
     end
     rvp=computeAddedSensors(rvp,sensorPos,DistThreShold);
     rvp=checkXYBounds(rvp,lowerBound_pos,heigherBound_pos);
     rvp=checkBoundsSink(rvp,env);
     cov=computeCov(rvp,env);
     isFixed=1;
 end
end
function rvp = computeAddedSensors(rvp,sensorPos,DistThreShold)
rvp.addedSensors=zeros(size(rvp.x));
 for i=1:length(rvp.x)
    for s=1:length(sensorPos.x)
        xr=rvp.x(i);
        yr=rvp.y(i);
        pr=[xr yr];
        xs=sensorPos.x(s);
        ys=sensorPos.y(s);
        ps=[xs ys];
        if equlidianDist(pr,ps)<=DistThreShold
            rvp.addedSensors(i)=rvp.addedSensors(i)+1;
        end
    end
 end
end