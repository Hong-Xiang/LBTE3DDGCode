function BKT = BKT()
global NP alpha eta hx hy hz
BKT = zeros(NP^3);
for i = 1 : NP
    for j = 1 : NP
        for kI = 1 : NP
            for kJ = 1 : NP
                I = IndexIJK2Local(i, j, kI);
                J = IndexIJK2Local(i, j, kJ);
                BKT(I,J) = (1-alpha)*eta*LegendreBasis(kI-1, 1)*LegendreBasis(kJ-1,1)*hx*hy/4;
            end
        end
    end
end
% BKT = sparse(BKT);
end

