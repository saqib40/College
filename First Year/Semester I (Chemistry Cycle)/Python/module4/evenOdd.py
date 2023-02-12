a = input('Write the list\'s content: ').split(',')

#without list comprehension
def task1(myList):
    evenList = []
    oddList = []
    for x in myList:
        if int(x) % 2 == 0:
            evenList.append(x)
        else:
            oddList.append(x)
    return 'The even numbers are ' + str(evenList) + ' and the odd numbers are ' + str(oddList)

print(task1(a))

#with list comprehension
def task2(myList):
    evenList = [x for x in a if int(x) % 2 == 0]
    oddList = [x for x in a if int(x) % 2 != 0]
    return 'The even numbers are ' + str(evenList) + ' and the odd numbers are ' + str(oddList)

print(task2(a))