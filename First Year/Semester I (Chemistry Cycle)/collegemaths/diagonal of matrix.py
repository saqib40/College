#diagonalization

# IMPORT SYMPY
from sympy import*
M = Matrix([[11,-4,-7],[7,-2,-5],[10,-4,-6]])
print("Matrix:{}".format(M))
P,D = M.diagonalize()
print("Diagonal of a matrix:{}".format(D))
