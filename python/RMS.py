import numpy as np

def rms_conv(a, window_size):
	a2 = np.power(a,2)
  	window = np.ones(window_size)/float(window_size)
  	return np.sqrt(np.convolve(a2, window, 'valid'))

def rms(signal, windowlength, overlap, zeropad):
    indices = np.arange(1, len(signal), windowlength)
    RMS = np.zeros(len(indices)+1)
    signal = signal**2
    index = 0
    for i in indices :
        index = index+1                                  
        RMS[index] = np.sqrt(np.mean(signal[i:i+windowlength-1]))
    return RMS
