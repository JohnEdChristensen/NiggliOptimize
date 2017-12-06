from matrix_tools import *
import numpy


def format_pg(matrix_list):
    output = ""
    size = len(matrix_list)

    if size == 2:
        x11 = [matrix_list[0][0][0], matrix_list[1][0][0]]
        x12 = [matrix_list[0][0][1], matrix_list[1][0][1]]
        x13 = [matrix_list[0][0][2], matrix_list[1][0][2]]
        x21 = [matrix_list[0][1][0], matrix_list[1][1][0]]
        x22 = [matrix_list[0][1][1], matrix_list[1][1][1]]
        x23 = [matrix_list[0][1][2], matrix_list[1][1][2]]
        x31 = [matrix_list[0][2][0], matrix_list[1][2][0]]
        x32 = [matrix_list[0][2][1], matrix_list[1][2][1]]
        x33 = [matrix_list[0][2][2], matrix_list[1][2][2]]
        output += "x11 = {" + str(int(x11[0])) + "," + str(int(x11[1])) + "};" + "\n"
        output += "x12 = {" + str(int(x12[0])) + "," + str(int(x12[1])) + "};" + "\n"
        output += "x13 = {" + str(int(x13[0])) + "," + str(int(x13[1])) + "};" + "\n"
        output += "x21 = {" + str(int(x21[0])) + "," + str(int(x21[1])) + "};" + "\n"
        output += "x22 = {" + str(int(x22[0])) + "," + str(int(x22[1])) + "};" + "\n"
        output += "x23 = {" + str(int(x23[0])) + "," + str(int(x23[1])) + "};" + "\n"
        output += "x31 = {" + str(int(x31[0])) + "," + str(int(x31[1])) + "};" + "\n"
        output += "x32 = {" + str(int(x32[0])) + "," + str(int(x32[1])) + "};" + "\n"
        output += "x33 = {" + str(int(x33[0])) + "," + str(int(x33[1])) + "};" + "\n"
    elif size == 3:
        x11 = [matrix_list[0][0][0], matrix_list[1][0][0], matrix_list[2][0][0]]
        x12 = [matrix_list[0][0][1], matrix_list[1][0][1], matrix_list[2][0][1]]
        x13 = [matrix_list[0][0][2], matrix_list[1][0][2], matrix_list[2][0][2]]
        x21 = [matrix_list[0][1][0], matrix_list[1][1][0], matrix_list[2][1][0]]
        x22 = [matrix_list[0][1][1], matrix_list[1][1][1], matrix_list[2][1][1]]
        x23 = [matrix_list[0][1][2], matrix_list[1][1][2], matrix_list[2][1][2]]
        x31 = [matrix_list[0][2][0], matrix_list[1][2][0], matrix_list[2][2][0]]
        x32 = [matrix_list[0][2][1], matrix_list[1][2][1], matrix_list[2][2][1]]
        x33 = [matrix_list[0][2][2], matrix_list[1][2][2], matrix_list[2][2][2]]
        output += "x11 = {" + str(int(x11[0])) + "," + str(int(x11[1])) + "," + str(int(x11[2])) + "};" + "\n"
        output += "x12 = {" + str(int(x12[0])) + "," + str(int(x12[1])) + "," + str(int(x12[2])) + "};" + "\n"
        output += "x13 = {" + str(int(x13[0])) + "," + str(int(x13[1])) + "," + str(int(x13[2])) + "};" + "\n"
        output += "x21 = {" + str(int(x21[0])) + "," + str(int(x21[1])) + "," + str(int(x21[2])) + "};" + "\n"
        output += "x22 = {" + str(int(x22[0])) + "," + str(int(x22[1])) + "," + str(int(x22[2])) + "};" + "\n"
        output += "x23 = {" + str(int(x23[0])) + "," + str(int(x23[1])) + "," + str(int(x23[2])) + "};" + "\n"
        output += "x31 = {" + str(int(x31[0])) + "," + str(int(x31[1])) + "," + str(int(x31[2])) + "};" + "\n"
        output += "x32 = {" + str(int(x32[0])) + "," + str(int(x32[1])) + "," + str(int(x32[2])) + "};" + "\n"
        output += "x33 = {" + str(int(x33[0])) + "," + str(int(x33[1])) + "," + str(int(x33[2])) + "};" + "\n"
    return output


def format_basis(basis):
    output = ""
    output += "a1 = {" + str(basis[0][0]) + "," + str(basis[0][1]) + "," + str(basis[0][2]) + "}" + "\n"
    output += "a2 = {" + str(basis[1][0]) + "," + str(basis[1][1]) + "," + str(basis[1][2]) + "}" + "\n"
    output += "a3 = {" + str(basis[2][0]) + "," + str(basis[2][1]) + "," + str(basis[2][2]) + "}" + "\n"
    return output


def gen_mat_code(basis):  # pragma: no cover
    edit_struct_enum(basis, "struct_enum.in")
    os.system("pg.x > pgx_out.txt")
    matrix_list = read_pg_out("pgx_out.txt")
    output = format_basis(basis)
    output += format_pg(matrix_list)
    return output
def print_pg_as_mat(label, size, URT):
    pgs = load_pg_list(label)
    print len(pgs)
    unique_pgs,indicies = numpy.unique(pgs, axis=0, return_index=True)
    print len(unique_pgs)
    transforms = load_transform_list(label)
    if size > len(unique_pgs):
        size = len(unique_pgs)
        
    print "Generating " + str(size) + " Unique point groups"
    for i in range(0,size):
        print label + ": " + str(i)
        print format_basis(transforms[indicies[i]])
        print format_pg(unique_pgs[i])
