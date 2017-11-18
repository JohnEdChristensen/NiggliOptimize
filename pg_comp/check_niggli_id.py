from opf_python import niggli_lat_id
import numpy

basis = numpy.loadtxt("Data/NiggliTransforms/" + "n07_tI" + "_Transformed.txt")
basis = numpy.reshape(basis, (len(basis) / 3, 3, 3))
test = [[1.04442, 1.43973, 1.68415], [0.779796, -1.1798, 1.], [1.779796, -0.1798, 0.]]
"""
#test = basis[1]
#test = numpy.transpose(test)
"""
print test
print niggli_lat_id.niggli_id(test)
