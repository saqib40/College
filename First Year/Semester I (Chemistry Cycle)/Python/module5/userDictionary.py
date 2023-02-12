a = input('Enter the list\'s content: ').split(',')

def task(myList):
    answer = {}
    n = len(myList)
    i = 0
    while i < n:
        answer[myList[i][0]] = myList[i]
        i += 1
    return answer

print(task(a))