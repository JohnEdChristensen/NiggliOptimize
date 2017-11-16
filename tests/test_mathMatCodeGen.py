import pytest
from PGComp.mathMatCodeGen import *
def test_FormatPG():
    identity = [[1,0,0],[0,1,0],[0,0,1]]
    output = FormatPG([identity,identity])
    expectedOutput = open('tests/formatPGTest1.txt', 'r').read()
    assert output == expectedOutput
    output = FormatPG([identity,identity,identity])
    expectedOutput = open('tests/formatPGTest2.txt', 'r').read()
    assert output == expectedOutput
def test_FormatBasis():
    identity = [[1,0,0],[0,1,0],[0,0,1]]
    output = FormatBasis(identity)
    expectedOutput = open('tests/formatBasisTest1.txt', 'r').read()
    assert output == expectedOutput
    
