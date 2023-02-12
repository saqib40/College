a = input('Enter a hypen-seperated string: ')

def sortString(n):
    myList = a.split('-')
    myList.sort()
    return '-'.join(myList)

print(sortString(a))