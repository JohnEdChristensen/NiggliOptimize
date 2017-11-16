import pytest
from PGComp.DetOf1 import *
def test_CreateNxNMatricies():
    assert 3 == len(CreateNxNMatricies(1))
    assert 81 == len(CreateNxNMatricies(2))
