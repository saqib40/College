myTestFile = open('/Users/altaf/Desktop/College/First Year/Semester I (Chemistry Cycle)/Python/module3/testFile.txt', 'r')
content = myTestFile.read()

def task(content):
    numberOfCharacters = 0
    numberOfWords = 1
    numberOfLines = 1
    for x in content:
        if x == '\n':
            numberOfLines += 1
            numberOfWords += 1
        elif x == " ":
            numberOfWords += 1
        else:
            numberOfCharacters += 1
    return 'number of characters are ' + str(numberOfCharacters) + ' and number of words are ' + str(numberOfWords) + ' and number of lines are ' + str(numberOfLines)

print(task(content))