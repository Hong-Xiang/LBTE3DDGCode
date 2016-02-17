function v = IndexLocal2Global(ie, il)
global NX NY NZ NP;
    v = sub2ind([NX*NY*NZ, NP^3], ie, il);
end

