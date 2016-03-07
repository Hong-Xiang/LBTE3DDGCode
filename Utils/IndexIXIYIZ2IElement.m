function ie = IndexIXIYIZ2IElement(ix, iy, iz)
global NX NY NZ;
    ie = sub2ind([NX, NY, NZ], ix, iy, iz);
end

