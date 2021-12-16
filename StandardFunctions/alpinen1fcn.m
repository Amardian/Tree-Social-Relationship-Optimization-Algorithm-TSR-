function scores = alpinen1fcn(x)
     scores = sum(abs(x .* sin(x) + 0.1 * x), 2);
end 