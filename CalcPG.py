import os
import numpy
from MatrixTools import *
basis = numpy.loadtxt("Data/NiggliTransforms/n41_mC_Transformed.txt")
basis = numpy.reshape(basis,(len(basis)/3,3,3))
enumOut = []
pgList = []
for e in basis:
	editStructEnum(e)
	os.system("pg.x > pgx_out.txt")
	enumOut.append(readStrucEnum())
	for i in enumOut:
	    pgList.append(i)
saveMatrix(pgList,0,len(pgList),"Data/NiggliPGs/n41_mC_PGs.txt")
