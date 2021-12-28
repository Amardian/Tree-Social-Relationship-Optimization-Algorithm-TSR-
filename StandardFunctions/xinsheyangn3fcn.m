function scores = xinsheyangn3fcn(x, beta, m)
   if nargin < 2
       beta = 15;
   end
   if nargin < 3
       m = 5;
   end
   
   scores = exp(-sum((x / beta).^(2*m), 2)) - (2 * exp(-sum(x .^ 2, 2)) .* prod(cos(x) .^ 2, 2));
end 