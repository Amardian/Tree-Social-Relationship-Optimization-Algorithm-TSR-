
function [z, sol]=MyCost(sol,data)

    sol=ParseSolution(sol,data);
    
    beta=100;
    sol.fit=sol.L*(1+beta*sol.Violation);

end