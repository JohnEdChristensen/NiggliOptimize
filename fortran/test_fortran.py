from opf_python import hx
import sys
import numpy as np
import os
if(len(sys.argv) == 2):
    n = int(sys.argv[1])
else:
    n = 1024
os.system("gfortran int_sp_hnfs.f90")

for j in range(1,n):
    os.system("./a.out " + str(j))

    fort_spHNFs = np.loadtxt("fort_spHNFs.txt")
    fort_spHNFs = np.reshape(fort_spHNFs, (len(fort_spHNFs)/3, 3, 3))

    for i in range(len(fort_spHNFs)):
        fort_spHNFs[i] = np.transpose(fort_spHNFs[i])

    python_spHNFs = hx.hex_12(j)

    #print len(fort_spHNFs)
    #print len(python_spHNFs)

    correct = True
    a = fort_spHNFs.tolist()
    b = python_spHNFs
    for i in range(len(a)):
        if(a[i] != b[i]):
            correct = False

    if not correct:
        print "Error at Det size: ", j
