#Question 1
#Write a function to print "hello_USERNAME!" USERNAME is the input of the function. The first line of the code has been defined as below.

def hello_name(user_name):
        print("hello_" + user_name + "!")
#testing the function
hello_name("brad")
               
#Question 2
#Write a python function, first_odds that prints the odd numbers from 1-100 and returns nothing

def first_odds():
    for i in range (1,101):
        if i % 2 != 0:
            print(i)
#testing the function
first_odds()

#Question 3
#Please write a Python function, max_num_in_list to return the max number of a given list. The first line of the code has been defined as below.

a_list = [0,1,2,3,4,5]


def max_num_in_list(a_list):
    current_max = a_list[0]
    for i in a_list:
        if i>= current_max:
            current_max=i
    return current_max        
#Testing the function
print("I found the max! It is "+ str(max_num_in_list(a_list)))
        

               
#Question 4
#Write a function to return if the given year is a leap year. A leap year is divisible by 4, but not divisible by 100, unless it is also divisible by 400. The return should be boolean Type (true/false).
  
def is_leap_year(a_year):
    if (a_year)%400 ==0:
        print ("It's a leap year")
        return True
    if (a_year)%4 == 0 and (a_year)%100 != 0:
        print ("It's a leap year")
        return True
    else:
        return False 
#testing the function    
print("This is leap year? " +str(is_leap_year(1789)))
               
#Question 5
#Write a function to check to see if all numbers in list are consecutive numbers. For example, [2,3,4,5,6,7] are consecutive numbers, but [1,2,4,5] are not consecutive numbers. The return should be boolean Type.
def is_consecutive(a_list):
    for i in range(len(a_list) - 1):  
        if (a_list[i + 1] - a_list[i] )!= 1:  
            return False
    return True

# Testing the function
print(is_consecutive([1, 2, 3, 4]))  
print(is_consecutive([1, 2, 4, 9]))  