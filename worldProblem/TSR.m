%% Tree Social Relationship Optimization (TSR) Algorithm
%% Programmer & Designer: Mahmoud Alimoradi
%% Email: mahmoud.alimorady@gmail.com
%% likedin, Reasearchgate, twitter: mahmoud alimoradi
%% ------------------------------------------------------------------------
%% -------------------------------------------------------------------------
%% TSP World problem : TSP problem with 1000 location (cities) 

clc;
clear;
close all;
format shortG;
%% ================= FOREST OPTIMIZATION ALGORITHM=============
%% ========================= INSERT DATA(TSP) =================

data = InsertData();

%% ============================= PARAMETERS DEFINE =============
npop = 50; %% number of poulation
maxiter = 1000; %% number of iteration 
k = 1;     %% number of sub-forest(grove)
%% best choice maybe is sqrt(npop)/2 = k;
%% percent values %
pp = .1; %% percent of proliferation
psp = .1; %% percent of seedling-proliferation
pg = 0.1;%% percent of germination
pmut = 0.1; %% percent of mutation
ps = 0.4; %% percent of seedling trees of per grove(subforest)
pe = 0.5; %% percent trees of per grove for exchange by bad trees
%% sum(pp,psp,pl) = 1
% --------------------------
zj = npop; %% per grove(subforest) population
zjmax = round(npop/k);
pn = 2*round((pp*zj)/2); % number of proliferation tree for per grove
spn = 2*round((psp*zj)/2); % number of seedling tree for per grove
gn = floor(pg*zj);
mutn = round(pmut*zj);
sn = round(zj*ps); % number of young trees per grove
forLastGrove = (npop)-(k*zj);

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
%      spnom = randperm(sn,spn)+0;%% best trees
     % spnom = randperm(zj-sn,pn)+sn;%% worst trees
     %-------------------------------------------
     
      mutnom = randperm(zj,mutn)+0;
      %mnom =([(1:round(mn/2)),(zj-round(mn/2):zj)]);
      Germnom = randperm(zj,gn)+0;
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
     %% ********** first kind in jungle=====> PROLIFERATION **********************
     prolifpop = popnow( pnnom );
     prolifpop = Proliferation(prolifpop,popnow(pnnom),data); 
     %% ********** second kind in jungle ====> seedlings-proliferation ***********
      seedlingpop = popnow(spnom);
      seedlingpop = Seedling(seedlingpop,popnow(spnom1),popnow(spnom2),data);
       
     %% ********** mutation in jungle ======> mutation  *************************
     mutepop = popnow(mutnom);
     mutepop = Mutinging(mutepop,popnow(mutnom),data);
   
      %% ********** Germination kind of trees ======> Germination  *************************
     Germinationpop = popnow(Germnom);
     Germinationpop = Germination(Germinationpop,popnow(Germnom),data);
     
     %% =========================== merged as trees ===============================
     
    [popThisGrove] = [popnow;prolifpop;Germinationpop;mutepop;seedlingpop];
%     
    %% *************************     sorting trees    ******************************
    forOne = round(zj*0.6);
    forAll = zj-forOne;
    
    if mod(iter,2)==0 
    temp = forOne;
    forOne = forAll;
    forAll = temp;
    end
    
    allC = numel(popThisGrove);
    forAllnumbers = randperm(allC-zj,forAll)+zj; 
    [value,index] = sort([popThisGrove.fit]);
    popThisGrove = popThisGrove(index);
    popThisGrove = [(popThisGrove(1:forOne));(popThisGrove(forAllnumbers))];
    [value,index] = sort([popThisGrove.fit]);
    popThisGrove = popThisGrove(index);
    endpopGrove(:,zoneNumber) = popThisGrove;
    [endpopGrove(1:sn,zoneNumber).SDJ] =deal([1]);
    [endpopGrove(sn+1:zj,zoneNumber).SDJ] =deal([0]);
    [endpopForestAll] = [endpopForestAll;popThisGrove];
   %% ***************************    seedling trees update *************************
   
    
    end 
    
     %% ==========================   sorting trees ====================================
   [value,index] =sort([endpopForestAll.fit]);
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
     ZFJ = (sum(fit))/npop;
     ZFJT = ZFJT + ZFJ;
     endpopGrove(1,i).ZFJ = ZFJ;
     
end

   endpopGroveP(:,1) = endpopGrove(:,1);
for check=2:k
      if endpopGrove(1,check).fit < endpopGrove(1,check-1).fit
          endpopGroveP(:,check) = endpopGrove(:,check-1);
          endpopGroveP(:,check-1) = endpopGrove(:,check);
      else
          endpopGroveP(:,check) = endpopGrove(:,check);
      end
end

for treesCH =1:k/2
    PT = 1-(ZFJ/ZFJT);
    lim = round(zj*pe);
    [BT] = randi(sn,1,lim-1)+1;
%     [Bch] = randi(zj-sn,1,lim)+sn;
   if rand(0,1) > PT
      endpopGroveP(zj-round(zj*pe):zj,abs(k-(treesCH-1))) = endpopGroveP([1,BT],treesCH);
       
   end
end



% for treesCHfit =1:k
%  
%     [value,index] = sort([endpopGroveP(:,treesCHfit).fit]);
%     endpopGroveP = endpopGroveP(index);
%     endpopGrovePend(:,treesCHfit) = endpopGroveP;
%     
% end


 popExe = endpopGroveP;
 %disp(['best way is :' endpopGroveP(1).x])

end
toc



figure(1)
semilogy(BEST,'r')
hold on
semilogy(MEAN,'b')

xlabel('Iteration ')
ylabel(' Fitness ')
legend('BEST','MEAN')
title('TSR')
