from opf_python import base_mono
from opf_python import rhom
from opf_python import face_ortho
import numpy as np

folder = "/home/john/msg/opf_kgrids/src/fortran/tests/spHNFs/{0}.{1}_{2}"

n = 556
name = "fco_16"
spHNFs = face_ortho.face_ortho_16(n)
count = 5

with open(folder.format("n.in",name,count),"w+") as f:
   f.write('# <fortpy version="1" template="integer"></fortpy>\n')
   f.write(str(n))

spHNFs = [[[int(i) for i in j]for j in k]for k in spHNFs]
print spHNFs[0]
temp2 = spHNFs

temp2 = np.array(temp2)
temp = temp2
temp2 = np.moveaxis(temp2,0,2)
print(temp2.shape)

with open(folder.format("spHNFs.out",name,count),"w+") as f:
   f.write('# <fortpy version="1" template="real"></fortpy>\n')
   f.write("##               {}\n".format("               ".join([str(i) for i in temp2.shape])))
   for i in range(len(temp2)):
       f.write("##               {}               0                0\n".format(i+1))
       for j in range(len(temp2[i])):
           f.write("                        {}\n".format("                        ".join([str(z) for z in temp2[i,j]])))

count += 1
