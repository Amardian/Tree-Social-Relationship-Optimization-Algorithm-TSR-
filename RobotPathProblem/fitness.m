function sol =fitness(sol,data)

L=ParseSolution(sol,data);
sol.fit=L.L;
end
