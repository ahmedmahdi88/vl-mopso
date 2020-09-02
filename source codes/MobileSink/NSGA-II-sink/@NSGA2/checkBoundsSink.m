function pos=checkBoundsSink(sensorPos,dim,env)
A=19.9;
duplicate_ind=[];


sensorsPos=[sensorPos];
amb=(sensorsPos.x(1:dim).^2+sensorsPos.y(1:dim).^2);

while length(unique(amb))~=length(amb) 
   [~, ind] = unique(amb);
 duplicate_ind = [setdiff(1:length(amb), ind)];
%  duplicate_ind=unique(duplicate_ind);
    sensorsPos.x(duplicate_ind)=(unifrnd(0,A,1,length(duplicate_ind)));
    sensorsPos.y(duplicate_ind)=(unifrnd(0,A,1,length(duplicate_ind)));
    amb=(sensorsPos.x(1:dim).^2+sensorsPos.y(1:dim).^2);

end

pos=sensorsPos;
end