function sol=fitness(sol,data)

N = data.nserver;
ghzantenna = data.ghzantenna;
ghzserver = data.ghzserver;
x = sol.x;
w = sol.w;
sumi = sum(ghzserver);
allw = data.allway;


Z=0;
for k=1:N
loc = (find(x==k));
sumloc = sum(ghzantenna(loc));
tempbar =((sumloc-sumi).^2/N);
tempway =(w/allw);
Z  = tempbar*tempway;
       
end


sol.fit=Z;



end
