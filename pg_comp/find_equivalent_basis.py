from math_mat_code_gen import *
from opf_python import niggli_lat_id
import numpy

basis = [[1.0,-1.0,1.0], [-1.46391,0.0,1.96391], [-2.0,0.0,-2.0]]
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
