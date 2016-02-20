function B = MatrixB()
global NX NY NZ NP
BBt = BB()';
BKBt = BKB()';
BFt = BF()';
BKFt = BKF()';
BLt = BL()';
BKLt = BKL()';
BRt = BR()';
BKRt = BKR()';
BUt = BU()';
BKUt = BKU()';
BTt = BT()';
BKTt = BKT()';


% B = sparse(NX*NY*NZ*NP^3,NX*NY*NZ*NP^3, NP^3*6);
B = zeros(NX*NY*NZ*NP^3);
for ix = 1 : NX
    for iy = 1 : NY
        for iz = 1 : NZ
            ie = IndexIXIYIZ2IElement(ix, iy, iz);
            il = 1 : NP^3;
            ie = ie*ones(size(il));
            if ix > 1                
                ieB = IndexIXIYIZ2IElement(ix-1, iy, iz);
                ieB = ieB*ones(size(il));
                igi = IndexLocal2Global(ie, il);
                igj = IndexLocal2Global(ieB,il);                                
                B(igi, igj) = B(igi,igj) + BBt;                
                B(igi, igi) = B(igi,igi) + BKBt;
            end
            if ix < NX
                ieF = IndexIXIYIZ2IElement(ix+1, iy, iz);
                ieF = ieF*ones(size(il));
                igi = IndexLocal2Global(ie, il);
                igj = IndexLocal2Global(ieF, il);                
                B(igi, igj) = B(igi,igj) - BFt;                
                B(igi, igi) = B(igi,igi) - BKFt;
            end
            if iy > 1
                ieL = IndexIXIYIZ2IElement(ix, iy-1, iz);
                ieL = ieL*ones(size(il));
                igi = IndexLocal2Global(ie, il);
                igj = IndexLocal2Global(ieL, il);
                B(igi, igj) = B(igi,igj) + BLt;                
                B(igi, igi) = B(igi,igi) + BKLt;
            end
            if iy < NY
                ieR = IndexIXIYIZ2IElement(ix, iy+1, iz);
                ieR = ieR*ones(size(il));
                igi = IndexLocal2Global(ie, il);
                igj = IndexLocal2Global(ieR, il);                
                B(igi, igj) = B(igi,igj) - BRt;               
                B(igi, igi) = B(igi,igi) - BKRt;
            end
            if iz > 1
                ieU = IndexIXIYIZ2IElement(ix, iy, iz-1);
                ieU = ieU*ones(size(il));
                igi = IndexLocal2Global(ie, il);
                igj = IndexLocal2Global(ieU, il);
                B(igi, igj) = B(igi,igj) + BUt;                
                B(igi, igi) = B(igi,igi) + BKUt;
            end
            if iz < NZ
                ieT = IndexIXIYIZ2IElement(ix, iy, iz+1);
                ieT = ieT*ones(size(il));
                igi = IndexLocal2Global(ie, il);
                igj = IndexLocal2Global(ieT, il);
                B(igi, igj) = B(igi,igj) - BTt;                
                B(igi, igi) = B(igi,igi) - BKTt;
            end
        end
    end
end
% B = sparse(B);
end

