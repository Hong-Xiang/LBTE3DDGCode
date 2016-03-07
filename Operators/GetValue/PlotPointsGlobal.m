function [xg, yg, zg] = PlotPointsGlobal(ix, iy, iz)
global NXP NYP NZP xc yc zc hx hy hz
xa = linspace(xc(ix)-hx/2,xc(ix)+hx/2,NXP);
ya = linspace(yc(iy)-hy/2,yc(iy)+hy/2,NYP);
za = linspace(zc(iz)-hz/2,zc(iz)+hz/2,NZP);
[xg, yg, zg] = ndgrid(xa, ya, za);
xg = xg(:);
yg = yg(:);
zg = zg(:);
end

