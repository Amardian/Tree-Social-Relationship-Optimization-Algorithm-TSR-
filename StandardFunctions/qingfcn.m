function scores = qingfcn(x)
    n = size(x, 2);
    x2 = x .^2;
    
    scores = 0;
    for i = 1:n
        scores = scores + (x2(:, i) - i) .^ 2;
    end
end 