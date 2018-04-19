import time
from opf_python import base_mono
from sm import *
from base_mono import *
from rhom import *
from body_tet import*
initial_time = time.time();
total_length = 0
length = 0
low = 12342
high = 12346
for i in range(low,high):
    temp = body_tet_6_7_15_18(i+1)
    length = len(temp)
    total_length += length
    print str(i+1) + "\tsfound\t"+ str (length)

print "Total HNFs:\t"+ str (total_length)
print "Total Time:\t"+ str(time.time() - initial_time);
