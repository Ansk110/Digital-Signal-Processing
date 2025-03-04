fga = 200; % fga = R/2*pi*L analog cut off frequency
fgd1 = 205; % digital cut off frequency after pre-wrapping
fs = 600; %Sampling frequency
Ts = 1/fs;
fa = 0: .01: (fs/2);
Tau = 1/(2* pi* fga); %time constant
W = 2*atan(pi*fga*Ts); % digital angular cut−off freq 
fgd = W/2/pi/Ts; % digital cut−off frequency 


z = 1i * 2 * pi * fa;
Gs = 1./(1 + z.*Tau); % Laplace function
Gs_db = 20 * log10(abs(Gs)); %analog frequency response in db

[b, a] = bilinear([1], [Tau 1], fs); % bilinear transform
%%
subplot(2, 1, 1);
hold on;
freqz(b, a, 1024, fs/2); %digital frequency response
plot(fa, Gs_db, 'r'); %analog frequency response
legend('Digital Frequency Response', 'Analog Frequency Response');
hold off;
[b_pre, a_pre] = bilinear([1], [Tau 1], fs, fgd1); % bilinear transform
figure()
freqz(b_pre, a_pre, 1024, fs); %digital frequency response
%%
figure()
subplot(2, 1, 1);
hold on;
plot([0 fs/2],[-3 -3],'g-') % −3 dB line
plot([fgd fgd],[-80 -3],'b--'); % digital cut−off freq.
plot([fga fga],[-80 -3],'k--'); % analog cut−off freq.
plot([fgd1 fgd1],[-80 -3],'r--');
legend('-3db line', 'Digital Cutoff Frequency', 'Analog Cutoff Frequency', 'New Digital Cutoff Freq');
hold off;

%% Task 2
figure()
load('p4_pz_ss2021.mat');
pzmap(p,z);

x = -1:0.02:1;
y = -1:0.02:1;
 [X,Y] = meshgrid(x,y); %x/y?plane
 s = X + 1i*Y;
Z =((s-z(1)).*(s-z(2)))./((s-p(1)).*(s-p(2)));

 k = surf(X,Y,abs(Z),'FaceAlpha',0.2); %making the surface transparent
 k.EdgeColor = [0 1 1]; %'blue