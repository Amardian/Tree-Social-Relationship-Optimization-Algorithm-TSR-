%% Tree Social Relationship Optimization (TSR) Algorithm
%% Programmer & Designer: Mahmoud Alimoradi
%% Email: mahmoud.alimorady@gmail.com
%% likedin, Reasearchgate, twitter: mahmoud alimoradi
%% ------------------------------------------------------------------------
%% -------------------------------------------------------------------------
%% Knapsack problem : best result in this problem is maximum


clc;
clear;
close all;
format shortG;
%% ================= FOREST OPTIMIZATION ALGORITHM=============
%% ========================= INSERT DATA(TSP) =================

data = InsertData();

%% ============================= PARAMETERS DEFINE =============
npop = 50; %% number of poulation
maxiter =1000; %% number of iteration 
k = 1;     %% number of sub-forest(grove)
%% best choice maybe is sqrt(npop)/2 = k;
%% percent values %
pp = .4; %% percent of proliferation
psp = .4; %% percent of seedling-proliferation
pg = 0.1;%% percent of germination
pmut = 0.1; %% percent of mutation
ps = 0.4; %% percent of seedling trees of per grove(subforest)
pe = 0.1; %% percent trees of per grove for exchange by bad trees
%% sum(pp,psp,pl) = 1
% --------------------------
zj = 2*round((npop/k)/2); %% per grove(subforest) population
zjmax = round(npop/k);
pn = 2*round((pp*zj)/2); % number of proliferation tree for per grove
spn = 2*round((psp*zj)/2); % number of seedling tree for per grove
gn = floor(pg*zj);
mutn = round(pmut*zj);
sn = round(zj*ps); % number of young trees per grove
forLastGrove = (npop)-(k*zj);
maxNumberPerThing = 5; %% max number of per thing 
capacity = 625; %%  max capacity
%%----------------------------------------------------------------------

data.npop = npop;
data.maxiter = maxiter;
data.k = k;
data.zj = zj;
data.pn = pn;
data.spn = spn;
data.sn = sn;
data.gn = gn;
data.mutn = mutn;
data.number = maxNumberPerThing;
data.capacity = capacity;


%%   ===========================  INITIALIZATION   ==========================
[pop,emp] = CreateInitialPopulation(data);
popExe = pop;

%%   ************************************ --  ********************************

% *******************************************************************************
%% ****************************** MAIN LOOP *************************************

