import numpy

labels = ["n36_oC", "n38_oC"]

pgGroup1 = numpy.loadtxt("Data/NiggliPGs/" + labels[0] + "_PGs.txt")
size1 = len(pgGroup1) / 6960 / 3
pgGroup1 = numpy.reshape(pgGroup1, (6960, size1, 3, 3))
pgGroup2 = numpy.loadtxt("Data/NiggliPGs/" + labels[1] + "_PGs.txt")
size2 = len(pgGroup2) / 6960 / 3
pgGroup2 = numpy.reshape(pgGroup2, (6960, size2, 3, 3))

print labels[0] + " & " + labels[1]

print labels[0] + " has " + str(len(pgGroup1)) + " Point Group representations"
print labels[1] + " has " + str(len(pgGroup2)) + " Point Group representations"
unique_group1, indices1 = numpy.unique(pgGroup1, axis=0, return_index=True)
unique_group2, indices2 = numpy.unique(pgGroup2, axis=0, return_index=True)
print labels[0] + " has " + str(len(unique_group1)) + " Unique Point Group representations"
print labels[1] + " has " + str(len(unique_group2)) + " Unique Point Group representations\n"
print "Calculating Similarities..."

similarities = 0
for i in range(0, len(unique_group1)):
    for j in range(0, len(unique_group2)):
        if numpy.array_equal(unique_group1[i], unique_group2[j]):
            similarities += 1
print "Similarities: " + str(similarities)
