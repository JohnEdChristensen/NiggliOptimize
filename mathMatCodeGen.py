import math
import numpy
import os
from MatrixTools import *
def printMathematicaCode(matrixList,size):
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
		print "x11 = {" + str (x11[0]) + "," + str (x11[1]) + "};"
		print "x12 = {" + str (x12[0]) + "," + str (x12[1]) + "};"
		print "x13 = {" + str (x13[0]) + "," + str (x13[1]) + "};"
		print "x21 = {" + str (x21[0]) + "," + str (x21[1]) + "};"
		print "x22 = {" + str (x22[0]) + "," + str (x22[1]) + "};"
		print "x23 = {" + str (x23[0]) + "," + str (x23[1]) + "};"
		print "x31 = {" + str (x31[0]) + "," + str (x31[1]) + "};"
		print "x32 = {" + str (x32[0]) + "," + str (x32[1]) + "};"
		print "x33 = {" + str (x33[0]) + "," + str (x33[1]) + "};"
	if(size == 3):
		x11 = [matrixList[0][0][0],matrixList[1][0][0],matrixList[2][0][0]]
		x12 = [matrixList[0][0][1],matrixList[1][0][1],matrixList[2][0][1]]
		x13 = [matrixList[0][0][2],matrixList[1][0][2],matrixList[2][0][2]]
		x21 = [matrixList[0][1][0],matrixList[1][1][0],matrixList[2][1][0]]
		x22 = [matrixList[0][1][1],matrixList[1][1][1],matrixList[2][1][1]]
		x23 = [matrixList[0][1][2],matrixList[1][1][2],matrixList[2][1][2]]
		x31 = [matrixList[0][2][0],matrixList[1][2][0],matrixList[2][2][0]]
		x32 = [matrixList[0][2][1],matrixList[1][2][1],matrixList[2][2][1]]
		x33 = [matrixList[0][2][2],matrixList[1][2][2],matrixList[2][2][2]]
		print "x11 = {" + str (x11[0]) + "," + str (x11[1]) + "," + str (x11[2]) + "};"
		print "x12 = {" + str (x12[0]) + "," + str (x12[1]) + "," + str (x12[2]) + "};"
		print "x13 = {" + str (x13[0]) + "," + str (x13[1]) + "," + str (x13[2]) + "};"
		print "x21 = {" + str (x21[0]) + "," + str (x21[1]) + "," + str (x21[2]) + "};"
		print "x22 = {" + str (x22[0]) + "," + str (x22[1]) + "," + str (x22[2]) + "};"
		print "x23 = {" + str (x23[0]) + "," + str (x23[1]) + "," + str (x23[2]) + "};"
		print "x31 = {" + str (x31[0]) + "," + str (x31[1]) + "," + str (x31[2]) + "};"
		print "x32 = {" + str (x32[0]) + "," + str (x32[1]) + "," + str (x32[2]) + "};"
		print "x33 = {" + str (x33[0]) + "," + str (x33[1]) + "," + str (x33[2]) + "};"
		
transformations = numpy.loadtxt("Data/20Matricies.txt")
transformations = numpy.reshape(transformations,(len(transformations)/3,3,3))
basis =  numpy.loadtxt("BasisInfo.txt")
transformed = CalculateTransformations(basis,transformations)
#saveMatrix(transformed,0,len(transformed),"TransformedMatricies.txt")

for n in range(0,len(transformed)):
	print "Point Group # " + str (n)
	print "a1 = {" + str (transformed[n][0][0]) + ", " + str (transformed[n][0][1]) + ", " + str (transformed[n][0][2]) + "}"
	print "a2 = {" + str (transformed[n][1][0]) + ", " + str (transformed[n][1][1]) + ", " + str (transformed[n][1][2]) + "}"
	print "a3 = {" + str (transformed[n][2][0]) + ", " + str (transformed[n][2][1]) + ", " + str (transformed[n][2][2]) + "}"
	print ""
	editStructEnum(transformed[n])
	os.system("pg.x > pgx_out.txt")
	matrixList = readStrucEnum()
	size = len(matrixList)
	printMathematicaCode(matrixList,size)
