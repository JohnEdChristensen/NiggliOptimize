import math_mat_code_gen as gen
from opf_python import niggli_lat_id
import numpy
m = [[[1,1,0],[0,2,0],[0.5,0,2]]]

for e in m:
    print niggli_lat_id.niggli_id(numpy.transpose(e))
    print gen.gen_mat_code(e)
