function  prolifpop = Proliferation(prolifpop,popk,data)

pn=data.pn;

f=[popk.fit];
f=1./f;
f=f./sum(f);
f=cumsum(f);

for n=1:2:pn
%     
    i1=find(rand<=f,1,'first');
    i2=find(rand<=f,1,'first');
% i1 = randperm(pn,1);
% i2 = randperm(pn,1);
    [prolifpop(pn+n).x,prolifpop(pn+n+1).x]=SinglePointProlif(popk(i1).x,popk(i2).x);
    
    prolifpop(pn+n)  =fitness(prolifpop(pn+n),data);
    prolifpop(pn+n+1)=fitness(prolifpop(pn+n+1),data);
    
    prolifpop(pn+n).SDJ=0;
    prolifpop(pn+n+1).SDJ=0;
    
    prolifpop(pn+n).GR=(prolifpop(pn+n).fit/((popk(i1).fit+popk(i2).fit)/2))*100;
    prolifpop(pn+n+1).GR=(prolifpop(pn+n+1).fit/((popk(i1).fit+popk(i2).fit)/2))*100;
end

end


function [y1,y2]=SinglePointProlif(x1,x2)

nvar=numel(x1);

j=randi([1 nvar-1]);
y1=x1;
y2=x2;

y1(1:j)=x2(1:j);
y2(1:j)=x1(1:j);

y1=Unique(y1,1:j);
y2=Unique(y2,1:j);

end





























