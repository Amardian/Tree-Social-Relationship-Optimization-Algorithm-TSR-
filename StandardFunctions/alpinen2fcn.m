function scores = alpinen2fcn(x)
     scores = prod(sqrt(x) .* sin(x), 2);
end 