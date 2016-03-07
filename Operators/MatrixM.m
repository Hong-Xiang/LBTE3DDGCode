function M = MatrixM()
global NX NY NZ NP
M_local = MatrixMLocal();
% M = sparse(NX*NY*NZ*NP^3,NX*NY*NZ*NP^3, NP^3);
M = zeros(NX*NY*NZ*NP^3);
for ix = 1 : NX
    for iy = 1 : NY
        for iz = 1 : NZ
            ie = IndexIXIYIZ2IElement(ix, iy, iz);
            il = 1 : NP^3;
            ie = ie*ones(size(il));
            ig = IndexLocal2Global(ie, il);
            M(ig,ig) = M_local;
        end
    end
end
% M = sparse(M);

end

