function scores = exponentialfcn(x)
   x2 = x .^2;
   
   scores = -exp(-0.5 * sum(x2, 2));
end