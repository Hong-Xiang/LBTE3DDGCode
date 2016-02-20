function [x, y, z, u] = Solver()
GlobalSettings;
StartUp3D;
x = []; y=[]; z=[]; u=[];
uc = A\b;
global NX NY NZ NP
for ix = 1 : NX
    for iy = 1 : NY
        for iz = 1 : NZ
            ie = IndexIXIYIZ2IElement(ix, iy, iz);
            il = 1 : NP^3;
            ie = ones(size(il))*ie;
            ig = IndexLocal2Global(ie, il);
            us = uc(ig);
            [xt, yt, zt, ut] = GetSolutionValueElement(us, ix, iy, iz);
            x = cat(1, x, xt); y = cat(1, y,yt); z = cat(1, z, zt); u = cat(1, u,ut);
        end
    end
end
end