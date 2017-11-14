import itertools
import numpy
from MatrixTools import *

"""
    This program creates a list of all the possible combinantions of an nxn matrix wich coefficients
    are {-1,0,1}. It then evaluates the determinent of every matrix and saves the matricies that have
    a determinent of 1 or -1.
"""

def createNxNMatricies(n):
    """
        Returns a list of all possible nxn matricies with coeficcients of
        -1, 0, or 1
        list contains 3^n elements
    """
    matrixForm = []
    matriciesList = itertools.product({-1,0,1},repeat = (n*n))
    for e in matriciesList:
        matrixForm.append( numpy.reshape(numpy.array(e),(n,n)))
       
    print "Created " + str (len(matrixForm)) + " Matricies"
    return matrixForm

def detIsN(expectedDeterminent,m):
    """
        returns a 1 if nxn matrix m has a determinent equal to expectedDeterminent
        returns a zero otherwise
    """
    det = numpy.linalg.det(m)
    if(det == expectedDeterminent):
        return 1
    else:
        return 0
        
detOfOne = []
detOfNegOne = []
detOfBoth = []
matricies = createNxNMatricies(3)
for e in matricies:
    if(detIsN(1,e)):
        detOfBoth.append(e)
        detOfOne.append(e)
    elif(detIsN(-1,e)):
        detOfBoth.append(e)
        detOfNegOne.append(e)

print "Deteriminents of 1: "  + str (len(detOfOne))
print "Deteriminents of -1: "  + str (len(detOfNegOne))
print "Total: " + str (len(detOfBoth))
saveMatrix(detOfBoth,0,len(detOfBoth),"Data/AllDetOfOne.txt")

"""
print "Checking for Duplicates"
checkForDuplicates(detOfOne)
print "Continueing..."
checkForDuplicates(detOfNegOne)
"""

        
