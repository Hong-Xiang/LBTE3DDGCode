function v = IndexLocal2Global(ie, il)
global NX NY NZ NP;
    v = sub2ind([NP^3, NX*NY*NZ], il, ie);
end

