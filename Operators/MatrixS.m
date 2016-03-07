function S = MatrixS()
global NX NY NZ NP
S_localt = MatrixSLocal()';
% S = sparse(NX*NY*NZ*NP^3,NX*NY*NZ*NP^3, NP^3);
S = zeros(NX*NY*NZ*NP^3);
for ix = 1 : NX
    for iy = 1 : NY
        for iz = 1 : NZ
            ie = IndexIXIYIZ2IElement(ix, iy, iz);
            il = 1 : NP^3;
            ie = ie*ones(size(il));
            ig = IndexLocal2Global(ie, il);
            S(ig,ig) = S_localt;
        end
    end
end

end

