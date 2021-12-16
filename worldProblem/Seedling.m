function  seedlingpop = Seedling(seedlingpop,popk1,popk2,data)

spn=data.spn;

l1 = numel(popk1);
l2 = numel(popk2);

for n=1:2:spn
    
    i1=randi(l1,1);
    i2=randi(l2,1);
    
    [seedlingpop(spn+n).x,seedlingpop(spn+n+1).x]=SinglePointSeedling(popk1(i1).x,popk2(i2).x);
    
    seedlingpop(spn+n)  =fitness(seedlingpop(spn+n),data);
    seedlingpop(spn+n+1)=fitness(seedlingpop(spn+n+1),data);
    
    seedlingpop(spn+n).SDJ=0;
    seedlingpop(spn+n+1).SDJ=0;
    
    seedlingpop(spn+n).GR=(seedlingpop(spn+n).fit/((popk1(i1).fit+popk2(i2).fit)/2))*100;
    seedlingpop(spn+n+1).GR=(seedlingpop(spn+n+1).fit/((popk1(i1).fit+popk2(i2).fit)/2))*100;
    
    
end


for n=1:floor(spn/2)
    
    
    [seedlingpop(2*spn+n).x,seedlingpop(2*spn+n+1).x]=motherSeedling(popk1(1).x,popk2(n).x);
    
    seedlingpop(2*spn+n)  =fitness(seedlingpop(2*spn+n),data);
    seedlingpop(2*spn+n+1)=fitness(seedlingpop(2*spn+n+1),data);
    
    seedlingpop(2*spn+n).SDJ=0;
    seedlingpop(2*spn+n+1).SDJ=0;
    
    seedlingpop(2*spn+n).GR=(seedlingpop(2*spn+n).fit/((popk1(1).fit+popk2(n).fit)/2))*100;
    seedlingpop(2*spn+n+1).GR=(seedlingpop(2*spn+n+1).fit/((popk1(1).fit+popk2(n).fit)/2))*100;
    
    
end

end


function [y1,y2]=SinglePointSeedling(x1,x2)

nvar=numel(x1);

j=randi([1 nvar-1]);
y1=x1;
y2=x2;

y1(1:2:j)=x2(1:2:j);
y2(1:2:j)=x1(1:2:j);
y1(2:2:j)=x2(2:2:j);
y2(2:2:j)=x1(2:2:j);
y1=Unique(y1,1:j);
y2=Unique(y2,1:j);

end

function [y1,y2]=motherSeedling(x1,x2)

nvar=numel(x1);

j=randi([1 nvar-1]);
y1=x1;
y2=x2;

y1(1:j)=x2(1:j);
y2(1:j)=x1(1:j);

y1=Unique(y1,1:j);
y2=Unique(y2,1:j);

end

















