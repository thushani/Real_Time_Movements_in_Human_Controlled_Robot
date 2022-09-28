import scipy,numpy,multirate,FFT,np,obspy,BandPass,mne,RMS,MA,SG
import matplotlib.pyplot as plt
from scipy.io import wavfile as wav
from scipy import signal
from scipy.signal import butter, lfilter
from obspy.signal import filter
from mne import filter

y = scipy.io.wavfile.read('2.wav', 'rb')
fs = np.array(y[0])
data = np.array(y[1])
data = multirate.decimate(data, 21)
#----------------Normalization----------------------
y1 = (data - numpy.mean(data, axis=0)) / numpy.std(data)
Norm = FFT.FFT(y1,fs,'Normalized',len(data))
fs = 1024
plt.figure(1) 
plt.plot(Norm , color='blue', linewidth=1)
plt.title('fft norm')
plt.figure(2)   
plt.plot(y1 , color='blue', linewidth=1)
plt.title('Normalized Signal')
#-----------------Noise Reduction--------------------------
NF = obspy.signal.filter.bandstop(y1,55,60,fs,2,'False')
NF1 = FFT.FFT(NF,fs,'Notch',len(data))
plt.figure(4) 
plt.plot(NF1 , color='blue', linewidth=1)
plt.title('fft NF')
plt.figure(5)   
plt.plot(NF, color='blue', linewidth=1)
plt.title('Notch Signal')

BPF = BandPass.bandpass(NF, 1, 200, fs, 4, 'False')#filters.butter_bandpass_filter(y1,0.1,20.0,fs,4)
BPF1 = FFT.FFT(BPF,fs,'Band pass',len(data))
plt.figure(6) 
plt.plot(BPF1 , color='blue', linewidth=1)
plt.title('fft BPF')
plt.figure(7)   
plt.plot(BPF , color='blue', linewidth=1)
plt.title('Band Pass Signal')
#---------------------Smoothing Tech 1(RMS)----------------
RMS_C = RMS.rms_conv(BPF,1000)
plt.figure(8)   
plt.plot(RMS_C , color='red', linewidth=1)
plt.title('RMS conv Signal')

RMS_M = RMS.rms(BPF,1000,1,0)
plt.figure(9)   
plt.plot(RMS_M , color='red', linewidth=1)
plt.title('RMS mean Signal')

MA = MA.moving_average(BPF, 1000) 
plt.figure(10)   
plt.plot(MA , color='red', linewidth=1)
plt.title('MA Signal')

SG = SG.savitzky_golay(BPF, 999,4) 
plt.figure(11)   
plt.plot(SG , color='red', linewidth=1)
plt.title('Savitzky-Golay Signal')

plt.show()