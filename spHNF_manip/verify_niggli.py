from matrix_tools import *
from opf_python import niggli_lat_id
import numpy

labels_file = open("Data/NiggliBasisLabels.txt", "r")
labels = labels_file.readlines()
labels_file.close()
for i in range(0, len(labels)):
    labels[i] = labels[i].rstrip()
labels = ["n06_tI"]
for label in labels:
    errors = 0
    basis = numpy.loadtxt("Data/NiggliTransforms/" + label + "_Transformed.txt")
    basis = numpy.reshape(basis, (len(basis) / 3, 3, 3))
    pg_out = []
    pg_list = []
    print label
    for i in range(0, len(basis)):
        try:
            niggli_lat_id.niggli_id(numpy.transpose(basis[i]))
        except:
            errors +=1
    print errors;
