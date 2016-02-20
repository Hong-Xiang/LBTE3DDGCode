function u = uf(x, y, z)
global testCase
if testCase == 0
    u = ones(size(x));
end
if testCase == 1
    u = x.^3;
end
if testCase == 2
    u = z;
end
if testCase == 3
    u = x+y+z;
end
if testCase == 4
    u = x+y.^2+z.^3;
end
if testCase == 5
    u = x;
end
if testCase == 6
    r = (x.^2 + y.^2 + z.^2).^(1/2);
    u = exp(-r);
end
if testCase == 7
    u = sin(x);
end
end

