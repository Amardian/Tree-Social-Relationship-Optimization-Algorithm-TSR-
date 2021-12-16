function sol=fitness(sol,data)

x=sol.x;
Dis=data.dis;
N=data.n;

x=[x x(1)];
Z=0;
for k=1:N
    i=x(k);
    j=x(k+1);
    Z=Z+Dis(i,j);
end


sol.fit=Z;



end
