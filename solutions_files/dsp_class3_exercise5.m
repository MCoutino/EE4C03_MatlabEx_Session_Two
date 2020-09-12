% et 4235 - Digital signal processing
% Class 3: Examples and exercises
%
% Toon van Waterschoot, Geert Leus, and Alle-Jan van der Veen
% 19-09-2011 -- Faculty of EEMCS, Delft University of Technology

clear;
close all;

%% EXERCISE 5: FILTERING AND ANALYSIS OF RANDOM NOISE SIGNALS
%
% 1. Generate and plot 1000 samples of zero mean unit variance white noise

N = 1000;
v = randn(N,1);

figure;
plot(v);

% 2. Calculate and plot the PSD

c_v = xcov(v);
P_v = fft(c_v);

figure;
plot(10*log10(abs(P_v)));

% 3. Design a highpass filter with one zero at z=0.9

h_hp = [1,-0.9];

% 4. Plot the frequency magnitude response

[H_hp,omega] = freqz(h_hp,1);
figure;
plot(omega,20*log10(abs(H_hp)));

% 5. Filter the white noise signal using the highpass filter

y_hp = filter(h_hp,1,v);

% 6. Calculate and plot the PSD of the resulting output signal

c_y_hp = xcov(y_hp);
P_y_hp = fft(c_y_hp);

figure;
plot(10*log10(abs(P_y_hp)));

% 7. Design a bandpass filter with central frequency ?c=1 rad, rz = 0.8, rp = 0.9

omega_c = 1;
r_z = 0.8;
r_p = 0.9;
b_bp = [1,-2*r_z*cos(omega_c),r_z^2];
a_bp = [1,-2*r_p*cos(omega_c),r_p^2];

% 8. Plot the frequency magnitude response

[H_bp,omega] = freqz(b_bp,a_bp);
figure;
plot(omega,20*log10(abs(H_bp)));

% 9. Filter the white noise signal using the bandpass filter

y_bp = filter(b_bp,a_bp,v);

% 10. Calculate and plot the PSD of the resulting output signal

c_y_bp = xcov(y_bp);
P_y_bp = fft(c_y_bp);

figure;
plot(10*log10(abs(P_y_bp)));

