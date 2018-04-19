import numpy

from sm import *
from base_mono import *
from body_tet import *
from opf_python import rhom
from opf_python.universal import transform_supercells
from opf_python.universal import find_supercells

from opf_python.niggli_lat_id import niggli_id
from opf_python.pyniggli import reduced_cell
n = 12
parent = [[ 1,  1,  0],
         [ 1,  1,  2],
         [-2,  2,  0]]
#parent  = numpy.transpose(parent)
myHNFs = body_tet_6_7_15_18(n)

lat_name, nig_n, lat_fam, basis = niggli_id(parent)
print nig_n
print basis
Bu = reduced_cell(parent)
Nu = Bu.niggli
Cu = Bu.C

Bo = reduced_cell(basis)
No = Bo.niggli
Co = Bo.C



supercells = transform_supercells(myHNFs, No, Nu, Co, Cu, basis)
expectedSC = find_supercells(parent,n,exact=True)
"""
for e in supercells:
    print e
print "\n--------------------------------------------\n"
for e in expectedSC:
    print e
"""

print supercells

print expectedSC
print numpy.allclose(supercells,expectedSC)
print len(supercells)
print len(expectedSC)
#
for i in supercells:
    for j in i:
        for k in j:
            print k
