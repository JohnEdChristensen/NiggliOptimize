"""Tests The subroutines in PGComp/Matrixtools.py
"""
import pytest
def test_detIsN():
	from PGComp.MatrixTools import detIsN

	assert 1 == detIsN(1,[[1,0,0],[0,1,0],[0,0,1]])
