#Importing numpy, scipy, mpmath and pyplot
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


randvar = np.loadtxt('uni.dat',dtype='double')
print(randvar)


for i in range(0,100):
	err_ind = np.nonzero(randvar < x[i]) #checking probability condition
	err_n = np.size(err_ind) #computing the probability
	err.append(err_n/simlen) #storing the probability values in a list
print(err_ind)
print(err_n)
print(err)	

uni_cdf = np.piecewise(x, [x < 0, ((x >= 0) & (x < 1)),x>=1], [0, lambda x: x, 1])
plt.scatter(x.T,err,color='r')#plotting the CDF
plt.plot(x,uni_cdf)
plt.grid() #creating the grid
plt.xlabel('$x$')
plt.ylabel('$F_X(x)$')
plt.legend(["practical","theory"])

plt.savefig('/home/mannava/latex/uni_cdf.pdf')
plt.show() #opening the plot window



# The cdf function is at practically calculated as:

#Fx(x)={  x  ;0<=x<=1
#      {  0  ;elsewhere
