#Time Complexity is O(NlogN) (How? Will learn after sorting algorithms)
def task(givenList):
    givenList.sort()
    n = len(givenList)
    return 'largest is ' + str(givenList[n-1]) + ' and second largest is ' + str(givenList[n-2])

print(task([67,5,76,8,-32,56]))