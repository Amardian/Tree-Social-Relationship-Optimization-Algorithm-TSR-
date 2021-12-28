function scores = styblinskitankfcn(x)
    n = size(x, 2);
    scores = 0;
    for i = 1:n
        scores = scores + ((x(:, i) .^4) - (16 * x(:, i) .^ 2) + (5 * x(:, i)));
    end
    scores = 0.5 * scores;
end