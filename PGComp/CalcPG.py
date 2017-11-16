import os
import numpy
from MatrixTools import *
"""
labelsFile = open("Data/NiggliBasisLabels.txt","r")
labels = labelsFile.readlines()
labelsFile.close()

for i in range(0,len(labels)):
	labels[i] = labels[i].rstrip()"""
labels = ["n07_tI","n06_tI"]
def CaclulateAllPGs(transformPath):
    for label in labels:
        basis = numpy.loadtxt(transformPath)
        basis = numpy.reshape(basis,(len(basis)/3,3,3))
        PGOut = []
        pgList = []
        for i in range(0,len(basis)):
    	    editStructEnum("struct_enum.in",basis[i])
    	    os.system("pg.x > tests/pgx_out.txt")
    	    PGOut =readPGOut("tests/pgx_out.txt")
    	    for j in PGOut:
                   pgList.append(j)
        return pgList
