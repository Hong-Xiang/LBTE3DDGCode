function v = InnerProduct(f, l, x0, x1, y0, y1, z0, z1)
global Q3V1 Q3V2 Q3V3 Q3W
[i, j, k] = IndexLocal2IJK(l);
lv = LegendreBasis(i, Q3V1).*LegendreBasis(j, Q3V2).*LegendreBasis(k, Q3V3);
X = (x0+x1)/2 + (x1-x0)*Q3V1;
Y = (y0+y1)/2 + (y1-y0)*Q3V2;
Z = (z0+z1)/2 + (z1-z0)*Q3V3;
fv = f(X, Y, Z);
v = sum(lv.*fv.*Q3W)/8*(x1-x0)*(y1-y0)*(z1-z0);
end

