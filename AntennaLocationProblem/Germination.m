function  Germinationpop=Germination(Germinationpop,pop,data)
  n = data.gn;
%   n = data.n;
  for i =1:n
    Germinationpop(i).x=Swaptwo(pop(i).x);
   Germinationpop(i)=weightcom(Germinationpop(i),data);

    Germinationpop(i)=fitness(Germinationpop(i),data);

    
        
  end

  for i =1:n
    Germinationpop(n+i).x=Swapmirror(pop(i).x);
    Germinationpop(n+i)=weightcom(Germinationpop(n+i),data);

    Germinationpop(n+i)=fitness(Germinationpop(n+i),data);
  
       
  end

  s = floor(n/2);
  
  for i =1:n
      for nom=1:floor(n/2)
    Germinationpop(n+nom+((i-1)*s)).x=SwapLeaf(pop(i).x,s,n);
    Germinationpop(n+nom+((i-1)*s))=weightcom(Germinationpop(n+nom+((i-1)*s)),data);

    Germinationpop(n+nom+((i-1)*s))=fitness(Germinationpop(n+nom+((i-1)*s)),data);
    
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
