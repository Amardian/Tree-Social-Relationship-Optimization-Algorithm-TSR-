function  Germinationpop = Germination(Germinationpop,popnow,data)
 
    n = numel(popnow);
    nvar = data.nvar;
  for i =1:n
    Germinationpop(n+i).x=Swaptwo(popnow(i).x);
    Germinationpop(n+i)=fitness(Germinationpop(n+i),data);
    Germinationpop(n+i).SDJ = 0;
    Germinationpop(n+i).GR = (Germinationpop(n+i).fit/Germinationpop(i).fit)*100;
    
        
  end

  for i =1:n
    Germinationpop(2*n+i).x=Swapmirror(popnow(i).x);
    Germinationpop(2*n+i)=fitness(Germinationpop(2*n+i),data);
    Germinationpop(2*n+i).SDJ = 0;
    Germinationpop(2*n+i).GR = (Germinationpop(2*n+i).fit/Germinationpop(i).fit)*100;
       
  end

  s = floor(nvar/2);
  
  for i =1:n
      for nom=1:floor(nvar/2)
    Germinationpop(3*n+nom+((i-1)*s)).x=SwapLeaf(popnow(i).x,s,nvar);
    Germinationpop(3*n+nom+((i-1)*s))=fitness(Germinationpop(3*n+nom+((i-1)*s)),data);
    Germinationpop(3*n+nom+((i-1)*s)).SDJ = 0;
    Germinationpop(3*n+nom+((i-1)*s)).GR = (Germinationpop(3*n+nom+((i-1)*s)).fit/Germinationpop(i).fit)*100;
      end  
  end
  
  
end

function y=Swaptwo(x)
l=0;
n=numel(x);
if mod(n,2)==1
    l=1;
    n=n-1;
end
for i=1:2:n
  temp=x(i);
  x(i) = x(i+1);
  x(i+1) = temp;
  y=x;
    
end
if l==1
    y(2:n+1) = y(1:n);
    y(1) = x(n+1);
end
l=0;
end


function y=Swapmirror(x)
n=numel(x);

if mod(n,3)==0
for i=1:3:n
temp=x(i);
x(i) = x(i+2);
x(i+2) = temp;

end
y=x;
else
    
for i=1:3:n-2
temp=x(i);
x(i) = x(i+2);
x(i+2) = temp;
end
y = x;
end


end
function y=SwapLeaf(x,s,n)
sb = randi(s,1)+0;
sa = randi((n-s),1)+s;
 temp=x(sb);
 x(sb)=x(sa);
 x(sa) = temp;
 y=x;

end
