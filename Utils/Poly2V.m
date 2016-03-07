function f = Poly2V(x, y, a)
[n1, n2] = size(a);
f = zeros(size(x));
for i = 0 : n1-1
    for j = 0 : n2-1
        f = f + a(i+1,j+1)*x.^i.*y.^j;
    end
end
end

