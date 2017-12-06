from matrix_tools import *

labels_file = open("Data/NiggliBasisLabels.txt", "r")
labels = labels_file.readlines()
labels_file.close()
#for i in range(0, len(labels)):
#    labels[i] = labels[i].rstrip()
labels = ["n02_hR","n04_hR","n24_hR"]
for label in labels:
    basis = numpy.loadtxt("Data/NiggliTransforms/" + label + "_Transformed.txt")
    basis = numpy.reshape(basis, (len(basis) / 3, 3, 3))
    pg_out = []
    pg_list = []
    for i in range(0, len(basis)):
        pg_out = generate_pg(basis[i])
        for j in pg_out:
            pg_list.append(j)
    save_matrix(pg_list, "Data/NiggliPGs/" + label + "_PGs.txt")
