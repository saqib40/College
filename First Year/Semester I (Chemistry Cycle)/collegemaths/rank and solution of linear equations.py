#trivial solution
#.Solve x+2y+3z, 3x+4y+4z=0, 7x+10y+12z=0.
from sympy import *
x,y,z=symbols('x,y,z')
n=int(input('Enter the number of unknowns'))
a11,a12,a13=1,2,3
a21,a22,a23=1,3,1
a31,a32,a33=1,1,-2
A=Matrix(([a11,a12,a13],[a21,a22,a23],[a31,a32,a33]))
ra=A.rank()
print('Rank(A)=',ra)
if (ra==n):
    print('The system has only a trivial solution')
else:
    print('The system has a non trivial solution')
    print(linsolve([a11*x+a12*y+a13*z,a21*x+a22*y+a23*z,a31*x+a32*y+a33*z],[x,y,z]))
    