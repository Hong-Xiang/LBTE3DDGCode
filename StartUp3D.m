clear;
GlobalSettings;

global xc yc zc;

global NX NY NZ hx hy hz;
x0 = -NX*hx/2; x1 = NX*hx/2;
y0 = -NY*hy/2; y1 = NY*hy/2;
z0 = -NZ*hz/2; z1 = NZ*hz/2;
xc = x0 + hx/2 : hx : x1-hx/2;
yc = y0 + hy/2 : hy : y1-hy/2;
zc = z0 + hz/2 : hz : z1-hz/2;

global Q2V1 Q2V2 Q2W;
global Q3V1 Q3V2 Q3V3 Q3W;

global NP;
INTEGRAL_ORDER = 4*NP;

[GQX, GQW] = GaussianQ(-1, 1, 0, 0, INTEGRAL_ORDER);
[Q2V1, Q2V2] = ndgrid(GQX, GQX);
[Q2W1, Q2W2] = ndgrid(GQW, GQW);
Q2V1 = Q2V1(:);
Q2V2 = Q2V2(:);
Q2W = Q2W1.*Q2W2;
Q2W = Q2W(:);

[Q3V1, Q3V2, Q3V3] = ndgrid(GQX, GQX, GQX);
[Q3W1, Q3W2, Q3W3] = ndgrid(GQW, GQW, GQW);
Q3W = Q3W1.*Q3W2.*Q3W3;
Q3V1 = Q3V1(:);
Q3V2 = Q3V2(:);
Q3V3 = Q3V3(:);
Q3W = Q3W(:);

global PPQ1 PPQ2
PPQ1 = zeros(NP);
for i = 1 : NP
    for j = 1 : NP
        PPQ1(i,j) = sum(LegendreBasis(i-1,GQX).*LegendreBasis(j-1,GQX).*GQW).*hx/2;
    end
end

A = AssembleA();
b = Assembleb();