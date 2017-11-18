from math_mat_code_gen import *
from opf_python import niggli_lat_id
import numpy

basis = [[1, 1, 0], [1.61803, -0.618034, 1], [-0.666125, 1.16613, 2.04852]]
print niggli_lat_id.niggli_id(numpy.transpose(basis))
print
print format_basis(basis)
print format_pg(generate_pg(basis))
label = "n28_mC"
equivalentBasis = find_equivalent_basis(basis, label)
print "-------------------------------------------------------------------------"
print niggli_lat_id.niggli_id(numpy.transpose(equivalentBasis))
print
print format_basis(equivalentBasis)
print format_pg(generate_pg(equivalentBasis))
