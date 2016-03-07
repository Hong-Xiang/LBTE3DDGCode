[x, y, z, uc] = Solver;
ua = uf(x, y, z);
CompareSlice(uc, ua, x, y, z==0);