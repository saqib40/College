"""
The GCD of two or more integers which are not all zero,
is the largest positive integer that divides each of the integers.
"""

numb1 = int(input('Enter the first number: '))
numb2 = int(input('Enter the second number: '))

#Method 1;
def gcd(a, b):
  if (a > b):
    smaller = b
  else:
    smaller = a
  i = int(smaller/2)
  while (i > 0):
            if (a%i == 0 and b%i == 0):
                print(i, 'is the H.C.F')
                break
            else:
                i -= 1


gcd(numb1, numb2)

#Method 2; using Euclid's algorithm