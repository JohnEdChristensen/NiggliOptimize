import math_mat_code_gen as gen
from opf_python import niggli_lat_id
import numpy
m = [[[1,1,1],[1.61803,-0.618034,-1],[-0.668912,1.96676,-1.29785]]]

for e in m:
    print niggli_lat_id.niggli_id(numpy.transpose(e))
    print gen.gen_mat_code(e)
