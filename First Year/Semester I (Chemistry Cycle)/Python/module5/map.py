def task(keyList, valueList):
    answer = {}
    n = len(keyList)
    i = 0
    while i < n:
        answer[keyList[i]] = valueList[i]
        i += 1
    return answer

#test
print(task(['a', 'b', 'c'], [1, 2, 3]))