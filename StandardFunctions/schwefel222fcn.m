function scores = schwefel222fcn(x)

    absx = abs(x);
    scores = sum(absx, 2) + prod(absx, 2);
end