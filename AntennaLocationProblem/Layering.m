function  layeringpop = Layering(layeringpop,popnow,data)

ln=data.gn;


for n=1:ln
    
    
    layeringpop(n).x=Swap(popnow(n).x);
    layeringpop(n)=weightcom(layeringpop(n),data);

    layeringpop(n)=fitness(layeringpop(n),data);
    
    
    
end
for n=1:ln
    
   
    layeringpop(ln+n).x=Swapex(popnow(n).x);
    layeringpop(ln+n)=weightcom(layeringpop(ln+n),data);

    layeringpop(ln+n)=fitness(layeringpop(ln+n),data);
    
    
    
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





