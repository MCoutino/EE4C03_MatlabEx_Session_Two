% et 4235 - Digital signal processing
% Class 3: Examples and exercises
%
% Toon van Waterschoot, Geert Leus, and Alle-Jan van der Veen
% 19-09-2011 -- Faculty of EEMCS, Delft University of Technology

clear;
close all;

%% EXERCISE 1: GENERATION AND ANALYSIS OF RANDOM NOISE SIGNALS
%
% 1. Generate and plot 1000 samples of zero mean unit variance white noise

N = 1000;
v = randn(N,1);

figure;
plot(v);

% 2. Calculate and plot the sample autocovariance function for |lag|<=100

c_v = xcov(v,100);

figure;
plot(c_v);

% 3. Calculate and plot the power spectral density 

P_v = fft(c_v);

figure;
plot(10*log10(abs(P_v)));

% 4. Split the white noise signal into 10 segments of 100 samples each

v_split = reshape(v,100,10);

% 5. Calculate and plot the average sample autocovariance function (|lag|<100)

c_v_split = zeros(201,10);
for i = 1:10,
    c_v_split(:,i) = xcov(v_split(:,i),100);
end
c_v_split_average = mean(c_v_split,2);

figure;
plot(c_v_split_average);

% 6. Calculate and plot the average power spectral density

P_v_split_average = fft(c_v_split_average);

figure;
plot(10*log10(abs(P_v_split_average)));


