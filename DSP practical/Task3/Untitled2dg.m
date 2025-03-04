fga = 240 ; % Cut-off frequency analogue
fa = 0:fga/100:fga ; %frequency vector till fga
fs = 1000; % suitable sampling frequency
Ts = 1 /fs ; % sampling period
s = j*2*pi*fa; % S term
tau = 1/(2*pi*fga); % RC constant
Gs = 1./(tau*s + 1) ; % Laplace trasfer function
Gdb = 20*log10(abs(Gs)) ;
W = 2*atan(pi*fga*Ts) ; % digital angular cut−off freq (4.21)
fgd = W/2/pi/Ts ; % digital cut-off freq
%without Pre wrapping
figure("Name","Without prewrapping") ;
[b,a] = bilinear([1],[tau 1],fs) ; % bilinear transformation withoutprewrapping
freqz(b, a, 1024, fs/2); %digitial frequency Response
subplot(2,1,1);
%Analogue frequency response
hold on ;
plot(fa,Gdb, 'g-') ; % analoge response
plot([0 fs/2],[-3 -3],'k-') % −3 dB line
plot([fgd fgd],[-100 -3],'b--'); % analog cut−off freq.
plot([fga fga],[-100 -3],'k--'); % analog cut−off freq.
title("Without prewrapping") ;
legend('Digital freq resp','Analog Freq resp','-3dB','Digital Cut-offfreq','Analog Cut-off freq','Location','south');
hold off;
%Pre wrapping section
6
f0 = 245 ; % new cut-off frequency
% figure 2
figure("Name","With prewrapping") ;
[b_pre a_pre] = bilinear(1,[tau 1],fs,f0); % bi-linear with prewrapping
freqz(b_pre, a_pre, 1024, fs);
subplot(2,1,1);
hold on ;
plot(fa,Gdb, 'g-') ; % analoge response
plot([0 fs/2],[-3 -3],'k-') % −3 dB line
plot([fgd fgd],[-100 -3],'b--'); % analog cut−off freq.
plot([fga fga],[-100 -3],'k--'); % analog cut−off freq.
plot([f0 f0],[-100 -3],'r--'); % analog cut−off freq.
title("With prewrapping") ;
legend('Digital freq resp','Analog Freq resp','-3dB','Digital Cut-offfreq','Analog Cut-off freq','New Cut-off freq','Location','southeast');
hold off ;
%% 3D- PLOT Task 2
x = -1:0.02:1 ; % x axis
y = -1:0.02:1 ; % y axis
[X,Y] = meshgrid(x,y) ;
s1 = X + j.*Y ;
z = [0 -0.8] ; % zeros vector
p1 = 0.1 + 0.4359*j ; % pole 1
p2 = 0.1 - 0.4359*j ; % pole 2
H1 = ((s1 - z(1)).*(s1 - z(2)))./((s1-p1).*(s1-p2)) ; % function
figure("Name","3-D") ;
s3 = surf(X,Y,abs(H1),'FaceAlpha',.75); % 3D graph zeros and poles
camlight('headlight') ;