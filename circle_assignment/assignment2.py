import numpy as np
import mpmath as mp
import matplotlib.pyplot as plt
from numpy import linalg as LA

import sys                                          #for path to external scripts
sys.path.insert(0,'/sdcard/Linearalgebra/CoordGeo')         #path to my scripts

#local imports
from line.funcs import *
from triangle.funcs import *
from conics.funcs import circ_gen

#if using termux
import subprocess
import shlex
#end if

#Input parameters
d = 5
a = 4
e1 = np.array(([1,0]))
# we know that the angle made by the tangent and radius of circle at point of contact is 90 degrees
#Centre and point 
O = d*e1 #Centre
P = np.array(([0,0])) #external point
theta = mp.acos(a/d)
Q = np.array(([a*mp.cos(theta),a*mp.sin(theta)]))
OQ=O-Q  # according to triangular law of vector addition
r=np.linalg.norm(OQ)
print(r);


##Generating all lines
xPQ = line_gen(P,Q)
xPO = line_gen(P,O)
xOQ = line_gen(O,Q)
##Generating the circle
x_circ= circ_gen(O,r)

#Plotting all lines
plt.plot(xPQ[0,:],xPQ[1,:],label='$Tangent$')
plt.plot(xPO[0,:],xPO[1,:],label='$PO$')
plt.plot(xOQ[0,:],xOQ[1,:],label='$Radius$')

#Plotting the circle
plt.plot(x_circ[0,:],x_circ[1,:],label='$Circle$')


#Labeling the coordinates
tri_coords = np.vstack((P,Q,O)).T
plt.scatter(tri_coords[0,:], tri_coords[1,:])
vert_labels = ['P','Q','O']
for i, txt in enumerate(vert_labels):
    plt.annotate(txt, # this is the text
                 (tri_coords[0,i], tri_coords[1,i]), # this is the point to label
                 textcoords="offset points", # how to position the text
                 xytext=(0,10), # distance from text to points (x,y)
                 ha='center') # horizontal alignment can be left, right or center

plt.xlabel('$x$')
plt.ylabel('$y$')
plt.legend(loc='best')
plt.grid() # minor
plt.axis('equal')
print("Radius of circle is 3cm")
#if using termux
plt.savefig('/sdcard/Linearalgebra/circle.pdf')
#subprocess.run(shlex.split("termux-open /storage/emulated/0/github/school/ncert-vectors/defs/figs/cbse-10-13.pdf"))
#else
#plt.show()
