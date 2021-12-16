function x = checker(x,data)

nantenna = data.nantenna;
nserver = data.nserver;
big = data.bigserver;
cap = data.cap;
sumperserver = [];
ghzan = data.ghzantenna;
ghzser = data.ghzserver;

for i = 1:nserver
    numi = histc(x,unique(i));
    s=find(x==i);
  if numi > cap(i)
    s = s(1+cap(i):end);
    x(s) = randi(nserver,1,1);  
  end
  
end


end