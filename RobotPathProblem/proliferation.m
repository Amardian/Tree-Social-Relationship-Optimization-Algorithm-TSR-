function prolifpop=proliferation(prolifpop,data)

ni=data.n;
    
xmin=data.xmin;
xmax=data.xmax;
    
ymin=data.ymin;
ymax=data.ymax;
pn = data.pn;

for n=1:pn
   
    sol.x=unifrnd(xmin,xmax,1,ni);
    sol.y=unifrnd(ymin,ymax,1,ni);
    
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

% function [y1,y2]=sunLightProlif(x1,x2,iteri)
% dis = x1-x2;
% 
% y1 = (x2+dis)*iteri;
% y2 = (x2-dis)*iteri;
% end
% 
% function [y1,y2]=Uniformprolif(x1,x2,iteri)
% x = x1-x2;
% R1=(rand(size(x)));
% R2=((1-R1)*iteri);
% 
% y1=(R1.*x1)+(R2.*x);
% y2=-(R2.*x)+(R1.*x2);
% 
% 
% end