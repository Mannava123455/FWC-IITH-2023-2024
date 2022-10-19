import numpy as np
import mpmath as mp
import matplotlib.pyplot as plt
from numpy import linalg as LA
from pylab import *
import sympy as sym
import math
import sympy 
from sympy import Poly, roots, simplify

def circ_gen(O,r):
 len = 50
 theta = np.linspace(0,2*np.pi,len)
 x_circ = np.zeros((2,len))
 x_circ[0,:] = r*np.cos(theta)
 x_circ[1,:] = r*np.sin(theta)
 x_circ = (x_circ.T + O).T
 return x_circ

def parab_gen(y,a):
 x = y**2/a
 return x

def dir_vec(A,B):
  return B-A

def norm_vec(A,B):
  return np.matmul(omat,dir_vec(A,B))

def line_gen(A,B):
  len =10
  dim = A.shape[0]
  x_AB = np.zeros((dim,len))
  lam_1 = np.linspace(0,1,len)
  for i in range(len):
    temp1 = A + lam_1[i]*(B-A)
    x_AB[:,i]= temp1.T
  return x_AB

def line_dir_pt(m,A,k1,k2):
  len = 10
  dim = A.shape[0]
  x_AB = np.zeros((dim,len))
  lam_1 = np.linspace(k1,k2,len)
  for i in range(len):
    temp1 = A + lam_1[i]*m
    x_AB[:,i]= temp1.T
  return x_AB

#Circle parameters
O =  np.array(([3,0]))  # centre of circle
r = 3  # radius of circle.
a=4 # parabola parameter
V=np.array(([0,0],[0,1]))
u=np.array([-2,0])
x=sym.Symbol('x')
y=sym.Symbol('y')
X=np.array([x,y])
f=0
F=X@V@np.transpose(X)+2*u@X+f
print("equation of parabola is : {}=0 ".format(F))
V1=np.array(([1,0],[0,1]))
u1=np.array([-3,0])
f1=0
F1=X@V1@np.transpose(X)+2*u1@X+f1
print("equation of circle is : {}=0 ".format(F1))
x_circ=circ_gen(O,r)
x2=np.linspace(-4,4,100)
y2=0.57735026919*x2+1.732
plt.plot(x2, y2, '-r', label='equation of tangent')
#equation of tangent to parabola at x1,y1

x1=sym.Symbol('x1')
y1=sym.Symbol('y1')
q=np.array([y1**2/4,y1])
F2=np.transpose(V@np.transpose(q)+np.transpose(u))@np.transpose(X) + u@np.transpose(q) + f
print("equation of tangent to parabola at (x1,y1) is : {}=0 ".format(F2))
n=np.array([-2,y1])
print("The normal vector to the tangent of the parabola at (x1,y1) is  : {}".format(n))
#consider the equation of circle 
k1=np.sqrt(u1@V1@np.transpose(u1))
k2=n@V1@np.transpose(n)
k=k1/k2**(1/2)
print("k={}".format(k))
q1=V1@(k*np.transpose(n)-np.transpose(u1))
print(q1)
q3=q-q1
print(q3)
res=n@np.transpose(q3)
print(res)
simple_1=simplify(res, som=True, mul_to_power=True)
print(simple_1)

print(simplify(simplify(simple_1, som=True), mul_to_power=True))
#polynomial = Poly(simple_1, gen=y1)
#print(roots(polynomial))
print("The equation for y1 is :{}=0".format(res))
point=np.array([1.5,1.5*np.sqrt(3)])
print("point of contact of tangent on circle is : {} ".format(point))
n3=np.array([1.5,-1.5*np.sqrt(3)])
print("The equation of tangent is : {} =0".format(n3@(X-point)))
#Generating the parabola
p_y = np.linspace(-4,4,100)
xparab = parab_gen(p_y,a)
#Plotting the circle
plt.plot(x_circ[0,:],x_circ[1,:],label='Circle')

#Plotting the parabola
plt.plot(xparab,p_y,label='Parabola')
B=np.array([0,1.732])
A=np.array([-3,0])
plt.scatter(O[0],O[1])
plt.scatter(A[0],A[1])
plt.scatter(B[0],B[1])
vert_labels = ['O','A','B']
#for i, txt in enumerate(vert_labels):
plt.annotate("O", # this is the text
                 (O[0],O[1]), # this is the point to label
                 textcoords="offset points", # how to position the text
                 xytext=(0,10), # distance from text to points (x,y)
                 ha='center') # horizontal alignment can be left, right or center

plt.annotate("A", # this is the text
                 (A[0],A[1]), # this is the point to label
                 textcoords="offset points", # how to position the text
                 xytext=(0,10), # distance from text to points (x,y)
                 ha='center') # horizontal alignment can be left, right or center


plt.annotate("B", # this is the text
                 (B[0],B[1]), # this is the point to label
                 textcoords="offset points", # how to position the text
                 xytext=(0,10), # distance from text to points (x,y)
                 ha='center') # horizontal alignment can be left, right or center
plt.xlabel('$x$')
plt.ylabel('$y$')
plt.legend(loc='best')
plt.grid() # minor
plt.axis('equal')

#if using termux
plt.savefig('/sdcard/Linearalgebra/p.pdf')
#subprocess.run(shlex.split("termux-open /storage/emulated/0/github/cbse-papers/2020/math/12/solutions/figs/matrix-12-15.pdf"))
#else
#plt.show()
