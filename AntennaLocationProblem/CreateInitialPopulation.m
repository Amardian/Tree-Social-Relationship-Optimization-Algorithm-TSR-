 function [pop,emp]=CreateInitialPopulation(data)
npop = data.nantenna;
nserver = data.nserver;
nantenna = data.nantenna;
emp.x=[];
emp.fit=[];
emp.w = [];
pop=repmat(emp,npop,1);


for n=1:npop
        pop(n).x = randi(nserver,1,nantenna);
        pop(n).x = checker(pop(n).x,data);
     
 end
for n=1:npop
       
     pop(n)=weightcom(pop(n),data);
     pop(n)=fitness(pop(n),data);
     
 end
   
 
    
  
end
