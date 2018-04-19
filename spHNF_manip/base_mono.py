def base_mono_20(n):
    """Finds the symmetry preserving HNFs for the base centered monoclinic
    lattices with a determinant of n. Assuming A =
    a1 = {1.106536, 0.393466, 3.02006};
    a2 = {-0.342424, 1.342424, 2.02006};
    a3 = {-1.0, -1.0, 0.0};
    Args:
        n (int): The determinant of the HNFs.

    Returns:
        spHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    spHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        if c%2==0:
            bs = [0,c//2.]
        else:
            bs = [0]

        for b in bs:
            for e in range(f):
                g12 = -b-(2*b*e/c)
                if g12%f ==0:
                    g22 = -c-2*e
                    if g22%f == 0:
                        for d in range(f):
                            HNF = [[a,0,0],[b,c,0],[d,e,f]]
                            spHNFs.append(HNF)

    return spHNFs

def base_mono_28(n):
    """Finds the symmetry preserving HNFs for the base centered monoclinic
    lattices with a determinant of n. Assuming A =
    a1 = {1.106536, 0.393466, 3.02006};
    a2 = {-0.342424, 1.342424, 2.02006};
    a3 = {-1.0, -1.0, 0.0};
    Args:
        n (int): The determinant of the HNFs.

    Returns:
        spHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    spHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        for b in range(c):
            b12 = 2*a+2*b
            if b12%c == 0:
                for e in range(f):
                    if(c-2*e)%f == 0:
                        g12 = a+b-(b12*e/c)
                        if g12%f == 0:
                            for d in range(f):
                                HNF = [[a,0,0],[b,c,0],[d,e,f]]
                                spHNFs.append(HNF)

    return spHNFs
def base_mono_29(n):
    """Finds the symmetry preserving HNFs for the base centered monoclinic
    lattices with a determinant of n. Assuming A =
    a1 = {1.106536, 0.393466, 3.02006};
    a2 = {-0.342424, 1.342424, 2.02006};
    a3 = {-1.0, -1.0, 0.0};
    Args:
        n (int): The determinant of the HNFs.

    Returns:
        spHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    spHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        for b in range(c):
            b12 = 2*a+2*b
            if b12%c == 0:
                for e in range(f):
                    if(c-2*e)%f == 0:
                        g12 = a+b-(b12*e/c)
                        if g12%f == 0:
                            for d in range(f):
                                HNF = [[a,0,0],[b,c,0],[d,e,f]]
                                spHNFs.append(HNF)

    return spHNFs
def base_mono_43(n):
    """Finds the symmetry preserving HNFs for the base centered monoclinic
    lattices with a determinant of n. Assuming A = [[-0.39716,
    -0.34718, 2.49434], [ 2.64194, -0.14194, 0.  ], [-1.39716,
    -1.34718, 1.49434]].

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        spHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    spHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        if(f%c == 0):
            for d in range(f):
                b11 = a + d
                if b11%c == 0:
                    for e in range(f):
                        if e%c == 0:
                            g12 = 2 *a + 2 * d - (b11 * e/c)
                            g22 = 2 * e - (e * e/c)
                            if g12%f == 0 and g22%f == 0:
                                for b in range(c):
                                    HNF = [[a,0,0],[b,c,0],[d,e,f]]
                                    spHNFs.append(HNF)

    return spHNFs


def base_mono_29_30(n):
    """Finds the symmetry preserving HNFs for the base centered monoclinic
    lattices with a determinant of n. Assuming for basis 29 A =
    [[-0.666125, 1.16613, 2.04852 ],
       [1.61803, -0.618034, 1.0],
       [-1.0, -1.0, 0.0 ]], for basis 30 A =

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        spHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    spHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]
        #beta12
        if c%2==0:
            bs = [0,c//2.]
        else:
            bs = [0]

        for b in bs:
            for e in range(f):
                g12 = b - ((2 * b * e) / float(c))
                if g12%f==0:
                    g22 = c - (2 * e)
                    if g22%f == 0:
                        for d in range(f):
                            HNF = [[a,0,0],[b,c,0],[d,e,f]]
                            spHNFs.append(HNF)

    return spHNFs

def base_mono_29_30_legacy(n):
    """Finds the symmetry preserving HNFs for the base centered monoclinic
    lattices with a determinant of n. Assuming for basis 29 A =
    [[-0.666125, 1.16613 , 2.04852 ], [ 1.  , 1.  , 0.  ], [ 1.61803 ,
    -0.618034, 1.  ]], for basis 30 A = [[ 1.  , 1.  , 0.  ], [
    1.61803 , -0.618034 , 1.  ], [-0.0361373, 0.536137 , 2.38982 ]].
     Timing for det of 100,000 = 3.8100

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        spHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    spHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        if f%c==0:
            for e in range(0,f,c):
                g21 = 2*e+e*e/float(c)
                if g21%f==0:
                    for d in range(0,f,c):
                        g11 = 2*d+d*e/float(c)
                        if g11%f==0:
                            for b in range(c):
                                HNF = [[a,0,0],[b,c,0],[d,e,f]]
                                spHNFs.append(HNF)

    return spHNFs

