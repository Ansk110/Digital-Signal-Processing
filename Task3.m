%%PORTFOLIO 3
%Calculation of the Discrete Fourier Transform (DFT)

clear;
fs = 150; %sampling frequency
ts = 1 / fs  ; %sampling time

fb = 2 ;
fss = 0.5 ;

n  = 0 : (fs-1);
f  = 0 : 1 : (fs-1);

x1 = abs( 4 * sin(2*pi * (fb/fs) * n));
x2 = abs( 2 * cos(2*pi * (fss/fs) * n));

y  = x1 + x2;

%% First Window
DFT = fft(y); %discrete fourior transformation
m1 = abs(DFT); %magnitude of DFTed signal
p1 = angle(DFT); % phase of DFTed signal
r1 = real(DFT); %real part
i1 = imag(DFT);
%% Second Window
w1 = blackman(fs)'; % Black window
y2 = y.* w1;
%% Input signals
figure();
subplot(2,2,1); 
stem(n,x1, 'r'); 
grid('minor');
grid on;  
title('Change in the weight of waste collected On busy days');
xlabel('Number of days (samples)'); 
ylabel('Weight');
axis([0, fs, 0, 5]);

subplot(2,2,2); 
stem(n, x2, 'b');
grid('minor');
grid on;  
title('Change in the weight of waste collected On free days');
xlabel('Number of days (samples)'); 
ylabel('Weight');
axis([0, fs, 0, 5]);

subplot(2,1,2); 
stem(n, abs(y), 'k');
grid('minor');
grid on;  
title('Superimposed signal'); 
xlabel('Number of days (samples)'); 
ylabel('Weight');
axis([0, fs, 0, 8]);
%% No window Calculation
figure();
subplot(2,2,1); 
stem(f, m1, 'b'); 
grid on;  
xlabel('frequency'); 
ylabel('magnitude');

subplot(2,2,2); 
stem(f, p1*180/pi, 'r'); 
grid on;
xlabel('frequency'); 
ylabel('Phase');

subplot(2,2,3); 
stem(f, r1, 'g'); 
grid on;
xlabel('frequency'); 
ylabel('real');

subplot(2,2,4); 
stem(f, i1, 'm'); 
grid on;
xlabel('frequency'); 
ylabel('imaginary');
%% Triangular window calculations
figure();
subplot(2,1,1)
plot(n, DFT, 'r'); 
grid on;
xlabel("Sample");
ylabel("Frequency");
title('Non Windowed');
axis([0, fs, 0, 10]);

subplot(2,1,2)
stem(n, y2, 'r'); 
grid on;  
title('Blackman Windowed signal');
axis([0, fs, 0, 10]);
