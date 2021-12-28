function scores = xinsheyangn2fcn(x)
    n = size(x, 2);
    
    scores = sum(abs(x), 2) .* exp(-sum(sin(x .^2), 2));
end 