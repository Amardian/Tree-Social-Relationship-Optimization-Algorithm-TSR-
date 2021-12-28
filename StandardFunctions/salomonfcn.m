function scores = salomonfcn(x)
    x2 = x .^ 2;
    sumx2 = sum(x2, 2);
    sqrtsx2 = sqrt(sumx2);
    
    scores = 1 - cos(2 .* pi .* sqrtsx2) + (0.1 * sqrtsx2);
end