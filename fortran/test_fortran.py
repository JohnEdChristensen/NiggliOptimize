from opf_python import base_mono
from opf_python import body_tet
from opf_python import face_ortho
import numpy as np
fort_spHNFs = np.loadtxt("fort_spHNFs.txt")
fort_spHNFs = np.reshape(fort_spHNFs, (len(fort_spHNFs)/3, 3, 3))

for i in range(len(fort_spHNFs)):
    fort_spHNFs[i] = np.transpose(fort_spHNFs[i])

python_spHNFs = face_ortho.face_ortho_16(1000)

print len(fort_spHNFs)
print len(python_spHNFs)

correct = True
a = fort_spHNFs.tolist()
b = python_spHNFs
for e in b:
    #print e
    if not(e in a):
        print "python not in real"
        # print e
        correct = False

for e in a:
    #print e
    if not(e in b):
        print "real not in python"
        # print e
        correct = False
print correct
