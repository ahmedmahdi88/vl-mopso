clc;
clear;
close all
%% input params
lowerBound_dim = 2;
higherBound_dim = 20;
nvar    = higherBound_dim;
lowerBound_pos = 0;
higherBound_pos = 1;

npop    = 50;
w       = 1;

maxit   = 200;
wdamp   = 0.99;
c1      = 2;
c2      = 2;
xmin(1) = lowerBound_pos;
xmax(1) = higherBound_pos;
xmin(2:nvar) = repmat(xmin(1), 1, nvar - 1);
xmax(2:nvar) = repmat(xmax(1), 1, nvar - 1);
dx             = xmax - xmin;
vmax           = 0.05 * dx;
%% problems setting
addpath([cd '/../VLMOPSO/CODE/new math functions']);
objFuncs = {@MMF14,@MMF15,@MMF14_a,@MMF15_a,@MMF15_l,@MMF15_a_l,@MMF16_l1,...
    @MMF16_l2,@MMF16_l3};
objFunsStrings = {'MMF14','MMF15','MMF14_a','MMF15_a','MMF15_l','MMF15_a_l',...
    'MMF16_l1','MMF16_l2','MMF16_l3'};
nobjs = [2 2 2 2 2 3 3 3 3];
for of = 1:9
    nObj=nobjs(of);
    Fitness= objFuncs{of};
    for scenario=1:10
        tic
        savePath = [cd '/../../../results/' objFunsStrings{of} '/WS-VLPSO/'];
        if ~exist(savePath, 'dir')
            mkdir(savePath)
        end
        
        rng(scenario);
        %% pre-initialization
        empty_particle.position  = [];
        empty_particle.velocity  = [];
        empty_particle.cost      = [];
        empty_particle.pbest     = [];
        empty_particle.pbestcost = [];
        empty_particle.nvar      = [];
        empty_particle.pnvar     = [];
        
        particle      = repmat(empty_particle,npop,1);
        gbest         = 100*ones(maxit,nvar);
        seperatedCosts = zeros(npop,nObj);
        gbestcost     = zeros(maxit,1);
        gnvar         = zeros(maxit,1);
        meanfit       = zeros(maxit,1);
        Temp1particle = zeros(1,nvar); % The initial nvar is the maximom value of the first dimension
        Temp1velocity = zeros(1,nvar);
        Temp2particle = zeros(1,nvar);
        Temp2velocity = zeros(1,nvar);
        %% initialization
        gbestcost(1) = inf;
        for i=1:npop
            posDim = round(unifrnd(lowerBound_dim,higherBound_dim));
            particle(i).nvar = posDim;
            particle(i).position = unifrnd(lowerBound_pos,higherBound_pos,1,posDim);
            seperatedCosts(i,:) = Fitness(particle(i).position);
            particle(i).cost = sum((1/nObj).*seperatedCosts(i,:));
            particle(i).velocity = zeros(1,particle(i).nvar);
            particle(i).pnvar     = particle(i).nvar;
            particle(i).pbest     = particle(i).position;
            particle(i).pbestcost = particle(i).cost;
            if particle(i).pbestcost < gbestcost(1)
                gnvar(1)                 = particle(i).nvar;
                gbest(1,1:gnvar(1))     = particle(i).pbest;
                gbest(1,gnvar(1)+1:end) = 100;
                gbestcost(1)             = particle(i).pbestcost;
            end
        end
        %% start iterations
        for it = 1:maxit
            if it==1
                gbestcost(it) = gbestcost(1);
            else
                gbestcost(it) = gbestcost(it-1);
                gnvar(it) = gnvar(it-1);
                gbest(it,1:gnvar(it))     = gbest(it-1,1:gnvar(it));
            end
            for i = 1:npop
                
                dif3          = particle(i).pnvar - particle(i).nvar;
                Temp1particle = particle(i).position;
                Temp1velocity = particle(i).velocity;
                
                
                if dif3 ~= 0
                    if dif3 < 0
                        Temp1particle = Temp1particle(1:particle(i).pnvar);
                        Temp1velocity = Temp1velocity(1:particle(i).pnvar);
                    else %dif3 > 0
                        Temp1particle(particle(i).nvar+1:particle(i).nvar+dif3)...
                            = xmin(1:1+dif3-1) + (xmax(1:1+dif3-1) - xmin(1:1+dif3-1)) .* rand(1,dif3);
                        Temp1velocity(particle(i).nvar+1:particle(i).nvar+dif3)...
                            = min(max(rand(1,dif3),-vmax(1:1+dif3-1)),vmax(1:1+dif3-1));
                    end
                end
                
                
                dif4          = gnvar(it) - particle(i).nvar;
                Temp2particle = particle(i).position;
                Temp2velocity = particle(i).velocity;
                
                if dif4 ~= 0
                    if dif4 < 0
                        Temp2particle = Temp2particle(1:gnvar(it));
                        Temp2velocity = Temp2velocity(1:gnvar(it));
                    else %dif4 > 0
                        Temp2particle(particle(i).nvar+1:particle(i).nvar+dif4)...
                            = xmin(1:1+dif4-1) + (xmax(1:1+dif4-1) - xmin(1:1+dif4-1)) .* rand(1,dif4);
                        Temp2velocity(particle(i).nvar+1:particle(i).nvar+dif4)...
                            = min(max(rand(1,dif4),-vmax(1:1+dif4-1)),vmax(1:1+dif4-1));
                    end
                end
                Temp3pbest = particle(i).pbest - Temp1particle;
                Temp4gbest = gbest(it,1:gnvar(it)) - Temp2particle;
                
                dif5 = particle(i).pnvar - gnvar(it);
                
                if dif5 ~= 0
                    if dif5 < 0
                        particle(i).position(particle(i).nvar+1:particle(i).nvar+abs(dif4))...
                            = xmin(1:1+abs(dif4)-1) + (xmax(1:1+abs(dif4)-1)...
                            - xmin(1:1+abs(dif4)-1)) .* rand(1,abs(dif4));
                        particle(i).position = particle(i).position(1:gnvar(it));
                        particle(i).nvar     = gnvar(it);
                        particle(i).velocity = Temp2velocity;
                        Temp3pbest(particle(i).pnvar + 1:gnvar(it)) = ...
                            min(max(rand(1,abs(dif5)),-vmax(1:1+abs(dif5)-1)),vmax(1:1+abs(dif5)-1));
                    else %dif5 > 0
                        
                        particle(i).position(particle(i).nvar+1:particle(i).nvar+abs(dif3))...
                            = xmin(1:1+abs(dif3)-1) + (xmax(1:1+abs(dif3)-1)...
                            - xmin(1:1+abs(dif3)-1)) .* rand(1,abs(dif3));
 
                        particle(i).position = particle(i).position(1:particle(i).pnvar);
                        particle(i).nvar     = particle(i).pnvar;
                        particle(i).velocity = Temp1velocity;
                        Temp4gbest(gnvar(it) + 1:particle(i).pnvar) = ...
                            min(max(rand(1,dif5),-vmax(1:1+dif5-1)),vmax(1:1+dif5-1));
                    end
                else
                    particle(i).position = particle(i).position(1:gnvar(it));
                    particle(i).nvar     = gnvar(it);
                    particle(i).velocity = Temp2velocity;
                end
                
                
                particle(i).velocity = w * particle(i).velocity...
                    + c1 * rand * Temp3pbest + c2 * rand * Temp4gbest;
                
                particle(i).velocity = min(max(particle(i).velocity,...
                    -vmax(1:particle(i).nvar)),vmax(1:particle(i).nvar));
                
                particle(i).position = particle(i).position + particle(i).velocity;
                
                particle(i).position = min(max(particle(i).position,...
                    xmin(1:particle(i).nvar)),xmax(1:particle(i).nvar));
                
                %         Temp5nvar               = particle(i).nvar;
                %         particle(i).nvar        = (2 * (particle(i).position(1)))+Cst1;
                
                %         if particle(i).nvar ~= Temp5nvar
                %             dif2 = particle(i).nvar - Temp5nvar;
                %             if dif2 < 0
                %
                %                 particle(i).position = particle(i).position(1:particle(i).nvar);
                %                 particle(i).velocity = particle(i).velocity(1:particle(i).nvar);
                %             else %dif2 > 0
                %                 particle(i).position(Temp5nvar+1:Temp5nvar+dif2)...
                %                     = xmin(2:1+dif2) + (xmax(2:1+dif2) - xmin(2:1+dif2)) .* rand(1,dif2);
                %                 particle(i).velocity(Temp5nvar+1:Temp5nvar+dif2)...
                %                     = min(max(rand(1,dif2),-vmax(2:1+dif2)),vmax(2:1+dif2));
                %             end
                %             Temp5nvar = 0;
                %             dif2      = 0;
                %         end
                
                %%%************************
                seperatedCosts(i,:) = Fitness(particle(i).position);
                particle(i).cost = sum((1/nObj).*seperatedCosts(i,:));
                %%%
                if particle(i).cost < particle(i).pbestcost
                    particle(i).pnvar     = particle(i).nvar;
                    particle(i).pbest     = particle(i).position;
                    particle(i).pbestcost = particle(i).cost;
                    
                    if particle(i).pbestcost < gbestcost(it)
                        gnvar(it)                 = particle(i).pnvar;
                        gbest(it,1:gnvar(it))     = particle(i).pbest;
                        gbest(it,gnvar(it)+1:end) = 100;
                        gbestcost(it)             = particle(i).pbestcost;
                    end
                end
            end
            
            
            disp(['Iter= ' num2str(it) ' // Best Cost = ' num2str(gbestcost(it))]);
            
            for k = 1:npop
                meanfit(it) = meanfit(it) + particle(k).cost;
            end
            meanfit(it) = meanfit(it) / npop;
            
            w = w * wdamp;
        end
        
        % disp([ ' Best Solution = '  num2str(gbest(it,1:gnvar(it)))])
        % disp([ ' Best Fitness = '  num2str(gbestcost(it))])
        
        % disp([ ' Time = '  num2str(toc)])
        t=toc
        % e = particle().pbest;
        save([savePath '\scenario-' num2str(scenario) ] ,'t','meanfit','particle','gbestcost','seperatedCosts');
    end
end
    % figure(1);
    % plot(gbestcost,'r','LineWidth',2);
    % hold on
    % plot(meanfit,'.b','LineWidth',2);
    % legend('Bests')
    % xlabel('Iteration')
    % ylabel('Fitness')
    % title('WSPSO');