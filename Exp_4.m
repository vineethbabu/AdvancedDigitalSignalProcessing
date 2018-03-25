clc
close all
clear all

N=21;%input('Enter the Length of filter:');
cutoff=pi/2;%('Enter the cut off frequency:');
h=zeros(1,N);
M=(N-1)/2;
for i=0:N-1
    
    h(i+1)=(sin(cutoff*(i-M))/(pi*(i-M)));
end

h(M+1)=cutoff/pi;
   
% Bartlett triangular window %
W=bartlett(21);


h1=W'.*h;

w1=0:1/100:pi;
H=0;
j=sqrt(-1);
for n=1:length(h)
    H=H+(W(n).*h(n))*exp(-j*w1*n);
end
figure
plot(w1,abs(H))
title('Bartlett triangular window')
figure
plot(w1,20*log(abs(H)))

% rectangular window %
W1=rectwin(21);


hk=W1'.*h;

w1=0:1/100:pi;
Hk=0;
j=sqrt(-1);
for n=1:length(h)
    Hk=Hk+(W1(n).*h(n))*exp(-j*w1*n);
end
figure
plot(w1,abs(Hk))
title('rectangular window')
figure
plot(w1,20*log(abs(H)))


% Hanning Window Method %
han=hanning(21);

h2=han'.*h;

w1=0:1/100:pi;
H1=0;
j=sqrt(-1);
for n=1:length(h)
    H1=H1+h2(n)*exp(-j*w1*n);
end
figure
plot(w1,abs(H1))
title('Hanning window')
figure
plot(w1,20*log(abs(H1)))



% Hamming Window Method %
ham=hamming(21);

h3=ham'.*h;

w1=0:1/100:pi;
H2=0;
j=sqrt(-1);
for n=1:length(h)
    H2=H2+h3(n)*exp(-j*w1*n);
end
figure
plot(w1,abs(H2))
title('Hamming window')
figure
plot(w1,20*log(abs(H2)))

% Blackman Window Method %
b=blackman(21);

h4=b'.*h;

w1=0:1/100:pi;
H3=0;
j=sqrt(-1);
for n=1:length(h)
    H3=H3+h4(n)*exp(-j*w1*n);
end
figure
plot(w1,abs(H3))
title('Blackman window')
figure
plot(w1,20*log(abs(H3)))

% Kaiser Window Method %
k1=kaiser(21,4);
k2=kaiser(21,6.5);
k3=kaiser(21,9);
h5=k1'.*h;
h6=k2'.*h;
h7=k3'.*h;

w1=0:1/100:pi;
H4=0;
j=sqrt(-1);
for n=1:length(h)
    H4=H4+h5(n)*exp(-j*w1*n);
end
figure
plot(w1,abs(H4))
title('Kaiser window beta=4')
figure
plot(w1,20*log(abs(H4)))

w1=0:1/100:pi;
H5=0;
j=sqrt(-1);
for n=1:length(h)
    H5=H5+h6(n)*exp(-j*w1*n);
end
figure
plot(w1,abs(H5))
title('Kaiser window beta=6.5')
figure
plot(w1,20*log(abs(H5)))

w1=0:1/100:pi;
H6=0;
j=sqrt(-1);
for n=1:length(h)
    H6=H6+h7(n)*exp(-j*w1*n);
end
figure
plot(w1,abs(H6))
title('Kaiser window beta=9')
figure
plot(w1,20*log(abs(H6)))

