#Write a function named collatz() that has one parameter named number.
#If number is even, then collatz() should print number // 2 and return this value.
#If number is odd, then collatz() should print and return 3*number+1.

#Then write a program that lets the user type in an integer
#and that keeps calling collatz() on that number until the function returns the value 1.

#Remember to convert the return value from input() to an integer with the int() function;
#otherwise, it will be a string value.

#Hint: An integer number is even if number %2 == 0, and it's odd if number %2 == 1.

#Add try and except statements to the previous project to detect whether the user types  in a noninteger string.
#Normally, the int() function will raise a ValueError error if it is passed a noninteger string, as in int('puppy')
#In the except clause, print a message to the user saying they must enter an integer.

def collatz(number):

    if number != 1:
        if number % 2 == 0:
            number = number // 2
            print(number)
        else:
            number = number * 3 + 1
            print(number)
        
            collatz(number)

try:
    collatz(int(input()))
except ValueError:
    print('Please input an integer.')
