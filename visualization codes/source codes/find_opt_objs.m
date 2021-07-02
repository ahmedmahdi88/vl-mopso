function optimal_objectives= find_opt_objs(paretoFront,paretoFrontvl,pno,paretoFrontwm,paretoFrontws,nobjArr)
ob1=[paretoFront(:,1);paretoFrontvl(:,1);pno(:,1);paretoFrontwm(:,1);paretoFrontws(:,1)];
ob2=[paretoFront(:,2);paretoFrontvl(:,2);pno(:,2);paretoFrontwm(:,2);paretoFrontws(:,2)];
if nobjArr(1)==3
    ob3=[paretoFront(:,3);paretoFrontvl(:,3);pno(:,3);paretoFrontwm(:,3);paretoFrontws(:,3)];
end
optimal_objectives=[min(ob1),min(ob2)];
if nobjArr(1)==3
    optimal_objectives=[min(ob1),min(ob2),min(ob3)];
end
end
