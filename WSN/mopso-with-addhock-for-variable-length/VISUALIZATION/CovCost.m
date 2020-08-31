function f=CovCost(particlePos,A,b,a,m)
cov=[];
r=1;
W=10;H=10;
for sen=1:length(particlePos)
coverage=[particlePos particlePos+r particlePos-r particlePos+W particlePos-W];
cov=[cov coverage];
end  
 cov(cov<1 | cov>(W*H))=[];
  cov=unique(cov);
  lenCov=length(cov);
f(1)=((A-lenCov)/A);
if(lenCov>100)
   pause(10);
end
f(2)= sum(b*ones(1,length(particlePos(particlePos~=0)))+a*ones(1,length(particlePos(particlePos~=0))).^m);
end