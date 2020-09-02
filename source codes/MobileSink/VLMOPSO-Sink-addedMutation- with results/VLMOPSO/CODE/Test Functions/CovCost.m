function f=CovCost(particlePos,A,b,a,m)
cov=[];
r=1;
W=10;H=10;
environment=1:A;
env=reshape(environment,W,H)';

env=[zeros(1,W);env;zeros(1,W)];
env=[zeros(H+2,1),env,zeros(H+2,1)];
[j,i]=ind2sub([W,H],particlePos(particlePos~=0));
i=i+1;
j=j+1;

% particlePos=reshape(particlePos,[length(i),length(j)]);
for ind=1:length(i)
coverage=[env(i(ind),j(ind)) (j(ind)-1+r <= W)*env(i(ind),j(ind)+r),(j(ind)-1-r >=1)*env(i(ind),j(ind)-r) ,(i(ind)-1+1<=H)*env(i(ind)+1,j(ind)),(i(ind)-1-1>=1)*env(i(ind)-1,j(ind))];
cov=[cov coverage];
end  
 cov(cov<1 | cov>(W*H) | cov==0)=[];
  cov=unique(cov);
  lenCov=length(cov);
f(1)=((A-lenCov)/A);
if(lenCov>100)
   pause(10);
end
f(2)= sum(b*ones(1,length(particlePos(particlePos~=0)))+a*ones(1,length(particlePos(particlePos~=0))).^m);
end