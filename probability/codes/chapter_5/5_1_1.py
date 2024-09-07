import numpy as np
import matplotlib.pyplot as plt
import scipy.special as sp


rng = np.random.default_rng()

A = 4
s0 = np.array([1,0]).reshape(2,1)
s1 = np.array([0,1]).reshape(2,1)

num_samples = 50
N = rng.normal(size=(2, num_samples))

y_s0 = A*s0 + N
y_s1 = A*s1 + N
print(y_s0)
print(y_s1)
#  x^ = s0 if y>x  , x^ = s1 if y<x
plt.scatter(y_s0[0], y_s0[1])
plt.scatter(y_s1[0], y_s1[1])
plt.plot(np.linspace(0, A, 100), np.linspace(0, A, 100), color='black')
plt.xlabel('x')
plt.ylabel('y')
plt.legend(["$y|s_0$","$y|s_1$"])
plt.grid()

plt.savefig('/home/mannava/latex/biv_scatter.pdf')

plt.show() #opening the plot window
