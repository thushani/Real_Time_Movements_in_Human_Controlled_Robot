from scipy.fftpack import hilbert
from scipy.signal import iirfilter,zpk2sos,sosfilt

def bandpass(data, freqmin, freqmax, df, corners=4, zerophase=False):

    fe = 0.5 * df
    low = freqmin / fe
    high = freqmax / fe
    if high - 1.0 > -1e-6:
        return highpass(data, freq=freqmin, df=df, corners=corners,zerophase=zerophase)
    z, p, k = iirfilter(corners, [low, high], btype='band',ftype='butter', output='zpk')
    sos = zpk2sos(z, p, k)
    return sosfilt(sos, data)