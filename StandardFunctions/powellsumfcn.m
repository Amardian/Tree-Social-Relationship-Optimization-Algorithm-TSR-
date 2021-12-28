function scores = powellsumfcn(x)
    n = size(x, 2);
    absx = abs(x);
    
    scores = 0;
    for i = 1:n
        scores = scores + (absx(:, i) .^ (i + 1));
    end
end