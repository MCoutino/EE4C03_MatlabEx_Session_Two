% et 4235 - Digital signal processing
% Class 3: Examples and exercises
%
% Toon van Waterschoot, Geert Leus, and Alle-Jan van der Veen
% 19-09-2011 -- Faculty of EEMCS, Delft University of Technology

clear;
close all;

%% EXERCISE 4: DESIGN AND ANALYSIS OF ELEMENTARY DIGITAL FILTERS
%
% 1. Design a highpass filter with one zero at z=0.9

h_hp = [1,-0.9];

% 2. Plot the pole-zero diagram in the complex plane

figure;
zplane(h_hp,1);

% 3. Plot the frequency response (magnitude & phase)

[H_hp,omega] = freqz(h_hp,1);
figure;
plot(omega,20*log10(abs(H_hp)));
figure;
plot(omega,unwrap(angle(H_hp)));

% 4. Design a bandpass filter with central frequency omega_c=1 rad, r_z =
% 0.8, r_p = 0.9 

omega_c = 1;
r_z = 0.8;
r_p = 0.9;
b_bp = [1,-2*r_z*cos(omega_c),r_z^2];
a_bp = [1,-2*r_p*cos(omega_c),r_p^2];

% 5. Plot the pole-zero diagram in the complex plane

figure;
zplane(b_bp,a_bp);

% 6. Plot the frequency response (magnitude & phase)

[H_bp,omega] = freqz(b_bp,a_bp);
figure;
plot(omega,20*log10(abs(H_bp)));
figure;
plot(omega,unwrap(angle(H_bp)));

