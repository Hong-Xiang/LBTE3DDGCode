StartUp3D;

%% Test Quad2D
global Q2V1 Q2V2 Q2W;
NTests = 1;
for iTest = 1 : NTests
    a = rand(8);
    ResultGoldStandard = integral2(@(x, y) Poly2V(x, y, a), -1, 1, -1, 1);
    ResultGQ = sum(Poly2V(Q2V1, Q2V2, a).*Q2W);
    error = abs(ResultGoldStandard-ResultGQ);
    assert(error < 1e-7);
end

%% Test Quad3D
global Q3V1 Q3V2 Q3V3 Q3W;
NTests = 1;
for iTest = 1 : NTests
    Npmax = 4;
    a = rand(Npmax, Npmax, Npmax);
%     a = zeros(2, 2, 2);
%     a(2, 1, 1) = 1;
%     a(1, 2, 1) = 1;
%     a(1, 1, 2) = 1;
    tic
    ResultGoldStandard = integral3(@(x, y, z) Poly3V(x, y, z, a), -1, 1, -1, 1, -1, 1);
    toc
    tic
    ResultGQ = sum(Poly3V(Q3V1, Q3V2, Q3V3, a).*Q3W);
    toc
    error = abs(ResultGoldStandard-ResultGQ);
    assert(error < 1e-7);
end