def base_mono_37_39_incomplete(n):
    """
    Finds the symmetry preserving HNFs for the base centered monoclinic
    lattices with a determinant of n. Assuming for basis 37 A =, for basis 39 A =


    Args:
        n (int): The determinant of the HNFs.

    Returns:
        spHNFs (list of lists): The symmetry preserving HNFs.
    """


    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    spHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]
        #gamma 2
        if f%2==0:
            es = [0,f//2.]
        else:
            es = [0]

        for e in es:
            for b in range(c):
                b11 = a+2*b
                g11 = (b11 * e) / c
                if b11%c==0 and g11%f==0:
                    for d in range(f):
                        HNF = [[a,0,0],[b,c,0],[d,e,f]]
                        spHNFs.append(HNF)

    return spHNFs

def base_mono_37_39_legacy(n):
    """
    Finds the symmetry preserving HNFs for the base centered monoclinic
    lattices with a determinant of n. Assuming for basis 37 A =
    [[-1.79092 , -1.47209 , 0.790922], [ 1.  , 0.  , 1.  ], [ 1.  ,
    -1.41421 , -1.  ]], for basis 39 A = [[ 0.  , -1.73205 , -1.  ],
    [-1.66542, -0.672857, 1.66542], [1,0,1]].
    Timing for det of 100,000 = 2.54745.

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        spHNFs (list of lists): The symmetry preserving HNFs.
    """


    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    spHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]
        #gamma 2
        if f%2==0:
            es = [0,f//2.]
        else:
            es = [0]

        for e in es:
            for b in range(c):
                b11 = -a+2*b
                g11 = (b11 * e) / c
                if b11%c==0 and g11%f==0:
                    for d in range(f):
                        HNF = [[a,0,0],[b,c,0],[d,e,f]]
                        spHNFs.append(HNF)

    return spHNFs

def base_mono_37_39_41(n):
    """Finds the symmetry preserving HNFs for the base centered monoclinic
    lattices with a determinant of n. Assuming for basis 37 A =
    [[-1.79092,-1.47209,0.790922],[1.0,-1.41421,-1.0],[1.0,0.0,1.0]], for basis
    39 A = [[0, -1.73205,-1],[-1.66542, -0.672857, 1.66542], [1,0,1]], for
    basis 41 A = [[-1.85397, -0.854143, 1.35397],[1, 0, 1],[[1, -1.41421, -1]].

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        spHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    spHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]
        #gamma 2
        if f%2==0:
            es = [0,f//2.]
        else:
            es = [0]

        for e in es:
            for d in range(f):
                g11 = -a+2*d
                if g11%f==0:
                    for b in range(c):
                        HNF = [[a,0,0],[b,c,0],[d,e,f]]
                        spHNFs.append(HNF)

    return spHNFs
def base_mono_14(n):
    """Finds the symmetry preserving HNFs for the base centered monoclinic
    lattices with a determinant of n. Assuming A =
a1 = {0.5, -2.0, 2.0};
a2 = {-0.5, 0.0, -2.0};
a3 = {-1.0, 1.0, 0.0};

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        spHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    spHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        if f%a == 0:
            for b in range(c):
                b31 = f - (b*f/a)
                if b31%c == 0:
                    for d in range(f):
                        if d%a == 0:
                            b11 = -2*a+2*b+d - (b*d/a)
                            if b11%c == 0:
                                for e in range(f):
                                    if e%a == 0:
                                        b21 = e - (b*e/a)
                                        if b21%c == 0:
                                            g11 = 2*d - (d*d/a) - (b11 * e /c)
                                            if g11%f == 0:
                                                g21 = (-d*e/a) - (b21 * e/c)
                                                if g21%f == 0:
                                                    HNF = [[a,0,0],[b,c,0],[d,e,f]]
                                                    spHNFs.append(HNF)
    return spHNFs
def base_mono_10_17(n):
    """Finds the symmetry preserving HNFs for the base centered monoclinic
    lattices with a determinant of n. Assuming for basis 10 A =
    [[-1.46391, 0.  , 1.96391], [ 1.  , 1.  , 1.  ], [ 0.  , 2.  , 0.
    ]], for basis 17 A = [[-0.05387 , -0.61088 , 2.51474 ], [ 1.  , 1.
    , 1.  ], [ 1.809568, -0.15957 , 0.  ]].

    Args:
        n (int): The determinant of the HNFs.

    Returns:
        spHNFs (list of lists): The symmetry preserving HNFs.

    """

    from opf_python.universal import get_HNF_diagonals

    diags = get_HNF_diagonals(n)

    spHNFs = []

    for diag in diags:
        a = diag[0]
        c = diag[1]
        f = diag[2]

        if (2*c)%a == 0:
            for b in range(c):
                if 2*b%a == 0:
                    b11 = 2*b -(2*b*b/float(a))
                    if b11%c == 0:
                        for e in range(f):
                            for d in range(f):
                                g11 = -a +b + e*d - (2*b*d/float(a)) - (b11*e)/float(c)
                                g21 = c - (2*c*d/float(a))+(2*b*e/float(a))
                                if g11%f == 0 and g21%f ==0:
                                    HNF = [[a,0,0],[b,c,0],[d,e,f]]
                                    spHNFs.append(HNF)

    return spHNFs
