"""
To track how often the user has used has used uppercase and lowercase letters.
Illustrate a python programme.The user should press @ to exit the programme.
"""

numberOfLowercaseLetters = numberOfUppercaseLetters = 0

def my_function():
    global numberOfUppercaseLetters
    global numberOfUppercaseLetters
    a = input('Enter a letter: ')
    if a == '@':
        print('number of uppercase letters are ', numberOfUppercaseLetters,
              '\n number of lowercase letters are ', numberOfLowercaseLetters)
    elif a == a.upper():
        numberOfUppercaseLetters += 1
        my_function()
    else:
        numberOfLowercaseLetters += 1
        my_function()

my_function()