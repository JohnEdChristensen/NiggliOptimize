import numpy
import os


def calculate_transform(transform, basis):
    # basis = numpy.transpose(basis)
    transformed_matrix = numpy.dot(transform, basis)
    # return numpy.transpose(transformed_matrix).tolist()
    return transformed_matrix


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
    if size == 4 or size == 48:
        size = 2
    if size == 8 or size == 16:
        size = 3

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
