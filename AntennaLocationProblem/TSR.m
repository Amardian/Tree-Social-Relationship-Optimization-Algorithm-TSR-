%% Tree Social Relationship Optimization (TSR) Algorithm
%% Programmer & Designer: Mahmoud Alimoradi
%% Email: mahmoud.alimorady@gmail.com
%% likedin, Reasearchgate, twitter: mahmoud alimoradi
%% ------------------------------------------------------------------------
%% -------------------------------------------------------------------------
%% TSP Antenna problem : Antenna location problem 

clc
clear
close all
format shortG


%% Insert Data

data=InsertData();


%% parametres setting

maxiter=1000;
npop=50;     % number of population
pp=0.8;       % percent of proliferation
pm=0.2; %  percent of mutation
pg =0.2;


pn=2*round(npop*pp/2);  % number of proliferation offspring
mutn=npop-pn;  % number of mutation offspring
gn = 2*round(npop*pg/2);




data.npop=npop;
data.pn=pn;
data.mutn=mutn;
data.maxiter=maxiter;
data.gn = gn;

%% initialization
tic

[pop,emp]=CreateInitialPopulation(data);


%% main loop
BEST=zeros(maxiter,1);
MEAN=zeros(maxiter,1);

for iter=1:maxiter
    
    
    prolifpop=repmat(emp,pn,1);
    prolifpop=Proliferation(prolifpop,pop,data);
   
    mutpop=repmat(emp,mutn,1);
    mutpop=mutaining(mutpop,pop,data);
    
    Germinationpop=repmat(emp,gn,1);
    Germinationpop=Germination(Germinationpop,pop,data);
    
%     layeringpop=repmat(emp,gn,1);
%     layeringpop = Layering(layeringpop,pop,data);
%     
    
    
    
    
    [pop]=[pop;prolifpop;mutpop;Germinationpop];
     
%     ;layeringpop
   

    % Sorting
    [value,index]=sort([pop.fit]);
    pop=pop(index);
    gpop=pop(1);
    
    % Select
    pop=pop(1:npop);
    

    
    BEST(iter)=gpop.fit;
    MEAN(iter)=mean([pop.fit]);
    
    disp([' Iter = ' num2str(iter)  ' BEST = ' num2str(BEST(iter))])
    
    
    
    
end
 disp(['distance is' num2str(pop(1).w)])
toc

figure(1)
semilogy(BEST,'r')
hold on
semilogy(MEAN,'b')

xlabel('Iteration ')
ylabel(' Fitness ')
legend('BEST','MEAN')
title('TSR')



