function u = uVec()
global NX NY NZ NP;
u = zeros(NX*NY*NZ*NP^3,1);
for ix = 1 : NX
    for iy = 1 : NY
        for iz = 1 : NZ
            ie = IndexIXIYIZ2IElement(ix, iy, iz);
            il = 1 : NP^3;
            ie = ie*ones(size(il));
            ig = IndexLocal2Global(ie, il);
            u(ig) = UTerm(ix, iy ,iz);
        end
    end
end

end

