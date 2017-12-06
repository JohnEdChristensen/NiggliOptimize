from opf_python import niggli_lat_id
import numpy

basis = numpy.loadtxt("Data/NiggliTransforms/" + "n07_tI" + "_Transformed.txt")
basis = numpy.reshape(basis, (len(basis) / 3, 3, 3))
test = [[0.11652,-0.711895,-2.116515],[ -1.11652,0.711895,1.116515],[1.0,1.32288,1.5]]

#test = basis[1]
test = numpy.transpose(test)

print test
print niggli_lat_id.niggli_id(test)
