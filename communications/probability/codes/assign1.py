'''
assign 1: sum of two random variables.
two die are thrown find the probabilty of sum of numbers on die.
'''

import numpy as np
import math
import matplotlib.pyplot as plt

simlen = 10000
#generate a uniform random variable X1 in between 1 and 6
x1 = np.random.randint(1,7,size = simlen)
x2 = np.random.randint(1,7,size = simlen)

#sum of 2 random variables
x = x1+x2

#find the occurance of each number in the list of simlen array
unique,counts = np.unique(x,return_counts = True)
pdf  = counts/simlen
cdf  = np.cumsum(counts)/simlen

#plot the probability density function of x
plt.subplot(2,1,1)
plt.stem(unique,pdf)

#plot the probability Distribution  function of x
plt.subplot(2,1,2)
plt.stem(unique,cdf)
plt.show()

