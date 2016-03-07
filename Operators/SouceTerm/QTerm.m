function q = QTerm(ix, iy, iz)
global NP xc yc zc hx hy hz Q3V1 Q3V2 Q3V3 Q3W;
q = zeros(NP^3,1);
X = Q3V1*hx/2+xc(ix);
Y = Q3V2*hy/2+yc(iy);
Z = Q3V3*hz/2+zc(iz);
qV = qf(X, Y, Z);
for i = 1 : NP
    for j = 1 : NP
        for k = 1 : NP
            l = LegendreBasis(i-1, Q3V1).*LegendreBasis(j-1, Q3V2).*LegendreBasis(k-1, Q3V3);            
            q(IndexIJK2Local(i,j,k)) = sum(qV.*Q3W.*l)*hx*hy*hz/8;
        end
    end
end
end

