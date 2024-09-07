import numpy as np
import matplotlib.pyplot as plt

simlen=int(1e6)
randvar=np.loadtxt('uni.dat',dtype='double')

#mean

temp=0
for i in range(0,simlen):
    temp=temp+randvar[i]
    
mean=temp
m=mean/simlen
print("Mean of uniform random variable is : {}".format(mean/simlen))

#variance
temp1=0
for i in range(0,simlen):
    temp1=temp1+pow(randvar[i],2)

x=temp1/simlen
variance=x-pow(m,2)
print("variance of uniform random variable is : {}".format(variance))



