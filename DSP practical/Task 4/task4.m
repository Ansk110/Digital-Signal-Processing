R = 100
C = 0.000008
Tau = R * C

fga = 1 / (2 *pi * Tau); % fga = 1/2*pi*R*C analog cut off frequency
fs = 600; %Sampling frequency
Ts = 1/fs;
fa = 0: .01: (fs/2);

z1 = 1i * 2 * pi * fa;
Gs = Tau * z1./(1+z1*Tau);
Gs_db = 20 * log10(abs(Gs)); %analog frequency response in db

[b, a] = bilinear([1], [Tau 1], fs); % bilinear transform

[z,p, k] = tf2zpk(b,a);
%%
figure("Name","magnitude and phase response")
subplot(2, 1, 1);
hold on;
freqz(b, a, 1024, fs); %digital frequency response
plot(fa, Gs_db, 'r'); %analog frequency response
legend('Digital Frequency Response', 'Analog Frequency Response');
hold off;

%%
%3d plotting
x = -1:0.02:1 ; % x axis
y = -1:0.02:1 ; % y axis
[X,Y] = meshgrid(x,y) ;
s1 = X + j.*Y ;
H1 = (s1 - z).*(s1 - z)./((s1-p).*(s1-p)) ; % function
figure("Name","3-D") ;
s3 = surf(X,Y,abs(H1),'FaceAlpha',.75); % 3D graph zeros and poles
camlight('headlight') ;