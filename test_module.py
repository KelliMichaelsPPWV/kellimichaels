##this is my module for advanced python notebook #3
import math

def sqr_foot():
    length = float(input("house length?"))
    width= float(input("what is the width?"))
    area= length*width
    print(area)
    return area

sqr_foot()

def circumfrence():
    radius=float(input('What is the radius?'))
    c= (2*math.pi*radius)
    print(c)
    return c

circumfrence()