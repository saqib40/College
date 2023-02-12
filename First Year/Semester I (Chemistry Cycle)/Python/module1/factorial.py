#Factorial via recursion; Time Complexity O(n)
def recursiveFactorial(n):
    if n < 0:
        return 'Factorial of negative number is undefined'
    elif n == 0:
        return 1
    else:
        return n * recursiveFactorial(n-1)

#Factorial via loop; Time Complexity O(n)
def loopFactorial(n):
    if n < 0:
        return 'Factorial of negative number is undefined'
    else:
        answer = 1
        if n <= 1:
            return 1
        else:
            for x in range(2, n+1):
                answer *= x
            return answer