BEST = zeros(maxiter,1);
MEAN = zeros(maxiter,1);
tic
for iter = 1:maxiter
    
   emp.x=[];
   emp.fit=[];
   emp.GR = [];
   emp.SDJ = [0];
   emp.ZFJ = [];
   
   endpopGrove=repmat(emp,zj,k);
   endpopGroveP=repmat(emp,zj,k); 
   endpopForestAll = [];
   ZFJT = 0;
   
    for zoneNumber =1:k
 
     popnowT(1:zj,:) = popExe(:,zoneNumber); %% zone(grove) for this loop(zoneNumberth)
     [~,index] = sortrows([popnowT.fit].');
     popnowT = popnowT(index);
     clear index
     [popnowT(1:sn).SDJ] = deal([1]);
     [popnowT(sn+1:zj).SDJ] = deal([0]);
     popnow = popnowT;
     
     
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
     pnnom = randperm(zj,pn)+0;%% all trees
      %pnnom = randperm(sn,pn)+0;%% best trees
     % pnom = randperm(zj-sn,pn)+sn;%% worst trees
     %------------------------------------------
     spnom1 = randperm((zj-sn),round(spn/2))+(sn);
     spnom2 = randi((sn),1,floor(spn/2))+0;
     [spnom] = [spnom1,spnom2];%% both best and worst
     %spnom = randperm(sn,1,pn)+0;%% best trees
     % spnom = randperm(zj-sn,pn)+sn;%% worst trees
     %-------------------------------------------
     
%       mutnom = [1,randperm(zj,mutn),zj];
      %mnom =([(1:round(mn/2)),(zj-round(mn/2):zj)]);
      Germnom = [1,randperm(zj-2,gn)+1,zj];
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
     %% ********** first kind in jungle=====> PROLIFERATION **********************
     prolifpop = popnow( pnnom );
     prolifpop = Proliferation(prolifpop,data); 
     %% ********** second kind in jungle ====> seedlings-proliferation ***********
      seedlingpop = popnow(spnom);
      seedlingpop = Seedling(seedlingpop,popnow(spnom1),popnow(spnom2),data);
       
     %% ********** mutation in jungle ======> mutation  *************************
%      mutepop = popnow(mutnom);
%      mutepop = Mutinging(mutepop,data);
%    
      %% ********** Germination kind of trees ======> Germination  *************************
     Germinationpop = popnow(Germnom);
     Germinationpop = Germination(Germinationpop,data);
     
     %% =========================== merged as trees ===============================
     
    [popThisGrove] = [popnow;prolifpop;seedlingpop;Germinationpop];
%     ;mutepop
    
    %% *************************     sorting trees    ******************************
    forOne = round(zj*0.7);
    forAll = zj-forOne;
    allC = numel(popThisGrove);
    forAllnumbers = randperm(allC-zj,forAll)+zj;
    [value,index] = sort([popThisGrove.fit],'descend');
    popThisGrove = popThisGrove(index);
    popThisGrove = [(popThisGrove(1:forOne));(popThisGrove(forAllnumbers))];
    [value,index] = sort([popThisGrove.GR],'descend');
    popThisGrove = popThisGrove(index); 
    endpopGrove(:,zoneNumber) = popThisGrove;
    [endpopGrove(1:sn,zoneNumber).SDJ] =deal([1]);
    [endpopGrove(sn+1:zj,zoneNumber).SDJ] =deal([0]);
    [endpopForestAll] = [endpopForestAll;popThisGrove];
   %% ***************************    seedling trees update *************************
   
    
    end 
    
     %% ==========================   sorting trees ====================================
   [value,index] =sort([endpopForestAll.fit],'descend');
   endpopForestAll = endpopForestAll(index);
   gpop = endpopForestAll(1);
   %% =============================== selecting for next generation ==================
   
   BEST(iter) = gpop.fit;
   MEAN(iter) = mean([endpopForestAll.fit]);
   disp(['iter ' num2str(iter) ' best is ' num2str(BEST(iter))])

    
    
    %% ******************************* GLOBAL KINGDOM  ******************************
    
      
for i=1:k
     fitOfGrove = endpopGrove(:,i);
     fit = [fitOfGrove.fit].';
     ZFJ = (k*sum(fit))/npop;
     ZFJT = ZFJT + ZFJ;
     endpopGrove(1,i).ZFJ = ZFJ;
     
end

   endpopGroveP(:,1) = endpopGrove(:,1);
for check=2:k
      if endpopGrove(1,check).ZFJ < endpopGrove(1,check-1).ZFJ
          endpopGroveP(:,check) = endpopGrove(:,check-1);
          endpopGroveP(:,check-1) = endpopGrove(:,check);
      else
          endpopGroveP(:,check) = endpopGrove(:,check);
      end
end

for treesCH =1:k/2
    PT = 1-(ZFJ/ZFJT);
    lim = round(zj*pe);
    [BT] = randi(sn-lim,1,lim)+1;
    [Bch] = randi(zj-sn,1,lim)+sn;
   if rand(0,1) > PT
      endpopGroveP(zj-round(zj*pe):zj,abs(k-(treesCH-1))) = endpopGroveP(BT,treesCH);
       
   end
end


 popExe = endpopGroveP;
 

end
toc


disp(['thing nom is : ' ])
disp(endpopGroveP(1).x)
disp(['weight is '] )
disp(sum(endpopGroveP(1).w))
figure(1)
semilogy(BEST,'r')
hold on
semilogy(MEAN,'b')

xlabel('Iteration ')
ylabel(' Fitness ')
legend('BEST','MEAN')
title('TSR')
