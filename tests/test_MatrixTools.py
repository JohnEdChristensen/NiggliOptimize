"""
Tests The functions in PGComp/Matrixtools.py
"""
import pytest
import numpy
import os
from PGComp.MatrixTools import *
def test_detIsN():
    assert 1 == detIsN(1,[[1,0,0],[0,1,0],[0,0,1]])
    assert 0 == detIsN(2,[[1,0,0],[0,1,0],[0,0,1]])
    assert 1 == detIsN(2,[[2,0,0],[0,1,0],[0,0,1]])
    
def test_editStrucEnum():
    editStructEnum("PGComp/struct_enum.in",[[1,0,0],[0,1,0],[0,0,1]])
    with open('tests/IdentityTestStruct_enum.in', 'r') as struct_enum:
        expectedStructData1 = struct_enum.readlines()
    with open('PGComp/struct_enum.in', 'r') as struct_enum:
        structData1 = struct_enum.readlines()
    assert structData1 == expectedStructData1
    
    editStructEnum("PGComp/struct_enum.in",[[1.1,1.1,1],[1.1,1,1],[1.1,1,1]])
    with open('tests/TestStruct_enum1.in', 'r') as struct_enum:
        expectedStructData2 = struct_enum.readlines()
    with open('PGComp/struct_enum.in', 'r') as struct_enum:
        structData2 = struct_enum.readlines()
    assert structData2 == expectedStructData2

def test_readPGOut():
    Data1 = readPGOut("tests/pgx_out.txt")
    expectedData1 = [[[-1,0,0],[0,0,-1],[0,-1,0]],[[0,0,1],[-1,0,0],[0,1,0]]]
    assert expectedData1 == Data1
def test_CalculateTransform():
    identity = [[1,0,0],[0,1,0],[0,0,1]]
    m1 = [[1,2,3],[4,5,6],[7,8,9]]
    transform1 = [[1,1,0],[1,1,0],[1,0,1]]
    transform2 = [[1,1,5],[1,1,0],[1,5,1]]
    assert numpy.array_equal(identity,CalculateTransform(identity,identity))
    assert numpy.array_equal(numpy.transpose(m1).tolist(),CalculateTransform(m1,identity))
    assert numpy.array_equal(m1,CalculateTransform(identity,m1))
    assert numpy.array_equal([[3,3,4],[9,9,10],[15,15,16]],CalculateTransform(transform1,m1))
    assert numpy.array_equal([[18,3,14],[39,9,35],[60,15,56]],CalculateTransform(transform2,m1))
def test_createMatrix():
    identity = [[1,0,0],[0,1,0],[0,0,1]]
    m1 = [[1.1,0,0],[0,-.1,0],[0,0,-0]]
    assert numpy.array_equal(identity,createMatrix("1   0   0","0   1   0","0   0   1"))
    assert numpy.array_equal(m1,createMatrix("1.1   0   0","0   -0.1   0","0   0   0"))
def test_saveMatrix():
    identity = [[1,0,0],[0,1,0],[0,0,1]]
    saveMatrix(identity,"tests/saveMatrixTest1.txt")
    with open('tests/saveMatrixTest1.txt', 'r') as Data:
        data1 = Data.readlines()
    with open("tests/saveMatrixExpected1.txt", 'r') as Data:
        expectedData1 = Data.readlines()
    assert data1 == expectedData1
    m1 = [[1.1111111,0,0],[0,1,0],[0,0,1]]
    saveMatrix(m1,"tests/saveMatrixTest2.txt")
    with open('tests/saveMatrixTest2.txt', 'r') as Data:
        data2 = Data.readlines()
    with open("tests/saveMatrixExpected2.txt", 'r') as Data:
        expectedData2 = Data.readlines()
    assert data2 == expectedData2
def test_matrixFloatToInt():
    identity = [[1,0,0],[0,1,0],[0,0,1]]
    assert numpy.array_equal(identity,matrixFloatToInt(identity))
    m1 = [[1.01,0.00001,0],[0,.9999999,0],[0,0.000005,1]]
    assert numpy.array_equal(identity,matrixFloatToInt(m1))
    

