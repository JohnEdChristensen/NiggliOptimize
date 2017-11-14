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
    editStructEnum("struct_enum.in",[[1,0,0],[0,1,0],[0,0,1]])
    os.system("../kgrid_gen/pg.x > tests/pgx_out.txt")
    with open('tests/TestPGOut1.txt', 'r') as PGOutData:
        expectedData1 = PGOutData.readlines()
    with open('tests/pgx_out.txt', 'r') as PGOutData:
        Data1 = PGOutData.readlines()
    assert expectedData1 == Data1
def test_CalculateTransformations():
    identity = [[1,0,0],[0,1,0],[0,0,1]]
    m1 = [[1,2,3],[4,5,6],[7,8,9]]
    transform1 = [[1,1,0],[1,1,0],[1,0,1]]
    transform2 = [[1,1,5],[1,1,0],[1,5,1]]
    assert numpy.array_equal(identity,CalculateTransformations(identity,identity))
    assert numpy.array_equal(numpy.transpose(m1).tolist(),CalculateTransformations(m1,identity))
    assert numpy.array_equal(m1,CalculateTransformations(identity,m1))
    assert numpy.array_equal([[3,3,4],[9,9,10],[15,15,16]],CalculateTransformations(transform1,m1))
    assert numpy.array_equal([[18,3,14],[39,9,35],[60,15,56]],CalculateTransformations(transform2,m1))
