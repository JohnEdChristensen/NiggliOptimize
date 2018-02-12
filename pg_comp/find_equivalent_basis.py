from math_mat_code_gen import *
from opf_python import niggli_lat_id
import numpy

basis = [[0.331088,2.96676,-0.29785],[0.668912,-1.96676,1.29785],[0.61803,-1.618034,-2.0]]
print niggli_lat_id.niggli_id(numpy.transpose(basis))
print
print format_basis(basis)
print format_pg(generate_pg(basis))
label = "n04_hR"
equivalentBasis = find_equivalent_basis(basis, label)
print "-------------------------------------------------------------------------"
#if equivalentBasis[0][0] == 0:
   # print "No Equivalent Basis Found"
#else:
print niggli_lat_id.niggli_id(numpy.transpose(equivalentBasis))
print
print format_basis(equivalentBasis)
print format_pg(generate_pg(equivalentBasis))
