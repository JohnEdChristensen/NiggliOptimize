import numpy

# labels = ["n20_mC","n25_mC"]
labels_file = open("Data/NiggliBasisLabels.txt", "r")
labels = labels_file.readlines()
for i in range(0, len(labels)):
    labels[i] = labels[i].rstrip()
labels_file.close()
for i in range(0, len(labels)):
    pgGroup = numpy.loadtxt("Data/NiggliPGs/" + labels[i] + "_PGs.txt")
    size = len(pgGroup) / 6960 / 3
    pgGroup = numpy.reshape(pgGroup, (6960, size, 3, 3))
    unique_group, indices = numpy.unique(pgGroup, axis=0, return_index=True)
    print labels[i]
    print len(unique_group)
