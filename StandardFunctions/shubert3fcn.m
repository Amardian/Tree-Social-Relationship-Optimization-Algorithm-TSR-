function scores = shubert3fcn(x)
    n = size(x, 2);
    
    scores = 0;
    for i = 1:n
        for j = 1:5
            scores = scores + j * sin(((j + 1) * x(:, i)) + j);
        end
    end
end