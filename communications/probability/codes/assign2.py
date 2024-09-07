'''
uniform random variables

cdf function is defined as 

F_X(x) = p(X<=x)
'''


import numpy as np
import math
import matplotlib.pyplot as plt
import random

simlen = 10**6
uniform_random_variable = np.random.rand(simlen)
X = np.linspace(-10,10,100)
err = []
for i in range(0,100):
    count = np.nonzero(uniform_random_variable < X[i])
    len_count = np.size(count)
    err.append(len_count/simlen)

plt.plot(X,err)
plt.show()



