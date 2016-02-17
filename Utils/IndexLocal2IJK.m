function [i, j, k] = IndexLocal2IJK(l)
global NP
[i, j, k] = ind2sub([NP, NP, NP], l);
end

