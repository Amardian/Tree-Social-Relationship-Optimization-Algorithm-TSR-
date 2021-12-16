function  motherpop = motherTree(motherpop,popnow,data,mother)

mn=data.mn;



for nr=1:mn
    
    
    motherpop(mn+nr).x=Swapr(popnow(nr).x,mother.x);
    motherpop(mn+nr)=fitness(motherpop(mn+nr),data);
    motherpop(mn+nr).SDJ = 0;
    motherpop(mn+nr).GR = (motherpop(mn+nr).fit/(motherpop(nr).fit + mother.fit)/2)*100; 
end
for nl = 1:mn
    
    motherpop((2*(mn))+nl).x=Swapl(popnow(nl).x,mother.x);
    motherpop((2*(mn))+nl)=fitness(motherpop((2*(mn))+nl),data);
    motherpop((2*(mn))+nl).SDJ = 0;
    motherpop((2*(mn))+nl).GR = (motherpop((2*(mn))+nl).fit/(motherpop(nl).fit+mother.fit)/2)*100;
    
end


end





function y1=Swapr(yr,x)

n=numel(x);
hl=randi(n,1);
temp = x(1:hl);
temp(hl+1:n) = yr(hl+1:n);
y1 = temp;
y1=Unique(x,1:hl);

end


function y2=Swapl(yl,x)

n=numel(x);
hl = randi(n,1);
temp(1:hl) = yl(1:hl);
temp = x(hl+1:n);
y2 = temp;
y2=Unique(x,hl+1:n);

end


