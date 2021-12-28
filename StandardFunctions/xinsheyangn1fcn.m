function scores = xinsheyangn1fcn(x)
    n = size(x, 2);

    scores = 0;
    for i = 1:n
        scores = scores + rand * (abs(x(:, i)) .^ i);
    end
end 