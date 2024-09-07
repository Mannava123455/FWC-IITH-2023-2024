import numpy as np
import matplotlib.pyplot as plt


rng = np.random.default_rng()
min_gamma = 0
max_gamma = 10
num_samples = 1000000

min_bin = -5
max_bin = 5
num_bins = 100
hist_bins = np.linspace(min_bin, max_bin, num_bins)
print(hist_bins)
integ_limit = np.where(hist_bins > 0)[0][0]
print(integ_limit)

prob_error_num = []
prob_error_th = []
gamma_db = np.arange(min_gamma, max_gamma + 1)
for i in gamma_db:
    gamma = 10**(0.1*i)
    A_samples = rng.rayleigh((gamma/2)**0.5, num_samples) 
    N_samples = rng.normal(size=num_samples) 
    prob_error_num.append(np.count_nonzero(A_samples+N_samples < 0)/num_samples)
    prob_error_th.append(0.5-0.5*np.sqrt(gamma)/np.sqrt(2+gamma))

plt.scatter(gamma_db, prob_error_num, color='r')
plt.semilogy(gamma_db, prob_error_th)
plt.grid()
plt.xlabel('$\gamma$')
plt.ylabel('$P_e(\gamma)$')
plt.legend(["Simulated","Theory"])

plt.savefig('/home/mannava/latex/prob_error.pdf')
plt.show()

