function prolifpop=Proliferation(prolifpop,pop,data)

np=data.pn;

f=[pop.fit];
f=1./f;
f=f./sum(f);
f=cumsum(f);

for n=1:2:np
    
    i1=find(rand<=f,1,'first');
    i2=find(rand<=f,1,'first');
    
    [prolifpop(n).x,prolifpop(n+1).x]=SinglePointProliferation(pop(i1).x,pop(i2).x);
    
    prolifpop(n)=weightcom(prolifpop(n),data);
    prolifpop(n+1)=weightcom(prolifpop(n+1),data);
    prolifpop(n)=fitness(prolifpop(n),data);
    
    prolifpop(n+1)=fitness(prolifpop(n+1),data);
    
end

end


function [y1,y2]=SinglePointProliferation(x1,x2)

nvar=numel(x1);

j=randi([1 nvar-1]);
y1=x1;
y2=x2;

y1(1:j)=x2(1:j);
y2(1:j)=x1(1:j);


end


















