function [xl, yl, zl] = PlotPointsLocal(ix, iy, iz)
global NXP NYP NZP xc yc zc
xa = linspace(-1,1,NXP);
ya = linspace(-1,1,NYP);
za = linspace(-1,1,NZP);
[xl, yl, zl] = ndgrid(xa, ya, za);
xl = xl(:);
yl = yl(:);
zl = zl(:);
end

