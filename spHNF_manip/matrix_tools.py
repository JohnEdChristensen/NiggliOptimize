import numpy
import itertools
import os


def calculate_transform(transform, basis):
    # basis = numpy.transpose(basis)
    transformed_matrix = numpy.dot(transform, basis)
    # return numpy.transpose(transformed_matrix).tolist()
    return transformed_matrix

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

def create_matrix(s1, s2, s3):
    """
    takes in 3 strings of 3 numbers seperated by commas
    returns a 3x3 matrix
    """
    row1 = s1.split()
    row1 = [float(i) for i in row1]
    row2 = s2.split()
    row2 = [float(i) for i in row2]
    row3 = s3.split()
    row3 = [float(i) for i in row3]
    matrix = [row1, row2, row3]
    return matrix


def det_is_n(expected_determinant, m):
    """
        returns a 1 if nxn matrix m has a determinant equal to expectedDeterminant
        returns a zero otherwise
    """
    det = numpy.linalg.det(m)
    return det == expected_determinant


def save_matrix(matrix_in, write_location):
    numpy.savetxt(write_location, numpy.vstack(matrix_in), fmt='%-8f')
    print "Saved " + str(len(matrix_in)) + " Matrices to " + write_location


def edit_struct_enum(struct_path, matrix):
    with open(struct_path, 'r') as struct_enum:
        struct_data = struct_enum.readlines()
    struct_data[2] = str(matrix[0][0]) + "\t" + str(matrix[0][1]) + "\t" + str(matrix[0][2]) + "\n"
    struct_data[3] = str(matrix[1][0]) + "\t" + str(matrix[1][1]) + "\t" + str(matrix[1][2]) + "\n"
    struct_data[4] = str(matrix[2][0]) + "\t" + str(matrix[2][1]) + "\t" + str(matrix[2][2]) + "\n"
    with open(struct_path, 'w') as struct_enum:
        struct_enum.writelines(struct_data)


def read_pg_out(pgx_path):
    pgx_path = open(pgx_path, "r")
    size = float(pgx_path.readline().split()[2])
    if size == 2 or size == 4 or size == 48 or size == 12:
        size = 2
    elif size == 8 or size == 16:
        size = 3
    else:
        print "ERROR PG SIZE UNKNOWN: " + str(size)

    matrix_list = []

    for i in range(0, int(size)):
        pgx_path.readline()
        row1 = pgx_path.readline()
        row2 = pgx_path.readline()
        row3 = pgx_path.readline()
        matrix_list.append(create_matrix(row1, row2, row3))
    int_matrix_list = []
    for e in matrix_list:
        int_matrix_list.append(matrix_float_to_int(e))
    return int_matrix_list


def matrix_float_to_int(matrix):
    for i in range(0, 3):
        for j in range(0, 3):
            matrix[i][j] = int(round(matrix[i][j], 0))
    return matrix


def generate_pg(basis):  # pragma: no cover
    edit_struct_enum("struct_enum.in", basis)
    os.system("pg.x > pgx_out.txt")
    return read_pg_out("pgx_out.txt")


def check_similarities(m_list1, m_list2):
    similarities = 0
    n = 0
    for i in range(0, len(m_list1)):
        for j in range(n, len(m_list2)):
            n += 1
            if numpy.array_equal(m_list1[i], m_list2[j]):
                similarities += 1
    return similarities


def find_equivalent_basis(basis, degenerate_label):  # pragma: no cover
    """
    takes in basis and the path to the degenerate point groups and transformations,
    finds which index of point group is equal to the PG of the basis and then returns that index number
    of the transform list
    """
    pg = generate_pg(basis)

    transform_data = numpy.loadtxt("Data/NiggliTransforms/" + degenerate_label + "_Transformed.txt")
    transform_data = numpy.reshape(transform_data, (6960, 3, 3))

    pg_data = numpy.loadtxt("Data/NiggliPGs/" + degenerate_label + "_PGs.txt")
    size = len(pg_data) / 6960 / 3
    pg_data = numpy.reshape(pg_data, (6960, size, 3, 3))

    for i in range(0, len(pg_data)):
        if numpy.array_equal(pg, pg_data[i]):
            return transform_data[i]
    return 0
def load_pg_list(label):
    pg_data = numpy.loadtxt("Data/NiggliPGs/" + label + "_PGs.txt")
    size = len(pg_data) / 6960 / 3
    pg_data = numpy.reshape(pg_data, (6960, size, 3, 3))
    return pg_data
def load_transform_list(label):
    transform_data = numpy.loadtxt("Data/NiggliTransforms/" + label + "_Transformed.txt")
    #size = len(transform_data) / 6960 / 3
    transform_data = numpy.reshape(transform_data, (6960, 3, 3))
    return transform_data
def is_one(pg):
    is_one = 1
    for i in pg:
        for k in i:
            for j in k:
                for l in k:
                    if l != 1 and l != -1 and l != 0:
                        is_one = 0
    return is_one


def get_URT(pg):
    """ takes in 2 or 3 3x3 matricies
        returns one if all have 0's in the upper rigth of the matrix
        returns a 0 otherwise
    """
    size = len(pg)
    if size == 2:
        condition12 = (pg[0][0][1] == 0) and (pg[1][0][1] == 0)
        condition13 = (pg[0][0][2] == 0) and (pg[1][0][2] == 0)
        condition23 = (pg[0][1][2] == 0) and (pg[1][1][2] == 0)
        if condition12 and condition13 and condition23:
            return 1
    if size == 3:
        condition12 = (pg[0][0][1] == 0) and (pg[1][0][1] == 0) and (pg[2][0][1] == 0)
        condition13 = (pg[0][0][2] == 0) and (pg[1][0][2] == 0) and (pg[2][0][2] == 0)
        condition23 = (pg[0][1][2] == 0) and (pg[1][1][2] == 0) and (pg[2][1][2] == 0)
        if condition12 and condition13 and condition23:
            return 1
    return 0
def get_simple_pgs(pg):
    """ takes in 2 or 3 3x3 matricies
        returns one if all have 0's in positions x12 and x13
        returns a 0 otherwise
    """
    size = len(pg)
    if size == 2:
        condition12 = (pg[0][0][1] == 0) and (pg[1][0][1] == 0)
        condition13 = (pg[0][0][2] == 0) and (pg[1][0][2] == 0)
        if condition12 and condition13:
            return 1
    if size == 3:
        condition12 = (pg[0][0][1] == 0) and (pg[1][0][1] == 0) and (pg[2][0][1] == 0)
        condition13 = (pg[0][0][2] == 0) and (pg[1][0][2] == 0) and (pg[2][0][2] == 0)
        if condition12 and condition13:
            return 1
    return 0
