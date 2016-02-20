function q = qf(x, y, z)
global testCase mu xi eta sigma
if testCase == 0
    q = sigma*ones(size(x));
end
if testCase == 1
    q = ones(size(x)).*(3*mu.*x.^2)+sigma*(x.^3);
end
if testCase == 2
    q = ones(size(x))*(eta)+sigma*(z);
end
if testCase == 3
    q = ones(size(x))*(mu+xi+eta)+sigma*(x+y+z);
end
if testCase == 4
    q = ones(size(x)).*(mu+2*xi*y+3*eta*z.^2)+sigma*(x+y.^2+z.^3);
end
if testCase == 5
    q = ones(size(x))*(mu)+sigma*(x);
end
if testCase == 6
    r = (x.^2 + y.^2 + z.^2).^(1/2);
    u = exp(-r);    
    q = -(mu*x + xi*y + eta*z)./r.*u + sigma*u;
    q(r==0) = sigma*u(r==0);
end
if testCase == 7
    q = mu*cos(x)+sigma*uf(x,y,z);
end
end

