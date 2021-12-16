function  layeringpop = Layering(layeringpop,popnow,data)

ln=data.ln;


for n=1:ln
    
    
    layeringpop(ln+n).x=Swap(popnow(n).x);
    layeringpop(ln+n)=fitness(layeringpop(ln+n),data);
    layeringpop(ln+n).SDJ = 0;
    layeringpop(ln+n).GR = (layeringpop(ln+n).fit/layeringpop(n).fit)*100;
    
    
end
for n=1:ln
    
   
    layeringpop(2*ln+n).x=Swapex(popnow(n).x);
    layeringpop(2*ln+n)=fitness(layeringpop(2*ln+n),data);
    layeringpop(2*ln+n).SDJ = 0;
    layeringpop(2*ln+n).GR = (layeringpop(2*ln+n).fit/layeringpop(n).fit)*100;
    
    
end


end





function y=Swap(x)

n=numel(x);
nom = randi(n,1);
temp(1) = x(nom);
temp(2:nom) = x(1:nom-1);
temp(nom+1:n) = x(nom+1:n);


y=temp;


end



function y=Swapex(x)

n=numel(x);
nom = randi(n,1);
temp(1) = x(nom);
temp(2:nom) = x(1:nom-1);
temp(nom+1:n) = x(nom+1:n);


y=temp;


end





