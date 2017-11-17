import numpy
import math
import os
def CalculateTransform(transform,basis):
	#basis = numpy.transpose(basis)
	transformedMatrix = numpy.dot(transform,basis)
	#return numpy.transpose(transformedMatrix).tolist()
	return transformedMatrix
def createMatrix(s1,s2,s3):
    """
    takes in 3 strings of 3 numbers seperated by commas
    returns a 3x3 matrix
    """
    row1 = s1.split()
    row1 = [float(i) for i in row1]
    row2 = s2.split()
    row2 = [float(i) for i in row2]
    row3 = s3.split()
    row3 = [float(i) for i in row3]
    matrix = [row1,row2,row3]
    return matrix	
def detIsN(expectedDeterminent,m):
    """
        returns a 1 if nxn matrix m has a determinent equal to expectedDeterminent
        returns a zero otherwise
    """
    det = numpy.linalg.det(m)
    return(det == expectedDeterminent)
        
	
def saveMatrix(matrixIn,writeLocation):
    numpy.savetxt(writeLocation,numpy.vstack(matrixIn),fmt ='%-8f')
    print "Saved " + str (len(matrixIn)) + " Matricies to " + writeLocation
	
def editStructEnum(structPath,matrix):
    with open(structPath, 'r') as struct_enum:
        structData = struct_enum.readlines()
    structData[2] = str (matrix[0][0]) + "\t" + str (matrix[0][1]) + "\t" + str (matrix[0][2]) + "\n"
    structData[3] = str (matrix[1][0]) + "\t" + str (matrix[1][1]) + "\t" + str (matrix[1][2]) + "\n"
    structData[4] = str (matrix[2][0]) + "\t" + str (matrix[2][1]) + "\t" + str (matrix[2][2]) + "\n"
    with open(structPath, 'w') as struct_enum:
        struct_enum.writelines(structData)
def readPGOut(pgxPath):
    file = open(pgxPath,"r")
    size = float (file.readline().split()[2])
    if(size == 4 or size == 48):
        size = 2
    if (size == 8 or size == 16):
        size = 3
	
    matrixList = []

    for i in range(0,int (size)):
        file.readline()
        row1 = file.readline()
        row2 = file.readline()
        row3 = file.readline()
        matrixList.append(createMatrix(row1,row2,row3))
    intMatrixList = []
    for e in matrixList:
        intMatrixList.append(matrixFloatToInt(e))
    file.close
    return intMatrixList

def matrixFloatToInt(matrix):
    for i in range(0,3):
        for j in range(0,3):
                matrix[i][j] = int (round(matrix[i][j],0))
    return matrix
def generatePG(basis): #pragma: no cover
    editStructEnum("struct_enum.in",basis)
    os.system("pg.x > pgx_out.txt")
    return readPGOut("pgx_out.txt")
def checkSimilarities(mList1,mList2):
    similarities = 0
    n=0
    for i in range(0,len(mList1)):
        for j in range(n,len(mList2)):
            n+=1
       	    if (numpy.array_equal(mList1[i], mList2[j])):
                similarities +=1
    return similarities
    
