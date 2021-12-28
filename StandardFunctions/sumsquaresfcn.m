function scores = sumsquaresfcn(x)
   
   [m, n] = size(x);
   x2 = x .^2;
   I = repmat(1:n, m, 1);
   scores = sum( I .* x2, 2);
   
end