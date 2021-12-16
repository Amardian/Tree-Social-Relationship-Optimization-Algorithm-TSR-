function scores = happycatfcn(x, alpha)

    if nargin < 2 
        alpha = 0.5;
    end
    
    n = size(x, 2);
    x2 = sum(x .* x, 2);
    scores = ((x2 - n).^2).^(alpha) + (0.5*x2 + sum(x,2))/n + 0.5;
end