from opf_python import niggli_lat_id
import numpy

#basis = numpy.loadtxt("Data/NiggliTransforms/" + "n07_tI" + "_Transformed.txt")
#basis = numpy.reshape(basis, (len(basis) / 3, 3, 3))
# A =[[-0.255922,  0.255918, -1.255922],
#          [-1.44338 , -1.44338 , -1.44338 ],
#          [ 0.92259 , -0.922588, -0.07741 ]]

A =[[1.80278,-1.47253,0.762655],[2.80278,0.13535,-0.791285],
[0.80278,-0.47253,2.762655]]
#A = numpy.transpose(A)
print niggli_lat_id.niggli_id(numpy.transpose(A))
