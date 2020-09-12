% et 4235 - Digital signal processing
% Class 3: Examples and exercises
%
% Toon van Waterschoot, Geert Leus, and Alle-Jan van der Veen
% 19-09-2011 -- Faculty of EEMCS, Delft University of Technology

clear;
close all;

%% EXERCISE 2: GENERATION AND ANALYSIS OF HARMONIC SIGNALS
%
% 1. Generate and plot 2048 samples of a sum of M=10 sinusoids with unit
% amplitudes, uniformly distributed random phases, and frequencies omega_m
% = m*(2*pi)/64 

N = 2048;
M = 10;
T_0 = 64;
omega_0 = 2*pi/T_0;
n = [1:N]';
A = ones(M,1);
phi = 2*pi*rand(M,1);
x = A(1)*sin(omega_0*n + phi(1));
for m = 2:M,
   x = x + A(m)*sin(m*omega_0*n + phi(m));
end

figure;
plot(x);

% 2. Calculate and plot the sample autocovariance function for |lag|<=128

c_x = xcov(x,128);

figure;
plot(c_x);

% 3. Calculate and plot the power spectral density 

P_x = fft(c_x);

figure;
plot(10*log10(abs(P_x)));

% 4. Construct the 128x128 autocovariance matrix and plot its eigenvalues

R_x = toeplitz(c_x(128+1:128+128));
lambda = eig(R_x);
figure;
plot(lambda);
