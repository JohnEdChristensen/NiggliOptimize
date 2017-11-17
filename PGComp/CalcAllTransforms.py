import numpy
import ast
from MatrixTools import *
transformations = numpy.loadtxt("Data/AllDetOfOne.txt")
transformations = numpy.reshape(transformations,(len(transformations)/3,3,3))
with open("Data/NiggliBasis.txt") as f:
    lines = f.readlines()
numOfLines = len(lines)
nBasisFile = open("Data/NiggliBasis.txt","r")

for i in range(0,numOfLines/2):
    niggliID = nBasisFile.readline()
    basis = nBasisFile.readline()
    niggliID = niggliID.rstrip()
    basis = ast.literal_eval(basis)
    transformed = []
    for transform in transformations:
        transformed.append(CalculateTransform(transform,basis))
    saveMatrix(transformed,"Data/NiggliTransforms/" + niggliID + "_Transformed.txt")
    
nBasisFile.close()
