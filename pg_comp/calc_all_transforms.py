import ast
from matrix_tools import *

transformations = numpy.loadtxt("Data/AllDetOfOne.txt")
transformations = numpy.reshape(transformations, (len(transformations) / 3, 3, 3))
with open("Data/NiggliBasis.txt") as f:
    lines = f.readlines()
num_of_lines = len(lines)
n_basis_file = open("Data/NiggliBasis.txt", "r")

for i in range(0, num_of_lines / 2):
    niggli_id = n_basis_file.readline()
    basis = n_basis_file.readline()
    niggli_id = niggli_id.rstrip()
    basis = ast.literal_eval(basis)
    transformed = []
    for transform in transformations:
        transformed.append(calculate_transform(transform, basis))
    save_matrix(transformed, "Data/NiggliTransforms/" + niggli_id + "_Transformed.txt")

n_basis_file.close()
