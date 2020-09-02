function [ind1,ind2]= Reconciliation(particle1,particle2)
particle1.x=particle1.x(particle1.x~=-1);
particle1.y=particle1.y(particle1.y~=-1);
particle2.x=particle2.x(particle2.x~=-1);
particle2.y=particle2.y(particle2.y~=-1);
m=min(length(particle1.x),length(particle2.x));
adjaMatrix=inf*ones(length(particle1.x(1:m)));  % initialize adjacancy matrix
% compute adjacency matrix  
for p1=1:length(particle1.x(1:m))
    tmpPoint1=[particle1.x(p1) particle1.y(p1)];
    for p2=1:length(particle2.x(1:m))
    tmpPoint2=[particle2.x(p2) particle2.y(p2)];
    adjaMatrix(p1,p2)=equlidianDist(tmpPoint1,tmpPoint2);
    end
end
%%%%%%%%%%%%%
ind1=1:length(particle1.x(1:m));
ind2=zeros(size(particle2.x(1:m)));
for i=1:length(ind2)
    [~,ind2(i)]=min(adjaMatrix(i,:));
    adjaMatrix(:,ind2(i))=inf;
end
end
