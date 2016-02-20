function M = MatrixMLocal()
global NP hx hy hz;
M = zeros(NP^3);
for i = 1 : NP
    for j = 1 : NP
        for k = 1 : NP
            I = IndexIJK2Local(i, j, k);
            M(I,I) = hx*hy*hz/8;
%             M(I,I) = 1;
        end
    end
end
end

