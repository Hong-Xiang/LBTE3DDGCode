function v = JacobiPolynomial(n, a, b, x)
gamma0 = 2^(a+b+1)/(a+b+1) * factorial(a) * factorial(b) / factorial(a + b);
assert(numel(size(x))==2, 'x must be vector');
if size(x,2) > 1
    x = x';
end
assert(size(x,1) == numel(x), 'x must be vector');
p0 = 1/sqrt(gamma0)*ones(size(x));
if n == 0
    v = p0;
    return;
end
gamma1 = (a+1)*(b+1)/(a+b+3)*gamma0;
p1 = ((a+b+2)/2*x + (a-b)/2)/sqrt(gamma1);
if n == 1
    v = p1;
    return;
end

aold = 2/(2+a+b)*sqrt((a+1)*(b+1)/(a+b+3));

for i = 1 : n-1
    h = 2*i+a+b;
    anew = 2/(h+2)*sqrt( (i+1)*(i+1+a+b)*(i+1+a)*(i+1+b)/(h+1)/(h+3));
    bnew = -(a^2-b^2)/h/(h+2);
    p = 1/anew*(-aold*p0 + (x-bnew).*p1);
    aold = anew;
    p0 = p1;
    p1 = p;
end
v = p;

end

