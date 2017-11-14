import numpy
labels = ["n36_oC","n38_oC"]

pgGroup1 = numpy.loadtxt("Data/NiggliPGs/" +labels[0]+ "_PGs.txt")
size1 = len(pgGroup1)/6960/3
pgGroup1 = numpy.reshape(pgGroup1,(6960,size1,3,3))
pgGroup2 = numpy.loadtxt("Data/NiggliPGs/" +labels[1]+ "_PGs.txt")
size2 = len(pgGroup2)/6960/3
pgGroup2 = numpy.reshape(pgGroup2,(6960,size2,3,3))

print labels[0] + " & " + labels[1]

print labels[0] + " has " + str(len(pgGroup1)) + " Point Group representaions"
print labels[1] + " has " + str(len(pgGroup2)) + " Point Group representaions"
ugroup1,indicies1 = numpy.unique(pgGroup1,axis =0,return_index = True)
ugroup2,indicies2 = numpy.unique(pgGroup2,axis =0,return_index = True)
print labels[0] + " has " + str(len(ugroup1)) + " Unique Point Group representaions"
print labels[1] + " has " + str(len(ugroup2)) + " Unique Point Group representaions\n"
print "Calculating Similarites..."

similarities=0
for i in range(0,len(ugroup1)):
	for j in range(0,len(ugroup2)):
		if (numpy.array_equal(ugroup1[i], ugroup2[j])):
			similarities +=1
			"""print ugroup1[i]
			print labels[0] + ": " + str(indicies1[i])
			print labels[1] + ": " + str(indicies2[j])"""
print "Similarities: " + str(similarities)

