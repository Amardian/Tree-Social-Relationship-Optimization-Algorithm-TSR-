function sol=weightcom(sol,data)
x=sol.x;
n=data.n;
weight = data.weight;
capacity = data.capacity;




W=0;

while W<capacity
for k=1:n
       i=x(k);
       weighti=weight(k);
       W=W+dot(i,weighti);
       if W>capacity
          break 
       end
       WX = W;
end
   x = abs(x-1); 
end


sol.w=WX;



end
