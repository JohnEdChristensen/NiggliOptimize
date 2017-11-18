import pytest
from pg_comp.det_of1 import *


def test_create_nxn_matrices():
    assert 3 == len(create_nxn_matrices(1))
    assert 81 == len(create_nxn_matrices(2))
