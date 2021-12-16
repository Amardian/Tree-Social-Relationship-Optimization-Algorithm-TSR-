function  Germinationpop = Germination(Germinationpop,popnow,data)


gn = data.gn;
n = data.n;
for i=1:gn
    Germinationpop(gn+i).x = swap(popnow(gn).x);
    Germinationpop(gn+i)=fitness(Germinationpop(gn+i),data);
    Germinationpop(gn+i).SDJ = 0;
    Germinationpop(gn+i).GR = (Germinationpop(gn+i).fit/(Germinationpop(gn).fit))*100;
    
   
end


for i=1:gn
    Germinationpop(2*gn+i).x = swapBadChild(Germinationpop(gn+i).x);
    Germinationpop(2*gn+i)=fitness(Germinationpop(2*gn+i),data);
    Germinationpop(2*gn+i).SDJ = 0;
    Germinationpop(2*gn+i).GR = (Germinationpop(2*gn+i).fit/(Germinationpop(gn+i).fit))*100;
    
end

for i=1:gn
    Germinationpop(3*gn+i).x = shuffled(Germinationpop(2*gn+i).x);
    Germinationpop(3*gn+i)=fitness(Germinationpop(3*gn+i),data);
    Germinationpop(3*gn+i).SDJ = 0;
    Germinationpop(3*gn+i).GR = (Germinationpop(3*gn+i).fit/(Germinationpop(2*gn+i).fit))*100;
    
end

if n>20
for i=1:gn
    Germinationpop(4*gn+i).x = pedicel(Germinationpop(3*gn+i).x);
    Germinationpop(4*gn+i)=fitness(Germinationpop(4*gn+i),data);
    Germinationpop(4*gn+i).SDJ = 0;
    Germinationpop(4*gn+i).GR = (Germinationpop(4*gn+i).fit/(Germinationpop(3*gn+i).fit))*100;
    
end
end

if n>20
for i=1:gn
    Germinationpop(5*gn+i).x = pedicelex(Germinationpop(4*gn+i).x);
    Germinationpop(5*gn+i)=fitness(Germinationpop(5*gn+i),data);
    Germinationpop(5*gn+i).SDJ = 0;
    Germinationpop(5*gn+i).GR = (Germinationpop(5*gn+i).fit/(Germinationpop(4*gn+i).fit))*100;
    
end
end


end



function y=swap(x)

n=numel(x);
now = round(n/2);
hl=randperm(now,1);
y = x(1:hl);
noms = randperm(n-hl,n-hl)+(hl);
y(hl+1:n) = x(noms);

end


function y=swapBadChild(x)


n = numel(x);
nom=round(n/2);
h1=randperm(nom,nom);
h2 = randperm((n-nom),nom)+nom;
temp = x(h1);
x(1:nom) = x(h2);
x(nom+1:n) = temp;
y = x;

end
function y=shuffled(x)


n = numel(x);
nom=round(n/2);
h1=randperm(nom,nom);
h2 = randperm((n-nom),nom)+nom;
temp = x(h1);
x(1:nom) = x(h2);
x(nom+1:n) = temp;
h1=randperm(nom,nom);
h2 = randperm((n-nom),nom)+nom;
temp = x(h1);
x(1:nom) = x(h2);
x(nom+1:n) = temp;
y = x;

end

function y=pedicel(x)
n = numel(x);
pedicelnom = floor(n/10);
 numch = randperm(pedicelnom,2);
 temp = x((((numch(1)-1)*10)+1:((numch(1)-1)+1)*10));
 x(((numch(1)-1)*10)+1:((numch(1)-1)+1)*10) = x(((numch(2)-1)*10)+1:((numch(2)-1)+1)*10);
 x(((numch(2)-1)*10)+1:((numch(2)-1)+1)*10) = temp;

y = x;

end


function y=pedicelex(x)
n = numel(x);
nomi = round(n/2);
g1 = randperm(nomi,nomi)+0;
g2 = randperm(n-nomi,n-nomi)+nomi;
y = x(g1);
y(nomi+1:n) = x(g2);


end