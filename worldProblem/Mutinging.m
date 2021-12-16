function mutepop= Mutinging(mutepop,popnow,data)

mutn=data.mutn;



for n=1:mutn
    
    
    mutepop(mutn+n).x=Swap(popnow(n).x);
    mutepop(mutn+n)=fitness(mutepop(mutn+n),data);
    mutepop(mutn+n).SDJ = 0;
    mutepop(mutn+n).GR = (mutepop(mutn+n).fit/popnow(n).fit)*100;
    
    
end


for n=1:mutn
    
    
    mutepop(2*mutn+n).x=Swapmul(mutepop(mutn+n).x);
    mutepop(2*mutn+n)=fitness(mutepop(2*mutn+n),data);
    mutepop(2*mutn+n).SDJ = 0;
    mutepop(2*mutn+n).GR = (mutepop(2*mutn+n).fit/mutepop(mutn+n).fit)*100;
    
    
end


for n=1:mutn
    
    
    mutepop(3*mutn+n).x=SwapQuack(mutepop(2*mutn+n).x);
    mutepop(3*mutn+n)=fitness(mutepop(3*mutn+n),data);
    mutepop(3*mutn+n).SDJ = 0;
    mutepop(3*mutn+n).GR = (mutepop(3*mutn+n).fit/mutepop(2*mutn+n).fit)*100;
    
    
end
end





function y=Swap(x)

y=x;
n=numel(x);
nom = floor(n/10);
if n<10
nom=1;
end
i=randsample(10,2);
if n<10
i=randsample(n,2);
end
i1=i(1);
i2=i(2);


for in=1:nom

y([i1+(10*(in-1)) i2+(10*(in-1))])=x([i2+(10*(in-1)) i1+(10*(in-1))]);
   
end


end
function y=Swapmul(x)
n = numel(x);
nom = floor(n/2);
if mod(n,2)==0
 temp = x(1:nom);
 x(1:nom) = x(nom+1:n);
 x(nom+1:n) = temp;
 y = x;
else
 temp = x(1:nom);
 x(1:nom) = x(nom+1:n-1);
 x(nom+1:n-1) = temp;
 temp = x(1);
 x(1) = x(n);
 x(n) = temp;
 y = x;  
    
    
end
end

function y=SwapQuack(x)

n=numel(x);
nc = randperm(n,n)+0;   
y=x(nc);
end


