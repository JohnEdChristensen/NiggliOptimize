import pytest
from spHNF_manip.math_mat_code_gen import *


def test_format_pg():
    identity = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
    output = format_pg([identity, identity])
    expected_output = open('tests/test_output/formatPGTest1.txt', 'r').read()
    assert output == expected_output
    output = format_pg([identity, identity, identity])
    expected_output = open('tests/test_output/formatPGTest2.txt', 'r').read()
    assert output == expected_output


def test_format_basis():
    identity = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
    output = format_basis(identity)
    expected_output = open('tests/test_output/formatBasisTest1.txt', 'r').read()
    assert output == expected_output
