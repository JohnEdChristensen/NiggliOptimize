import os
import numpy
from MatrixTools import *

labelsFile = open("Data/NiggliBasisLabels.txt","r")
labels = labelsFile.readlines()
labelsFile.close()
for i in range(0,len(labels)):
 	labels[i] = labels[i].rstrip()
#labels = ["n07_tI","n06_tI"]
for label in labels:
    basis = numpy.loadtxt("Data/NiggliTransforms/" +label+ "_Transformed.txt")
    basis = numpy.reshape(basis,(len(basis)/3,3,3))
    PGOut = []
    pgList = []
    for i in range(0,len(basis)):
        PGOut = generatePG(basis[i])
        for j in PGOut:
            pgList.append(j)
    saveMatrix(pgList,"Data/NiggliPGs/"+ label + "_PGs.txt")
