function v = PdP(i, j)
%PDP Calculate \int_-1^1 P_i(r) dP_j(r)/dr dr
global MAX_INTEGRAL_ERROR;
Npre = max(i,j)*2;
err = MAX_INTEGRAL_ERROR*10;
while err > MAX_INTEGRAL_ERROR
[x, w] = GaussianQ(-1, 1, 0, 0, Npre);
p = LegendreBasis(i, x);
dp = DLegendreBasis(j, x);
IntResPre = sum(p.*w.*dp);
Ninc = Npre * 2;
[x, w] = GaussianQ(-1, 1, 0, 0, Ninc);
p = LegendreBasis(i, x);
dp = DLegendreBasis(j, x);
IntResInc = sum(p.*w.*dp);
err = abs(IntResInc-IntResPre);
end
v = IntResInc;
end

