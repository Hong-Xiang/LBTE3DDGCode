function S = MatrixSLocal()
global NP mu xi eta hx hy hz;
PdPResult = zeros(NP);
for i = 1 : NP
    for j = 1 : NP
        PdPResult(i,j) = PdP(i-1, j-1);
    end
end
S = zeros(NP^3);
for I = 1 : NP^3
    for J = 1 : NP^3
        [iI, jI, kI] = IndexLocal2IJK(I);
        [iJ, jJ, kJ] = IndexLocal2IJK(J);
        if (jI==jJ && kI==kJ)
            S(I,J) = S(I,J) + mu*hy*hz/4*PdPResult(iI,iJ);
        end
        if (iI==iJ) && (kI == kJ)
            S(I,J) = S(I,J) + xi*hx*hz/4*PdPResult(jI,jJ);
        end
        if (iI == iJ) && (jI == jJ)
            S(I,J) = S(I,J) + eta*hx*hy/4*PdPResult(kI,kJ);
        end
    end
end
% S = sparse(S);
end

