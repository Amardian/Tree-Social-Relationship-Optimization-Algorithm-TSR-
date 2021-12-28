function scores = quarticfcn(x)

    n = size(x, 2);
    
    scores = 0;
    for i = 1:n
        scores = scores + i *(x(:, i) .^ 4);
    end
     
    scores = scores + rand;
end