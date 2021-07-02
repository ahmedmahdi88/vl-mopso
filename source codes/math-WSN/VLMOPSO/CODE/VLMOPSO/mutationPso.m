function pos= mutationPso(pos,mutRatio,lowerBoundPos,higherBoundPos,sc)
L=length(pos);
numberOfMutated=round(L*mutRatio);
mutatedIndices= round(unifrnd(1,L,1,numberOfMutated));
while length(unique(mutatedIndices)) < length(mutatedIndices)
mutatedIndices= round(unifrnd(1,L,1,numberOfMutated));
end
% pos(mutatedIndices)=unifrnd(lowerBoundPos,higherBoundPos,1,numberOfMutated);
if rand<0.9
sc = sc*(higherBoundPos-lowerBoundPos);
 randNum = randn(1,numberOfMutated); % Normaly distribution
 pos(mutatedIndices) = pos(mutatedIndices)+sc.*randNum;
else
 pos(mutatedIndices) = unifrnd(lowerBoundPos,higherBoundPos,1,numberOfMutated);   
end
% sig = (higherBoundPos-lowerBoundPos)*0.1;
% else
% end
end