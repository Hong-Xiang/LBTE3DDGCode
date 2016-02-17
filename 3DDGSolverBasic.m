function u = 3DDGSolverBasic()
%3DDGSOLVER Solver for equation:
% \Omega \cdot \nabla u + \sigma u = q
    A = AssembleA();
    b = Assembleb();
    udg = A\b;
    u1d = DGvector2ScalarFlux(udg);
    u = Vector1D23D(u1d);
end

