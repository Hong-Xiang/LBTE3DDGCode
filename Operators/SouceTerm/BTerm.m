function b = BTerm(ix, iy, iz)
global NX NY NZ NP hx hy hz xc yc zc Q2V1 Q2V2 Q2W mu xi eta;
b = zeros(NP^3, 1);
if ix == 1
    X = xc(ix)-hx/2;
    Y = Q2V1*hy/2 + yc(iy);
    Z = Q2V2*hz/2 + zc(iz);
    X = ones(size(Y))*X;
    uv = mu*uf(X, Y, Z);
    for i = 1 : NP
        for j = 1 : NP
            for k = 1 : NP
                l = LegendreBasis(i-1, -1)*LegendreBasis(j-1, Q2V1).*LegendreBasis(k-1,Q2V2);
                b(IndexIJK2Local(i,j,k)) = b(IndexIJK2Local(i,j,k)) + sum(uv.*l.*Q2W)*hy*hz/4;
            end
        end
    end
end
if ix == NX
    X = xc(ix)+hx/2;
    Y = Q2V1*hy/2 + yc(iy);
    Z = Q2V2*hz/2 + zc(iz);
    X = ones(size(Y))*X;
    uv = mu*uf(X, Y, Z);
    for i = 1 : NP
        for j = 1 : NP
            for k = 1 : NP
                l = LegendreBasis(i-1, 1)*LegendreBasis(j-1, Q2V1).*LegendreBasis(k-1,Q2V2);
                b(IndexIJK2Local(i,j,k)) = b(IndexIJK2Local(i,j,k)) - sum(uv.*l.*Q2W)*hy*hz/4;
            end
        end
    end
end
if iy == 1
    Y = yc(iy)-hy/2;
    X = Q2V1*hx/2 + xc(ix);
    Z = Q2V2*hz/2 + zc(iz);
    Y = ones(size(X))*Y;
    uv = xi*uf(X, Y, Z);
    for i = 1 : NP
        for j = 1 : NP
            for k = 1 : NP
                l = LegendreBasis(i-1, Q2V1)*LegendreBasis(j-1, -1).*LegendreBasis(k-1,Q2V2);
                b(IndexIJK2Local(i,j,k)) = b(IndexIJK2Local(i,j,k)) + sum(uv.*l.*Q2W)*hx*hz/4;
            end
        end
    end
end
if iy == NY
    Y = yc(iy) + hy/2;
    X = Q2V1*hx/2 + xc(ix);
    Z = Q2V2*hz/2 + zc(iz);
    Y = ones(size(X))*Y;
    uv = xi*uf(X, Y, Z);
    for i = 1 : NP
        for j = 1 : NP
            for k = 1 : NP
                l = LegendreBasis(i-1, Q2V1)*LegendreBasis(j-1, 1).*LegendreBasis(k-1,Q2V2);
                b(IndexIJK2Local(i,j,k)) = b(IndexIJK2Local(i,j,k)) - sum(uv.*l.*Q2W)*hx*hz/4;
            end
        end
    end
end
if iz == 1
    Z = zc(iz)-hz/2;
    Y = Q2V1*hy/2 + yc(iy);
    X = Q2V2*hx/2 + xc(ix);
    Z = ones(size(Y))*Z;
    uv = eta*uf(X, Y, Z);
    for i = 1 : NP
        for j = 1 : NP
            for k = 1 : NP
                l = LegendreBasis(i-1, Q2V2).*LegendreBasis(j-1, Q2V1)*LegendreBasis(k-1,-1);
                b(IndexIJK2Local(i,j,k)) = b(IndexIJK2Local(i,j,k)) + sum(uv.*l.*Q2W)*hy*hx/4;
            end
        end
    end
end
if iz == NZ
    Z = zc(iz)+hz/2;
    Y = Q2V1*hy/2 + yc(iy);
    X = Q2V2*hx/2 + xc(ix);
    Z = ones(size(Y))*Z;
    uv = eta*uf(X, Y, Z);
    for i = 1 : NP
        for j = 1 : NP
            for k = 1 : NP
                l = LegendreBasis(i-1, Q2V2).*LegendreBasis(j-1, Q2V1)*LegendreBasis(k-1,1);
                b(IndexIJK2Local(i,j,k)) = b(IndexIJK2Local(i,j,k)) - sum(uv.*l.*Q2W)*hy*hx/4;
            end
        end
    end
end
end

