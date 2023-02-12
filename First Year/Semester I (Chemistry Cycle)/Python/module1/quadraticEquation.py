#Finding the roots of a quadratic equation => ax^2 + bx + c
import cmath
a = int(input('Enter the first number: '))
b = int(input('Enter the second number: '))
c = int(input('Enter the third number: '))

def roots(a, b, c):
    d = cmath.sqrt(b**2 - 4*a*c)
    root1 = (-b + d)/2*a
    root2 = (-b - d)/2*a
    print('roots are ', root1, 'and', root2)
roots(a, b, c)