import numpy as np
import scipy
from scipy.signal import lfilter
import matplotlib.pyplot as plt
import itertools as it

def moving_average(a, n) :
	return np.convolve(a, np.ones((n,))/n, mode='valid')
