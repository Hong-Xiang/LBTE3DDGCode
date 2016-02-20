function BT = BT()
global NP alpha eta hx hy hz
BT = zeros(NP^3);
for i = 1 : NP
    for j = 1 : NP
        for kI = 1 : NP
            for kJ = 1 : NP
                I = IndexIJK2Local(i, j, kI);
                J = IndexIJK2Local(i, j, kJ);
                BT(I,J) = alpha*eta*LegendreBasis(kI-1, -1)*LegendreBasis(kJ-1,1)*hx*hy/4;
            end
        end
    end
end
% BT = sparse(BT);
end

