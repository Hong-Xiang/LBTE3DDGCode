function BKB = BKB()
global NP alpha mu hx hy hz
BKB = zeros(NP^3);
for iI = 1 : NP
    for iJ = 1 : NP
        for j = 1 : NP
            for k = 1 : NP
                I = IndexIJK2Local(iI, j, k);
                J = IndexIJK2Local(iJ, j, k);
                BKB(I,J) = alpha*mu*LegendreBasis(iI-1, -1)*LegendreBasis(iJ-1,-1)*hy*hz/4;
            end
        end
    end
end
% BKB = sparse(BKB);
end

