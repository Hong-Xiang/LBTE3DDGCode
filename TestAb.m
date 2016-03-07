StartUp3D;
u = uVec();
bc = A*u;
idp = 1 : numel(bc);
S = MatrixS();
B = MatrixB();
global NX NY NZ NP
q = zeros(NX*NY*NZ*NP^3,1);
bn = zeros(NX*NY*NZ*NP^3,1);
for ix = 1 : NX
    for iy = 1 : NY
        for iz = 1 : NZ
            ie = IndexIXIYIZ2IElement(ix, iy, iz);
            il = 1 : NP^3;
            ie = ones(size(il))*ie;
            ig = IndexLocal2Global(ie, il);
            q(ig) = QTerm(ix,iy,iz);
            bn(ig) = BTerm(ix,iy,iz);
        end
    end
end

plot(idp, b, idp, bc,'.');
legend('b','A*u')