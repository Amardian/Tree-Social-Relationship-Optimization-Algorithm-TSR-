function prolifpop=proliferation(prolifpop,pop,data,iter,maxiter,diss)
iteri = (maxiter/iter)/mean(diss);
pn = data.pn;
% npop = data.npop;

for n=1:pn
    i=n;
    
    prolifpop(n).x=sunLightProlif(pop(1).x,pop(i).x,iteri);
    
    prolifpop(n)=fitness(prolifpop(n),data);
    
    
    prolifpop(n).gr= prolifpop(n).fit/((pop(1).fit+pop(i).fit))/2;
    
    
    
end


for j=1:pn
    i=n;
    
    prolifpop(j+n).x=sunLightProliff(pop(1).x,pop(i).x,iteri);
    
    prolifpop(j+n)=fitness(prolifpop(j+n),data);
    
    
    prolifpop(j+n).gr= prolifpop(j+n).fit/((pop(1).fit+pop(i).fit))/2;
    
    
    
end

% for n=1:2:2*pn
%     i=randperm(pn,1);
%     l=randperm(pn,1);
%     
%     [prolifpop(pn+n).x,prolifpop(pn+n+1).x]=Uniformprolif(pop(i).x,pop(l).x,iteri);
%     
%     prolifpop(pn+n)=fitness(prolifpop(pn+n),data);
%     prolifpop(pn+n+1)=fitness(prolifpop(pn+n+1),data);
%     
%     prolifpop(pn+n).gr= prolifpop(pn+n).fit/((pop(i).fit+pop(l).fit))/2;
%     prolifpop(pn+n+1).gr=prolifpop(pn+n+1).fit/((pop(i).fit+pop(l).fit))/2;
%     
%     
% end



end

function [y]=sunLightProlif(x1,x2,iteri)
dis = x1-x2;

y = (x2+dis)*iteri;

end

function [y]=sunLightProliff(x1,x2,iteri)
dis = x1-x2;


y = (x2-dis)*iteri;
end

function [y1,y2]=Uniformprolif(x1,x2,iteri)
x = x1-x2;
R1=(rand(size(x)));
R2=((1-R1)*iteri);

y1=(R1.*x1)+(R2.*x);
y2=-(R2.*x)+(R1.*x2);


end