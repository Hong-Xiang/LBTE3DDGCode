function BF = BF()
global NP alpha mu hx hy hz
BF = zeros(NP^3);
for iI = 1 : NP
    for iJ = 1 : NP
        for j = 1 : NP
            for k = 1 : NP
                I = IndexIJK2Local(iI, j, k);
                J = IndexIJK2Local(iJ, j, k);                
                BF(I,J) = alpha*mu*LegendreBasis(iI-1, -1)*LegendreBasis(iJ-1,1)*hy*hz/4;
            end
        end
    end
end
% BF = sparse(BF);
end

