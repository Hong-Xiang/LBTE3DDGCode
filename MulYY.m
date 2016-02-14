function v = MulYY(ang1, ang2, l)
        phi1 = atan2(ang1(2), ang1(1));
        phi2 = atan2(ang2(2), ang2(1));
        ct1 = ang1(3);
        ct2 = ang2(3);
        v = 0;
        for m = -l : l
            v = v + 2*pi/sqrt(l+1/2)*SphericalHarmonicBasis(ang1(1), ang1(2), ang1(3), l, m) * conj(SphericalHarmonicBasis(ang2(1), ang2(2), ang2(3), l, m));
        end
    end