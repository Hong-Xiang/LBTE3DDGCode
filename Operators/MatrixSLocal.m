function S = MatrixSLocal()
global NP mu xi eta hx hy hz;
PdPResult = zeros(NP);
for i = 1 : NP
    for j = 1 : NP
        PdpResult(i,j) = Pdp(i, j);
    end
end
S = zeros(NP^3);
for I = 1 : NP^3
    for J = 1 : NP^3
        [iI, jI, kI] = IndexLocal2IJK(I);
        [iJ, jJ, kJ] = IndexLocal2IJK(J);
        S(I,J) = mu*hy*hz*PdPResult(iI,iJ) + xi*hx*hz*PdPResult(jI,jJ) + eta*hx*hy*PdPResult(kI,kJ);
    end
end
S = sparse(S);
end

