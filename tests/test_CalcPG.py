import pytest
from PGComp.CalcPG import *
from PGComp.MatrixTools import *
def test_CalculateAllPGs():
    transformPath = 'tests/testTransforms.txt'
    output = CaclulateAllPGs(transformPath)
    expectedOutput = numpy.loadtxt('tests/calculateAllPGsExpected1.txt')
    expectedOutput = numpy.reshape(expectedOutput,(len(expectedOutput)/3,3,3)).tolist()
    for i in range(0, len(expectedOutput)):
        expectedOutput[i] = matrixFloatToInt(expectedOutput[i])
    assert numpy.array_equal(output,expectedOutput)
    
