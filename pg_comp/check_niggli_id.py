from opf_python import niggli_lat_id
import numpy

basis = numpy.loadtxt("Data/NiggliTransforms/" + "n07_tI" + "_Transformed.txt")
basis = numpy.reshape(basis, (len(basis) / 3, 3, 3))
test =[ [[-1.79092,-1.47209,0.790922],[1.0,-1.41421,-1.0],[1.0,0.0,1.0]]]

#test = basis[1]
for e in test:
    e = numpy.transpose(e)
    print e
    print niggli_lat_id.niggli_id(e)
