function [x, y, z, u] = GetSolutionValueElement(uv, ix, iy, iz)
global NP NXP NYP NZP
u = zeros(NXP*NYP*NZP,1);
for il = 1 : NP^3
    [i, j, k] = IndexLocal2IJK(il);
    [xl, yl, zl] = PlotPointsLocal(ix, iy, iz);
    [x, y, z] = PlotPointsGlobal(ix, iy, iz);
    u = u + LegendreBasis(i-1,xl).*LegendreBasis(j-1,yl).*LegendreBasis(k-1,zl)*uv(il);
end
end

