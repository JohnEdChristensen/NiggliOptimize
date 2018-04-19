#from opf_python import sm
from opf_python import sm
from opf_python import stet
from opf_python import body_tet
from base_mono import *
from rhom import *
from body_tet import *
from matrix_tools import *
from opf_python import niggli_lat_id
from opf_python import rhom
import numpy
total_length = 0
length = 0
low = 500
high = 500
spHNFs = []
basis = [[1.80278,-1.47253,0.762655],[2.80278,0.13535,-0.791285],
[0.80278,-0.47253,2.762655]]
#basis = numpy.transpose(basis)
for i in range(low,high+1):
    #temp = base_mono_29_30(i)
    temp = body_tet_6_7_15_18(i)
    length = len(temp)
    if length > 1:
        for e in temp:
            spHNFs.append(e)
    elif length == 1:
        spHNFs.append(temp[0])
    total_length += length
    print str(i) + "\tsfound\t"+ str (length)

print "My HNFs:\t"+ str (len(spHNFs))
#for i in range(len(spHNFs)):
#    spHNFs[i] = numpy.asarray(spHNFs[i])
spHNFs = numpy.asarray(spHNFs)

edit_struct_enum("struct_enum.in",basis)
os.system("srHNF.x")
brute_spHNFs = numpy.loadtxt("spHNFs.out")

brute_spHNFs = brute_spHNFs.reshape(len(brute_spHNFs)/3,3,3).astype(int)

print "My HNFs:\t"+ str (len(spHNFs))
print "Brute HNFs:\t"+ str (len(brute_spHNFs))

correct = True
a = spHNFs.tolist()
b = brute_spHNFs.tolist()
for e in b:
    if not(e in a):
        #print "brute not in algorithm"
        #print e

        correct = False

for e in a:
    if not(e in b):
        #print "algorithim not in brute"
        #print e
        correct = False


print niggli_lat_id.niggli_id(numpy.transpose(basis))
if correct:
    print "Identical spHNFs"

    os.system("python get_time.py")
else:
    print "Not Identical spHNFs"
