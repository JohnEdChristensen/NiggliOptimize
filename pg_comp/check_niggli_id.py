from opf_python import niggli_lat_id
import numpy

basis = numpy.loadtxt("Data/NiggliTransforms/" + "n07_tI" + "_Transformed.txt")
basis = numpy.reshape(basis, (len(basis) / 3, 3, 3))
A = [[[0.331088,2.96676,-0.29785],[0.668912,-1.96676,1.29785],[0.61803,-1.618034,-2.0]]]

#test = basis[1]
for e in A:
    print e
    print niggli_lat_id.niggli_id(numpy.transpose(e))
