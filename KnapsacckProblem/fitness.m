function sol=fitness(sol,data)

x=sol.x;
N=data.n;
val = data.val;




Z=0;
for k=1:N
    i=x(k);
    vali=val(k);
    Z=Z+dot(i,vali);
end


sol.fit=Z;



end
