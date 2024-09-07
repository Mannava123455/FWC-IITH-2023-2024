import numpy as np
import matplotlib.pyplot as plt
#If using termux
import subprocess
import shlex
#end if

#Sample size
simlen = 10000
#Possible outcomes
n = range(2,13)
# Generate X1 and X2
y = np.random.randint(1,7, size=(2, simlen))
print(y)
#Generate X
X = np.sum(y, axis = 0)
print(X)
#Find the frequency of each outcome
unique, counts = np.unique(X, return_counts=True)
#Simulated probability
psim = counts/simlen
print(psim)
#Theoretical probability
n1 = range(2,8)
n2 = range(8,13)
panal1 = (n1 -np.ones((1,6)))
panal2 = (13*np.ones((1,5))-n2)
panal = np.concatenate((panal1,panal2),axis=None)/36
print(panal)
#Plotting
plt.stem(n,psim, markerfmt='o', use_line_collection=True, label='Simulation')
plt.stem(n,panal, markerfmt='o',use_line_collection=True, label='Analysis')
plt.xlabel('$n$')
plt.ylabel('$p_{X}(n)$')
plt.legend()
plt.grid()# minor

#If using termux
plt.savefig('/home/mannava/latex/pmf_dice.pdf')
#plt.savefig('figs/pmf.png')
#else
#plt.show()
