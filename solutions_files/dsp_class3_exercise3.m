% et 4235 - Digital signal processing
% Class 3: Examples and exercises
%
% Toon van Waterschoot, Geert Leus, and Alle-Jan van der Veen
% 19-09-2011 -- Faculty of EEMCS, Delft University of Technology

clear;
close all;

%% EXERCISE 3: GENERATION AND ANALYSIS OF NONSTATIONARY SIGNALS
%
%1. Read the sound file speech_dft.wav (included in Simulink DSP Blockset)
%into a vector in the MATLAB workspace 

[x,fs,nbits] = wavread('speech_dft.wav');

% 2. Plot and play back the time-domain signal 

figure;
plot(x);

soundsc(x,fs,nbits);

% 3. Plot the spectrogram, using the following parameters:
%   - length of segments = 256 samples
%   - overlap of segments = 128 samples
%   - length of segment DFT = 256 samples
%   - visible frequency range = half sampling rate
%   - time on x-axis, frequency on y-axis

figure;
spectrogram(x,256,128,256,fs,'yaxis');
