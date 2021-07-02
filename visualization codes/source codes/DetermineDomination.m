%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA121
% Project Title: Multi-Objective Particle Swarm Optimization (MOPSO)
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function pop=DetermineDomination(pop)

    nPop=size(pop,1);
    pop(:,end+1) = 0;

    
    for i=1:nPop-1
        for j=i+1:nPop
            
            if Dominates(pop(i,1:end-1),pop(j,1:end-1))
               pop(j,end)=1;
            end
            
            if Dominates(pop(j,1:end-1),pop(i,1:end-1))
               pop(i,end)=1;
            end
            
        end
    end

end