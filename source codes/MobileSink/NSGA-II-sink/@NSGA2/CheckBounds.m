function individual = CheckBounds(moga,dim,individual)
tmpx=individual.x(1:dim);
tmpy=individual.y(1:dim);
tmpx(tmpx<moga.lowerBounds)=moga.lowerBounds;
tmpy(tmpy<moga.lowerBounds)=moga.lowerBounds;
tmpx(tmpx>moga.upperBounds)=moga.upperBounds;
tmpy(tmpy>moga.upperBounds)=moga.upperBounds;
individual.x(1:dim) = tmpx;
individual.y(1:dim) = tmpy;
end

