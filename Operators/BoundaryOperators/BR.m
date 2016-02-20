function BR = BR()
global NP alpha xi hx hy hz
BR = zeros(NP^3);
for i = 1 : NP
    for jI = 1 : NP
        for jJ = 1 : NP
            for k = 1 : NP
                I = IndexIJK2Local(i, jI, k);
                J = IndexIJK2Local(i, jJ, k);
                BR(I,J) = alpha*xi*LegendreBasis(jI-1, -1)*LegendreBasis(jJ-1,1)*hx*hz/4;
            end
        end
    end
end
% BR = sparse(BR);
end

