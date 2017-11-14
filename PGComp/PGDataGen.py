import numpy
#labels = ["n20_mC","n25_mC"]
labelsFile = open("Data/NiggliBasisLabels.txt","r")
labels = labelsFile.readlines()
for i in range(0,len(labels)):
	labels[i] = labels[i].rstrip()
labelsFile.close()
for i in range(0,len(labels)):
	pgGroup = numpy.loadtxt("Data/NiggliPGs/" +labels[i]+ "_PGs.txt")
	size = len(pgGroup)/6960/3
	pgGroup = numpy.reshape(pgGroup,(6960,size,3,3))
	ugroup,indicies = numpy.unique(pgGroup,axis =0,return_index = True)
	print labels[i]
	print len(ugroup)
	
