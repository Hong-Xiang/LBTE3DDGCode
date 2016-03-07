function l = IndexIJK2Local(i, j, k)
global NP
l = sub2ind([NP,NP,NP], i, j, k);
end

