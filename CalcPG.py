import os
import numpy
from MatrixTools import *
basis = numpy.loadtxt("Data/NiggliTransforms/n41_mC_Transformed.txt")
basis = numpy.reshape(basis,(len(basis)/3,3,3))
PGOut = []
pgList = []
for i in range(0,100):
	editStructEnum(basis[i])
	os.system("../kgrid_gen/pg.x > pgx_out.txt")
	PGOut =readPGOut()
	for j in PGOut:
		pgList.append(j)
#print pgList
saveMatrix(pgList,0,len(pgList),"Data/NiggliPGs/test.xt")
