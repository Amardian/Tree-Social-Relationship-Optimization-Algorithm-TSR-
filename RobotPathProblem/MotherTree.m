function  motherpop=MotherTree(motherpop,pop1,pop2,data,iter)

% sn=data.sn;
% snb = round(sn/2);
% snw = sn-snb;
% best = pop1(1).x;
% maxiter = data.maxiter;
% ub = data.ub;
% lb = data.lb;
% dis = ub-lb;
% lw = dis/maxiter;



for n=1:2:2*snb
    
    i1=round(n/2);
    [motherpop(n).x,motherpop(n+1).x]=farAWay(pop1(i1).x,data.lb,data.ub,iter);
    
    motherpop(n)=fitness(motherpop(n),data);
    motherpop(n+1) = fitness(motherpop(n+1),data);
    
    motherpop(n).gr= motherpop(n).fit/((pop1(i1).fit));
    motherpop(n+1).gr= motherpop(n+1).fit/((pop1(i1).fit));
end
% 
% for n=1:2:sn
%     
%     i1=round(n/2);
%     
%     [motherpop(2*snb+n).x,motherpop(2*snb+n+1).x]=NearBy(pop2(i1).x,best);
%     
%     motherpop(2*snb+n)=fitness(motherpop(2*snb+n),data);
%     motherpop(2*snb+n+1) = fitness(motherpop(2*snb+n+1),data);
%     
%     motherpop(2*snb+n).gr= motherpop(2*snb+n).fit/((pop2(i1).fit));
%     motherpop(2*snb+n+1).gr= motherpop(2*snb+n+1).fit/((pop2(i1).fit)); 
% end
% 
% for n=1:2:2*snw
%     
%     
%     [motherpop(3*snb+n).x,motherpop(3*snb+n+1).x]=littleW(pop1(1).x,lw,n);
%     
%     motherpop(3*snb+n)=fitness(motherpop(3*snb+n),data);
%     motherpop(3*snb+n+1) = fitness(motherpop(3*snb+n+1),data);
%     
%     motherpop(3*snb+n).gr= motherpop(3*snb+n).fit/((pop1(1).fit));
%     motherpop(3*snb+n+1).gr= motherpop(3*snb+n+1).fit/((pop1(1).fit)); 
% end
% 


end





function [y1,y2]=farAWay(x,lb,ub,iter)
mid = ub-lb/(iter^2);
y1 = x+mid;
y2 = x-mid;
end

function [y1,y2]=NearBy(x,b)
bestFar = b;
y1 = x+bestFar;
y2 = x-bestFar;
end
function [y1,y2]=littleW(x,lw,n)
y1 = x+n*lw;
y2 = x-n*lw;
end



