import numpy

from base_mono import *

from opf_python.universal import transform_supercells
from opf_python.universal import find_supercells

from opf_python.niggli_lat_id import niggli_id
from opf_python.pyniggli import reduced_cell

parent = [[-1.79092,-1.47209,0.790922],[1.0,-1.41421,-1.0],[1.0,0.0,1.0]]

myHNFs = base_mono_37_39_41(8)

lat_name, nig_n, lat_fam, basis = niggli_id(numpy.transpose(parent))
print nig_n
Bu = reduced_cell(numpy.transpose(parent))
Nu = Bu.niggli
Cu = Bu.C

Bo = reduced_cell(basis)
No = Bo.niggli
Co = Bo.C

supercells = transform_supercells(myHNFs, No, Nu, Co, Cu, basis)
expectedSC = find_supercells(numpy.transpose(parent),8,exact=True)
for e in supercells:
    print e
print "\n--------------------------------------------\n"
for e in expectedSC:
    print e

#print supercells

#print expectedSC
print numpy.allclose(supercells,expectedSC)
print len(supercells)
print len(expectedSC)

for i in supercells:
    for j in i:
        for k in j:
            print k
