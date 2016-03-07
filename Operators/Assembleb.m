function b = Assembleb()
global NX NY NZ NP
b = zeros(NX*NY*NZ*NP^3,1);
for ix = 1 : NX
    for iy = 1 : NY
        for iz = 1 : NZ
            ie = IndexIXIYIZ2IElement(ix, iy, iz);
            il = 1 : NP^3;
            ig = IndexLocal2Global(ie*ones(size(il)), il);
            b(ig) = b(ig) + QTerm(ix, iy, iz);
            b(ig) = b(ig) + BTerm(ix, iy, iz);
        end
    end
end
end

