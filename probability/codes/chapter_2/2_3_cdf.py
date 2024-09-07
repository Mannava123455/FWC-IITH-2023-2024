
import numpy as np
import matplotlib.pyplot as plt

#if using termux
import subprocess
import shlex
#end if



x = np.linspace(-10,10,100)   #points on the x axis
print(x)

simlen = int(1e6)    #number of samples
print(simlen)

err = [] #declaring probability list
def exp_cdf(x):
	return np.piecewise(x, [x<0, x>=0], [0, lambda x: 1-np.exp(-x/2)])

randvar = np.loadtxt('other.dat',dtype='double')
print(randvar)


for i in range(0,100):
	err_ind = np.nonzero(randvar < x[i]) #checking probability condition
	err_n = np.size(err_ind) #computing the probability
	err.append(err_n/simlen) #storing the probability values in a list
print(err_ind)
print(err_n)
print(err)	
plt.plot(x.T,err)#plotting the CDF
plt.scatter(x,exp_cdf(x),color='r')
plt.grid() #creating the grid
plt.xlabel('$x$')
plt.ylabel('$F_X(x)$')
plt.legend(["practical","Theory"])

plt.savefig('/home/mannava/latex/log.pdf')
plt.show() #opening the plot window
