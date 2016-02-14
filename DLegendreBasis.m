function  d = DLegendreBasis(l, x)
if l == 0
    d = zeros(numel(x),1);
else
%     d = sqrt(l*(l+3))*JacobiPolynomial(l-1,1,1,x);
    d = sqrt(l*(l+1))*JacobiP(x, 1,1,l-1);
end
end

