import math
import numpy
import os
from MatrixTools import *
def FormatPG(matrixList):
    output = ""
    size = len(matrixList)
    if(size == 2):
        x11 = [matrixList[0][0][0],matrixList[1][0][0]]
        x12 = [matrixList[0][0][1],matrixList[1][0][1]]
        x13 = [matrixList[0][0][2],matrixList[1][0][2]]
        x21 = [matrixList[0][1][0],matrixList[1][1][0]]
        x22 = [matrixList[0][1][1],matrixList[1][1][1]]
        x23 = [matrixList[0][1][2],matrixList[1][1][2]]
        x31 = [matrixList[0][2][0],matrixList[1][2][0]]
        x32 = [matrixList[0][2][1],matrixList[1][2][1]]
        x33 = [matrixList[0][2][2],matrixList[1][2][2]]
        output += "x11 = {" + str (x11[0]) + "," + str (x11[1]) + "};" + "\n"
        output += "x12 = {" + str (x12[0]) + "," + str (x12[1]) + "};" + "\n"
        output += "x13 = {" + str (x13[0]) + "," + str (x13[1]) + "};" + "\n"
        output += "x21 = {" + str (x21[0]) + "," + str (x21[1]) + "};" + "\n"
        output += "x22 = {" + str (x22[0]) + "," + str (x22[1]) + "};" + "\n"
        output += "x23 = {" + str (x23[0]) + "," + str (x23[1]) + "};" + "\n"
        output += "x31 = {" + str (x31[0]) + "," + str (x31[1]) + "};" + "\n"
        output += "x32 = {" + str (x32[0]) + "," + str (x32[1]) + "};" + "\n"
        output += "x33 = {" + str (x33[0]) + "," + str (x33[1]) + "};" + "\n"
    elif(size == 3):
        x11 = [matrixList[0][0][0],matrixList[1][0][0],matrixList[2][0][0]]
        x12 = [matrixList[0][0][1],matrixList[1][0][1],matrixList[2][0][1]]
        x13 = [matrixList[0][0][2],matrixList[1][0][2],matrixList[2][0][2]]
        x21 = [matrixList[0][1][0],matrixList[1][1][0],matrixList[2][1][0]]
        x22 = [matrixList[0][1][1],matrixList[1][1][1],matrixList[2][1][1]]
        x23 = [matrixList[0][1][2],matrixList[1][1][2],matrixList[2][1][2]]
        x31 = [matrixList[0][2][0],matrixList[1][2][0],matrixList[2][2][0]]
        x32 = [matrixList[0][2][1],matrixList[1][2][1],matrixList[2][2][1]]
        x33 = [matrixList[0][2][2],matrixList[1][2][2],matrixList[2][2][2]]
        output += "x11 = {" + str (x11[0]) + "," + str (x11[1]) + "," + str (x11[2]) + "};" + "\n"
        output += "x12 = {" + str (x12[0]) + "," + str (x12[1]) + "," + str (x12[2]) + "};" + "\n"
        output += "x13 = {" + str (x13[0]) + "," + str (x13[1]) + "," + str (x13[2]) + "};" + "\n"
        output += "x21 = {" + str (x21[0]) + "," + str (x21[1]) + "," + str (x21[2]) + "};" + "\n"
        output += "x22 = {" + str (x22[0]) + "," + str (x22[1]) + "," + str (x22[2]) + "};" + "\n"
        output += "x23 = {" + str (x23[0]) + "," + str (x23[1]) + "," + str (x23[2]) + "};" + "\n"
        output += "x31 = {" + str (x31[0]) + "," + str (x31[1]) + "," + str (x31[2]) + "};" + "\n"
        output += "x32 = {" + str (x32[0]) + "," + str (x32[1]) + "," + str (x32[2]) + "};" + "\n"
        output += "x33 = {" + str (x33[0]) + "," + str (x33[1]) + "," + str (x33[2]) + "};" + "\n"
    return output
        		
def FormatBasis(basis):
    output = ""
    output += "a1 = {" + str (basis[0][0]) + "," + str (basis[0][1]) + "," + str (basis[0][2]) + "}" + "\n"
    output += "a2 = {" + str (basis[1][0]) + "," + str (basis[1][1]) + "," + str (basis[1][2]) + "}" + "\n"
    output += "a3 = {" + str (basis[2][0]) + "," + str (basis[2][1]) + "," + str (basis[2][2]) + "}" + "\n"
    return output
def GenMatCode(basis):#pragma: no cover
    editStructEnum(basis)
    os.system("pg.x > pgx_out.txt")
    matrixList = readPGOut()
    size = len(matrixList)
    output = FormatBasis(basis)
    output += FormatPG(matrixList,size)
    return output
