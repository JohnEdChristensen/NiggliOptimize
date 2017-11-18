from MatrixTools import *


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
        output += "x11 = {" + str(x11[0]) + "," + str(x11[1]) + "};" + "\n"
        output += "x12 = {" + str(x12[0]) + "," + str(x12[1]) + "};" + "\n"
        output += "x13 = {" + str(x13[0]) + "," + str(x13[1]) + "};" + "\n"
        output += "x21 = {" + str(x21[0]) + "," + str(x21[1]) + "};" + "\n"
        output += "x22 = {" + str(x22[0]) + "," + str(x22[1]) + "};" + "\n"
        output += "x23 = {" + str(x23[0]) + "," + str(x23[1]) + "};" + "\n"
        output += "x31 = {" + str(x31[0]) + "," + str(x31[1]) + "};" + "\n"
        output += "x32 = {" + str(x32[0]) + "," + str(x32[1]) + "};" + "\n"
        output += "x33 = {" + str(x33[0]) + "," + str(x33[1]) + "};" + "\n"
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
        output += "x11 = {" + str(x11[0]) + "," + str(x11[1]) + "," + str(x11[2]) + "};" + "\n"
        output += "x12 = {" + str(x12[0]) + "," + str(x12[1]) + "," + str(x12[2]) + "};" + "\n"
        output += "x13 = {" + str(x13[0]) + "," + str(x13[1]) + "," + str(x13[2]) + "};" + "\n"
        output += "x21 = {" + str(x21[0]) + "," + str(x21[1]) + "," + str(x21[2]) + "};" + "\n"
        output += "x22 = {" + str(x22[0]) + "," + str(x22[1]) + "," + str(x22[2]) + "};" + "\n"
        output += "x23 = {" + str(x23[0]) + "," + str(x23[1]) + "," + str(x23[2]) + "};" + "\n"
        output += "x31 = {" + str(x31[0]) + "," + str(x31[1]) + "," + str(x31[2]) + "};" + "\n"
        output += "x32 = {" + str(x32[0]) + "," + str(x32[1]) + "," + str(x32[2]) + "};" + "\n"
        output += "x33 = {" + str(x33[0]) + "," + str(x33[1]) + "," + str(x33[2]) + "};" + "\n"
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
