"""
LCM of two integers a and b, is the smallest positive 
integer that is divisible by both a and b
"""

numb1 = int(input('Enter the first number: '))
numb2 = int(input('Enter the second number: '))

def LCM(a, b):
  if (a > b):
    greater = a
  else:
    greater = b
  i = greater
  while True:
            if (i%a == 0 and i%b == 0):
                print(i, 'is the L.C.M')
                break
            else:
                i += 1

LCM(numb1, numb2)