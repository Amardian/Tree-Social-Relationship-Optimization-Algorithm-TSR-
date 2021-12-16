function mutepop= Mutinging(mutepop,popnow,data)

mutn=data.mutn;



for n=1:mutn
    
    
    mutepop(mutn+n).x=Swap(popnow(n).x);
    mutepop(mutn+n)=fitness(mutepop(mutn+n),data);
    mutepop(mutn+n).SDJ = 0;
    mutepop(mutn+n).GR = (mutepop(mutn+n).fit/popnow(n).fit)*100;
    
    
end


end





function y=Swap(x)

n=numel(x);

i=randsample(n,2);
i1=i(1);
i2=i(2);

y=x;
y([i1 i2])=x([i2 i1]);

end


