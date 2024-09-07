from scipy import*
from pylab import*
import matplotlib.pyplot as plt
import array
import numpy as np
import random



n=10  #length of message signal
bin_ip_seq = np.random.choice([0, 1], size=(n))  #generating random input signal
n=len(bin_ip_seq)
print ("The input binary sequence is : ")
print (bin_ip_seq)
print(n)
print("\r")
#passing it to non return to zero level encoder


NRZ_INP=np.zeros(n)
for i in range(0,n):
    NRZ_INP[i]= 2*bin_ip_seq[i] -1

print (NRZ_INP)
    
print("\r")   
 
#PN sequence Generator

A = np.array([randint(0,2),randint(0,2),randint(0,2)])  # pattern
print(A)


size = 2**len(A) - 1  # size of PN lenth 

PN = []

for i in range(size):
	PN.append(A[-1])
	A = [A[-1]^A[-2], A[0], A[1]]

for i in range(0,size):
    PN[i]= 2*PN[i] -1
print("NON ZERO TO RETURN PN \r")


#PN sequence Multiplier
z=[]

for i in range(0,n):
	for j in range(1):
		for k in range(0,size):
				z.append(PN[k]*NRZ_INP[i])
		
N=len(z)    #6350
print(z)
print(len(z))
print("\r")

#BPSK Modulator

Tb=1
t=r_[0:Tb:0.01] #100
fc=1
carrier=sqrt(2*(Tb**-1))*sin(2*pi*fc*t) #100
M=len(carrier)

bpskarray=[]
for i in range(0,N):
  if z[i]>=0:
    bpskarray.append(carrier)#100
	
  else:
    bpskarray.append((-1*carrier))
bpsksignal=concatenate(bpskarray)#5000
print("bpsksignal")
print(len(bpsksignal))
print(bpsksignal) #5000



#Jamming signal
	#Jamming

x=[]

x=rand(n*700)
t1=r_[0:n*0.7:0.001]
Eb=.000001*var(carrier)*len(t1)
print(len(t1))
jamming=Eb*x*(sqrt(2*(Tb**-1))*(np.cos(2*np.pi*fc*t1)+1j*(np.sin(2*np.pi*fc*t1))))
print("\n Jamming")
print (jamming)
jamvar=10**(-0.1*(jamming))

print("varience of carrier\n")
print(Eb)
snr=Eb*((jamvar)**-1)
print(snr)



snrdb=10*log10(snr)
print("\nsnrdb")
print(snrdb)
print(len(snrdb))



print("Reception\n")
#Reception

receivedsignal=np.array(bpsksignal)+np.array(jamming)
receivearr=[]
print("\n Received signal")
print(receivedsignal)
ber=[]

for i in range(50):
	noise2=sqrt(i)*randn(len(bpsksignal))
	recsig=bpsksignal+noise2
	receivearr=[]
	
	for j in range(N):
		out = sum(carrier*recsig[j*M:(j+1)*M])
		
		#print(out)		
		if out>0:
			receivearr.append(1)
		else:
			receivearr.append(-1)
	rbit=receivearr

	berate=sum(abs(np.array(z)-rbit))*(n**-1)
	print(berate)
	ber.append(berate)
print("\nDemodulated signal")
print(receivearr)
print("\r")
w=len(receivearr)

#PN Squence Multiplication
q=[] 
x=0
for i in range(int(N/size)):
	for k in range(size):	
			q.append(PN[k]*receivearr[x])
			x+=1

print("\nPN multiplied")
print (q)
print(len(q))

print("\r")
#Final array generation
ber=[]
finalarr=[]
for i in range(0,len(q),size):
	if q[i]==-1:
	 	 finalarr.append(0)
	else:
		 finalarr.append(1)


	
print("\nBER")
print(ber)
print(len(ber))

print("\nFinal arary")	
print(finalarr);	
print(len(finalarr))
print("\nbinary input")
print(bin_ip_seq)




#check whether input sequence in same as received seq
for i in range(n):
	if (finalarr[i]==bin_ip_seq[i]):
		c=1
	else:
		c=0
		break

if(c==1):
	print("\nyes")
else:
	print("NO")

print(len(snr))
print(len(jamming))
print(len(ber))
print(len(carrier))
print(len(q))
#plot the error graph pp

figure(1)
plt.subplot(2,3,1);
xlabel('Time')
ylabel('Signal')
plt.plot(bin_ip_seq)


plt.subplot(2,3,2)
xlabel('Time')
ylabel('Carrier')
plt.plot(carrier)



plt.subplot(2,3,3)
xlabel('Time')
ylabel('Jamming')
plt.plot(jamming)


plt.subplot(2,3,4)
plt.plot(bpsksignal)
xlabel('Time')
ylabel('BPSK Signal')

plt.subplot(2,3,5)
xlabel('Time')
ylabel('Received Signal')
plt.plot(receivedsignal)


plt.subplot(2,3,6)
xlabel('Time')
ylabel('demodulated')
plt.plot(finalarr)
plt.show()
