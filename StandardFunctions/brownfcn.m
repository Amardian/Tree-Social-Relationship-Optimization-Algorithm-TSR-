function scores = brownfcn(x)
    
    n = size(x, 2);  
    scores = 0;
    
    x = x .^ 2;
    for i = 1:(n-1)
        scores = scores + x(:, i) .^ (x(:, i+1) + 1) + x(:, i+1).^(x(:, i) + 1);
    end
end