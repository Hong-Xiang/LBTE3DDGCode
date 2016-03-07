function f = Poly3V(x, y, z, a)
[n1, n2, n3] = size(a);
f = zeros(size(x));
for i = 0 : n1-1
    for j = 0 : n2-1
        for k = 0 : n3-1
            f = f + a(i+1,j+1, k+1)*x.^i.*y.^j.*z.*k;
        end
    end
end
end

