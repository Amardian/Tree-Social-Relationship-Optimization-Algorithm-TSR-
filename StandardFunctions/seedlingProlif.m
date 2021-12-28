function  seedlingpop=seedlingProlif(seedlingpop,pop,data,iter,maxiter)

lb = data.lb;
ub = data.ub;
domain = abs(max(ub)-min(lb));
sn = data.sn;
spn=data.spn;
iteri = maxiter/(domain*iter);


for n=1:2:spn
    
    i=randperm(sn,1);
    l=randperm(sn,1);
    
    [seedlingpop(n).x,seedlingpop(n+1).x]=Uniformprolif(pop(i).x,pop(l).x,iteri);
    
    seedlingpop(n)=fitness(seedlingpop(n),data);
    seedlingpop(n+1)=fitness(seedlingpop(n+1),data);
    
    seedlingpop(n).gr= seedlingpop(n).fit/((pop(l).fit+pop(i).fit)/2);
    seedlingpop(n+1).gr=seedlingpop(n+1).fit/((pop(l).fit+pop(i).fit)/2);
    
end



for n=1:2:spn
    
    
    [seedlingpop(spn+n).x,seedlingpop(spn+n+1).x]=UniformprolifForest(seedlingpop(n).x,seedlingpop(n+1).x,lb,ub);
    
    seedlingpop(spn+n)=fitness(seedlingpop(spn+n),data);
    seedlingpop(spn+n+1)=fitness(seedlingpop(spn+n+1),data);
    
    seedlingpop(spn+n).gr= seedlingpop(spn+n).fit/((seedlingpop(n).fit+seedlingpop(n+1).fit)/2);
    seedlingpop(spn+n+1).gr=seedlingpop(spn+n+1).fit/((seedlingpop(n).fit+seedlingpop(n+1).fit)/2);
    
end

end




function [y1,y2]=Uniformprolif(x1,x2,iteri)

y1 = x1*iteri;
y2 = x2*iteri;


end

function [y1,y2]=UniformprolifForest(x1,x2,lb,ub)


i = randi([min(lb) max(ub)],2);
w1 = (ub-lb)/i(1);
w2 = (ub-lb)/i(2);
y1=w1-x1;
y2=-w2-x2;



end

