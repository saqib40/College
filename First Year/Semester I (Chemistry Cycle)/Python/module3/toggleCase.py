a = input('Enter a string: ')

def task(string):
    toggleCase = ''
    numberOfLowerCase = 0
    numberOfUpperCase = 0
    numberOfSpaces = 0
    
    for x in string:
        if x == ' ':
            toggleCase += ' '
            numberOfSpaces += 1
        elif x == x.lower():
            toggleCase += x.upper()
            numberOfLowerCase += 1
        else:
            toggleCase += x.lower()
            numberOfUpperCase += 1
            
    return toggleCase + ', number of spaces are ' + str(numberOfSpaces) + ', number of lower-case letters are ' + str(numberOfLowerCase) + ', and number of upper-case letters are ' + str(numberOfUpperCase)

print(task(a))