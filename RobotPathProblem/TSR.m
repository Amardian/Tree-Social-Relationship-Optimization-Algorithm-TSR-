%% Tree Social Relationship Optimization (TSR) Algorithm
%% Programmer & Designer: Mahmoud Alimoradi
%% Email: mahmoud.alimorady@gmail.com
%% likedin, Reasearchgate, twitter: mahmoud alimoradi
%% ------------------------------------------------------------------------
%% -------------------------------------------------------------------------
%% Robot path problem : Min path for a robot


close all;
% clear;
clc;
format shortG;
%% =========================== FOREST OPTIMIZATION ALGORITHM =================
%      ******************************* parameters *******************


data=CreateModel();

data.n=5;  % number of Handle Points

maxiter = 1000;
nvar=data.n;

VarSize=[1 nvar];   % Size of Decision Variables Matrix

VarMin.x=data.xmin;           % Lower limit of Variables
VarMax.x=data.xmax;           % Upper limit of Variables
VarMin.y=data.ymin;           % Lower limit of Variables
VarMax.y=data.ymax;           % Upper limit of Variables




lb = 0*ones(1,nvar);
ub = 10*ones(1,nvar);
npop = 100;
diss = ub-lb;
tens = diss/10;

%-----------------------

sp = 0.4;
sn = round(sp*npop);
pp = 0.6;
pn = round(pp*npop);
gp = 0.2;
gn = round(gp*npop);
%% ===============================================================================
data.nvar = nvar;
data.lb = lb;
data.ub = ub;
data.npop = npop;
data.maxiter = maxiter;
data.sn = sn;
data.pn = pn;
data.dis = diss;
data.gn = gn;
data.tens = tens;

 %   -----------------------------------------------------------------------------
 
 %==================== initialization
 emp.x = [];
 emp.y = [];
 emp.fit = [];
 emp.sd = [];
 emp.gr = [];
 pop = repmat(emp,npop,1);
 
 % ----------------------------------
 for i=1:npop
    pop(i).x = unifrnd(lb,ub,1,nvar);
    pop(i).y = unifrnd(lb,ub,1,nvar);
    pop(i) = fitness(pop(i),data); 
 end
[value,index] = sort([pop.fit]);
pop = pop(index);
[pop(1:sn).sd] =deal(1);
[pop(sn+1:npop).sd] =deal(0);
fitMean = sum([pop.fit])/numel(pop);
for i=1:npop
    pop(i).gr = pop(i).fit/fitMean; 
end


%  ------------------------ main loop

BEST=zeros(maxiter,1);
MEAN=zeros(maxiter,1);
tic
for iter=1:maxiter
    nu = mod(iter,10);
    if nu==0
    lb = data.lb;
    ub = data.ub;
    else
     lb = data.ub-(10-nu)*tens;
     ub = data.ub-(10-nu-1)*tens;   
    end
   
    
    
    
    % proliferation
    prolifpop=repmat(emp,pn,1);
    prolifpop=proliferation(prolifpop,data);
    
    %Germination
    germpop=repmat(emp,gn,1);
    germpop=Germination(germpop,pop,data);
    
    %MotherTrees
%     motherpop=repmat(emp,sn,1);
%     motherpop=MotherTree(motherpop,pop(1:round(sn/2)),pop(floor(npop-sn/2)+1:npop),data,iter);
%     
%     
    
    
    
    
    [pop] = [pop;prolifpop;germpop];
%     ;motherpop
    [value,index] = sort([pop.fit]);
    pop = pop(index);
    gpop = pop(1);
     bestTrees = round(.5*npop);
    randomTreesC= npop-bestTrees;
    randomTrees = randperm(numel(pop)-bestTrees,randomTreesC)+bestTrees;
    
    pop = [pop(1:bestTrees);pop(randomTrees)];
   
    % Select for seedling growth
    [value,index]=sort([pop.gr]);
    pop=pop(index);
    [pop(1:sn).sd] = deal([1]);
    [pop(sn+1:npop).sd] = deal([0]);
    
    

    BEST(iter)=gpop.fit;
    MEAN(iter)=mean([pop.fit]);
    disp([' Iter = ' num2str(iter)  ' BEST = ' num2str(BEST(iter))])
    
 
 
 
 
 
 
 
 
end

%% results

disp([ ' Best x = '  num2str(gpop.x)])
disp([ ' Best Fitness = '  num2str(gpop.fit)])
disp([ ' Time = '  num2str(toc)])
% 
figure(1)
semilogy(BEST,'r')
hold on
semilogy(MEAN,'b') 
xlabel('Iteration')
ylabel('Fitness')
legend('BEST','MEAN')
title('TSR')
