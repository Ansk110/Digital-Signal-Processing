%%PORTFOLIO 2
%  y[n]=0.35*x[n]+0.34*x[n-1]-0.78*y[n-2].

clc;clear;
a = [1, 0, 0.78] ;          %y coefficient
b = [0.35, 0.34] ;          %x coefficient

g = impz(b,a);              % impulse response 
n = 0:100;                  % range 
N = 50;                   % number of samples, random choice    

x = sin(2* pi * n/N );       % our input signal, sinosudal signal
y = conv(g ,x);              % Change in input singal through filter, OUTPUT singal
len_y = [0: length(y)-1];    % length of convoluted signal

%GRAPH

subplot(3,1,1), impz(b,a )   ;     %graph 1
xlabel("Range");
ylabel("Amplitude");
title("Impulse Response");


subplot(3,1,2), stem(n, x, 'r') ;     %graph 2
xlabel("Range");
ylabel("Amplitude");
title("Input Signal");

subplot(3,1,3), stem(len_y, y,'g');  %graph 1
xlabel("Range");
ylabel("Amplitude");
title("Output Signal");



