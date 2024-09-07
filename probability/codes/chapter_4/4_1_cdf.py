#Importing numpy, scipy, mpmath and pyplot
import numpy as np
import matplotlib.pyplot as plt

#if using termux
#import subprocess
#import shlex
#end if


maxrange=100
maxlim=10.0
x = np.linspace(0,maxlim,maxrange)    #points on the x axis
simlen = int(1e6) #number of samples
err = [] #declaring probability list
pdf = [] #declaring pdf list
h = 2*maxlim/(maxrange-1);
x1_var = np.random.normal(0, 1, simlen)
x2_var = np.random.normal(0, 1, simlen)
v_var = x1_var**2 + x2_var**2

vec_tri_pdf = np.piecewise(x, [x < 0, x >= 0], [0, lambda x: 1-np.exp(-x/2)])
for i in range(0,maxrange):
	err_ind = np.nonzero(v_var < x[i]) #checking probability condition
	err_n = np.size(err_ind) #computing the probability
	err.append(err_n/simlen) #storing the probability values in a list
	
# pdf = np.gradient(err, x, edge_order=2)   #for finding pdf function

plt.scatter(x.T,err,color='r')   #plotting the CDF
plt.plot(x,vec_tri_pdf)
plt.grid()          #creating the grid
plt.xlabel('$x$')
plt.ylabel('$F_X(x)$')
plt.legend(["practical","Theory"])
plt.savefig('/home/mannava/latex/chisq_cdf.pdf')
plt.show()
plt.show() #opening the plot window
