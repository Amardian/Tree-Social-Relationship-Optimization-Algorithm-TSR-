


 function [pop,emp]=CreateInitialPopulation(data)

npop=data.zj;
nvar=data.nvar;
k = data.k;
num = data.number;

emp.x=[];
emp.fit=[];
emp.w = [];
emp.GR = [0];
emp.SDJ = [0];
emp.ZFJ = [];
pop=repmat(emp,npop,k);
 



    for i=1:k
       for n=1:npop
         pop(n,i).x=randi(num,1,nvar)+(-1);
         
       end
    end
    
    for i=1:k
       for n=1:npop
         pop(n,i)=weightcom(pop(n,i),data);
         pop(n,i)=fitness(pop(n,i),data);
       end
    end
   
    maxFit = (max([pop(:,:).fit]));
   for i=1:k
       for n=1:npop
         pop(n,i).GR =  (pop(n,i).fit/maxFit)*100;
       end
  
    end
  
end



 