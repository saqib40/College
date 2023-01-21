#FIND EIGEN AVLUES AND EIGEN VECTORS
import numpy as np
from numpy.linalg import eig
A=np.array([[8,-6,2],[-6,7,-4],[2,-4,3]])
print(A)
values,vectors=eig(A)
print("Eigen values",values)
print("Eigen vectors",vectors)
