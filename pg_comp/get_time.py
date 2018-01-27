import time
from base_mono import *
initial_time = time.time();
total_length = 0
length = 0
low = 99999
high = 100000
for i in range(low,high):
    temp = base_mono_37_39_41(i+1)
    length = len(temp)
    total_length += length
    print str(i+1) + "\tsfound\t"+ str (length)          
    
print "Total HNFs:\t"+ str (total_length)
print "Total Time:\t"+ str(time.time() - initial_time);
