import itertools
from matrix_tools import *

"""
    This program creates a list of all the possible combinations of an nxn matrix witch coefficients
    are {-1,0,1}. It then evaluates the determinant of every matrix and saves the matrices that have
    a determinant of 1 or -1.
"""


def create_nxn_matrices(n):
    """
        Returns a list of all possible nxn matrices with coefficients of
        -1, 0, or 1
        list contains 3^n elements
    """
    matrix_form = []
    matrices_list = itertools.product({-1, 0, 1}, repeat=(n * n))
    for matrix in matrices_list:
        matrix_form.append(numpy.reshape(numpy.array(matrix), (n, n)))

    print "Created " + str(len(matrix_form)) + " Matrices"
    return matrix_form


det_of_one = []
detOfNegOne = []
detOfBoth = []
matrices = create_nxn_matrices(3)
for e in matrices:
    if det_is_n(1, e):
        detOfBoth.append(e)
        det_of_one.append(e)
    elif det_is_n(-1, e):
        detOfBoth.append(e)
        detOfNegOne.append(e)

print "Determinants of 1: " + str(len(det_of_one))
print "Determinants of -1: " + str(len(detOfNegOne))
print "Total: " + str(len(detOfBoth))
save_matrix(detOfBoth, "pg_comp/Data/AllDetOfOne.txt")
