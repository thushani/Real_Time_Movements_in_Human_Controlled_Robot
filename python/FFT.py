import numpy as np
import matplotlib.pyplot as plt
from scipy.fftpack import fft

def FFT(data,fs,NAME,l):
    T = 1/fs
    L = l
    time = np.arange(0,L - 1)*T ;
    f = fs*(np.arange(0,L/2))/L
    Y =  np.fft.fft(data)
    P2 = abs(Y/L)
    P1 = P2[range(L/2 + 1)];
    return P1