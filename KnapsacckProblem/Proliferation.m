function  prolifpop = Proliferation(prolifpop,data)

pn=data.pn;
% 
% f=[prolifpop.fit];
% f=1./f;
% f=f./sum(f);
% f=cumsum(f);

% for n=1:2:pn
%     
%     i1=find(rand<=f,1,'first');
%     i2=find(rand<=f,1,'first');
%     [prolifpop(pn+n).x,prolifpop(pn+n+1).x]=SinglePointProlif(prolifpop(i1).x,prolifpop(i2).x);
%     
%     prolifpop(pn+n)  =fitness(prolifpop(pn+n),data);
%     prolifpop(pn+n+1)=fitness(prolifpop(pn+n+1),data);
%     
%     
%     prolifpop(pn+n)  =weightcom(prolifpop(pn+n),data);
%     prolifpop(pn+n+1)=weightcom(prolifpop(pn+n+1),data);
%     
%     prolifpop(pn+n).SDJ=0;
%     prolifpop(pn+n+1).SDJ=0;
%     
%     prolifpop(pn+n).GR=(prolifpop(pn+n).fit/((prolifpop(i1).fit+prolifpop(i2).fit)/2))*100;
%     prolifpop(pn+n+1).GR=(prolifpop(pn+n+1).fit/((prolifpop(i1).fit+prolifpop(i2).fit)/2))*100;
% end


for n=1:2:pn
    
    i1=randi(pn,1);
    i2=randi(pn,1);
    [prolifpop(pn+n).x,prolifpop(pn+n+1).x]=SinglePointProlif(prolifpop(i1).x,prolifpop(i2).x);
    
    prolifpop(pn+n)  =fitness(prolifpop(pn+n),data);
    prolifpop(pn+n+1)=fitness(prolifpop(pn+n+1),data);
    
    
    prolifpop(pn+n)  =weightcom(prolifpop(pn+n),data);
    prolifpop(pn+n+1)=weightcom(prolifpop(pn+n+1),data);
    
    
    prolifpop(pn+n).SDJ=0;
    prolifpop(pn+n+1).SDJ=0;
    
    prolifpop(pn+n).GR=(prolifpop(pn+n).fit/((prolifpop(i1).fit+prolifpop(i2).fit)/2))*100;
    prolifpop(pn+n+1).GR=(prolifpop(pn+n+1).fit/((prolifpop(i1).fit+prolifpop(i2).fit)/2))*100;
end

end


function [y1,y2]=SinglePointProlif(x1,x2)

nvar=numel(x1);

j=randi([1 nvar-1]);

y1(1:j)=x2(1:j);
y2(1:j)=x1(1:j);

y1(j+1:nvar)=x2(j+1:nvar);
y2(j+1:nvar)=x1(j+1:nvar);



end

























































