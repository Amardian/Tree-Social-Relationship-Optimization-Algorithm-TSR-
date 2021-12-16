function  germpop=Germination(germpop,pop,data)
% 
% ni=data.n;
%     
% xmin=data.xmin;
% xmax=data.xmax;
%     
% ymin=data.ymin;
% ymax=data.ymax;
gn = data.gn;
npop = data.npop;

for n=1:gn
    
    i1=randi(npop,1);
    germpop(n).x=GerminationQuack(pop(i1).x,data.lb,data.ub);
%     germpop(n)=fitness(germpop(n),data);
    
    germpop(n).gr= germpop(n).fit/((pop(i1).fit));
    
end
% 
% for n=1:gn
%     
%     i1=n;
%     germpop(gn+n).x=GerminationQuacki(germpop(i1).x,data.lb,data.ub);
%     germpop(gn+n)=fitness(germpop(gn+n),data);
%     
%     germpop(gn+n).gr= germpop(gn+n).fit/((germpop(i1).fit));
% end
% 
% 
% for n=1:gn
%     
%     i1=n;
%     germpop(2*gn+n).x=GerminationQuackick(germpop(i1).x,data.lb,data.ub);
%     germpop(2*gn+n)=fitness(germpop(2*gn+n),data);
%     
%     germpop(2*gn+n).gr= germpop(2*gn+n).fit/((germpop(i1).fit));
% end
% 
% for n=1:no
%     
%     i1=n;
%     germpop(3*gn+n).x=mirror(pop(i1).x,mid);
%     germpop(3*gn+n)=fitness(germpop(2*gn+n),data);
%     
%     germpop(3*gn+n).gr= germpop(3*gn+n).fit/((pop(i1).fit));
% end

end





function y=GerminationQuack(x,lb,ub)
x = -x;
if x==0
x =(x+(min(lb)-max(ub))/10);  
else
x = (x/x)*(x+(min(lb)-max(ub))/10);
end
y=x;
end


function y=GerminationQuacki(x,lb,ub)
R = (ub-lb)/10;
d=unifrnd(-R,R,size(lb)).*(ub-lb)/2;
x=x+d;
y=-x;
end



function y=GerminationQuackick(x,lb,ub)
I=randi([min(lb) max(ub)],1);
x=x+I;
y=x;
end

function y=mirror(x,mid)
y = x+mid;
end




