def rhom_24(n):
    """Finds the symmetry preserving HNFs for the rhombohedral lattice
    that matches niggli conditions for niggli cell number 24
    with a determinant of n. Assuming A =
a1 = {-0.744078, 1.44338, -1.92259};
a2 = {1.0, 0.0, 1.0};
a3 = {-1.255918, 1.44338, -0.077412};

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        spHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    spHNFs = []
    a_ = 0
    b_ = 0
    c_ = 0
    d_ = 0
    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]
        b = 0

        if f%a==0 and (2*a)%c == 0:
            for d in range(f):
                if d%a == 0:
                    for e in range(f):
                        if e%a == 0:
                            g11 = a + 2*d - ((-2*a)*e / float(c))
                            g12 = 2*d + (d*d/float(a))
                            g22 = 2*e + (d*e/float(a))
                            if g11%f ==0 and g12%f == 0 and g22%f == 0:
                                HNF = [[a,0,0],[b,c,0],[d,e,f]]
                                spHNFs.append(HNF)

    return spHNFs
