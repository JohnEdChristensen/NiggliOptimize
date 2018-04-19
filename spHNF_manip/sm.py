def sm_33(n):
    """Finds the symmetry preserving HNFs for the simple monoclinic
    lattices with a determinant of n. Assuming A =
    a1 = {-0.5, -2.0, -2.0};
a2 = {0.0, -2.0, 0.0};
a3 = {2.0, 0.0, 0.0};


    Args:
        n (int): The determinant of the HNFs.

    Returns:
        srHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    srHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        if (2*c)%a == 0:
            HNF = [[a,0,0],[b,c,0],[d,e,f]]
            srHNFs.append(HNF)

    return srHNFs

def sm_33_old(n):
    """Finds the symmetry preserving HNFs for the simple monoclinic
    lattices with a determinant of n. Assuming A =
    [[2,0,0],[0,2,0],[0.5,0,2]].

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        srHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    srHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        #beta1 condition
        if c%2==0:
            bs = [0,c/2]
        else:
            bs = [0]
        #gamma2 condition
        if f%2==0:
            es = [0,f/2]
        else:
            es = [0]

        for b in bs:
            for e in es:
                #gamma1 condition and gamma1 condition
                gamma12 = 2*b*e/float(c)
                if gamma12%f==0:
                    for d in range(f):
                        HNF = [[a,0,0],[b,c,0],[d,e,f]]
                        srHNFs.append(HNF)

    return srHNFs
def sm_35(n):
    """Finds the symmetry preserving HNFs for the simple monoclinic
    lattices with a determinant of n. Assuming A =
    a1 = {-0.668912,1.96676,-1.29785};
    a2 = {-2.286942,2.584794,-0.29785};
    a3 = {-1.0,-1.0,-1.0};

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        srHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    srHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        #beta12 condition
        if c%2==0:
            bs = [0,c/2]
        else:
            bs = [0]
        #gamma22 condition
        if f%2==0:
            es = [0,f/2]
        else:
            es = [0]
        for e in es:
            for b in bs:
                g12 = (2 * b * e) / float(c)
                if g12%f == 0:
                    for d in range(f):
                        HNF = [[a,0,0],[b,c,0],[d,e,f]]
                        srHNFs.append(HNF)

    return srHNFs

def sm_35_2(n):
    """Finds the symmetry preserving HNFs for the simple monoclinic
    lattices with a determinant of n. Assuming A =
    a1 = {-0.668912,1.96676,-1.29785};
    a2 = {1.61803,-0.618034,-1.0};
    a3 = {1.0,1.0,1.0};

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        srHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    srHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        #gamme12 and gamma22
        if f%2==0:
            ds = [0,f/2]
            es = [0,f/2]
        else:
            ds = [0]
            es = [0]
        for e in es:
            for d in ds:
                for b in range(c):
                    HNF = [[a,0,0],[b,c,0],[d,e,f]]
                    srHNFs.append(HNF)

    return srHNFs

def sm_35_3(n):
    """Finds the symmetry preserving HNFs for the simple monoclinic
    lattices with a determinant of n. Assuming A =
    a1 = {0.331088,2.96676,-0.29785};
    a2 = {1.61803,-0.618034,-1.0};
    a3 = {-1.0,-1.0,-1.0};

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        srHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    srHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        #beta12 condition
        if f%2==0:
            es = [0,f/2]
        else:
            es = [0]
        for e in es:
            for d in range(f):
                g11 = -2 * a + 2 * d
                if g11%f == 0:
                    for b in range(c):
                        HNF = [[a,0,0],[b,c,0],[d,e,f]]
                        srHNFs.append(HNF)

    return srHNFs

def sm_35_4(n):
    """Finds the symmetry preserving HNFs for the simple monoclinic
    lattices with a determinant of n. Assuming A =
    a1 = {0.331088,2.96676,-0.29785};
    a2 = {1.61803,-0.618034,-1.0};
    a3 = {0.668912,-1.96676,1.29785};

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        srHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    srHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        #beta12 condition
        if c%2==0:
            bs = [0,c/2]
        else:
            bs = [0]
        for b in bs:
            for d in range(f):
                for e in range(f):
                    g11 = -2 * a + 2 * d - (2 * b * e / c)
                    if g11%f == 0:
                        HNF = [[a,0,0],[b,c,0],[d,e,f]]
                        srHNFs.append(HNF)

    return srHNFs

def sm_35_5(n):
    """
    Finds the symmetry preserving HNFs for the simple monoclinic
    lattices with a determinant of n. Assuming A =
    a1 = {1,1,1}
    a2 = {1.61803,-0.618034,-1}
    a3 = {-0.668912,1.96676,-1.29785}

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        srHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    srHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        #alpha 3
        if (2*f)%a == 0:
            for e in range(f):
                #alpha 2
                if (2*e)%a == 0:
                    for b in range(c):
                        b21 = 2 * e - (2 * b * e / float(a))
                        b31 = 2 * f - (2 * b * f / float(a))
                        if b21%c == 0 and b31%c == 0:
                            for d in range(f):
                                if (2*d)%a == 0:
                                    b11 = -2*a+2*b+2*d-(2*b*d/float(a))
                                    if b11%c == 0:
                                        g21 = ((-2*d*e)/float(a)) - ((e * (2*e-(2*b*e/a))/float(c)))
                                        if g21%f == 0:
                                            g11 = 2*d - ((2*d*d)/float(a))-((b11 * e) / float(c))
                                            if g11%f == 0:
                                                HNF = [[a,0,0],[b,c,0],[d,e,f]]
                                                srHNFs.append(HNF)

    return srHNFs
