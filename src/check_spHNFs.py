#from opf_python import sm
from sm import *
from base_mono import *
from matrix_tools import *
import numpy
total_length = 0
length = 0
low = 1
high = 50
spHNFs = []
basis = [[0.331088,2.96676,-0.29785],[0.668912,-1.96676,1.29785],[0.61803,-1.618034,-2.0]]
#basis = [[-0.666125, 1.16613, 2.04852 ],[1.61803, -0.618034, 1.0],[-1.0, -1.0, 0.0 ]]
for i in range(low,high+1):
    #temp = base_mono_29_30(i)
    temp = sm_35_5(i)
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
        print "algorithim not in brute"
        print e
        correct = False



if correct:
    print "Identical spHNFs"
    os.system("python get_time.py")
else:
    print "Not Identical spHNFs"
