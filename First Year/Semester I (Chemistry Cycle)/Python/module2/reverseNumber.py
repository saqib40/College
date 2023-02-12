a = input('Enter a number: ')

def reverse(number):
    n = len(number) - 1
    answer = ''
    while n >= 0:
        answer += number[n]
        n -= 1
    return answer

print(reverse(a))