clc
close all
clear all

wc=pi/2;
N=21;
M=(N-1)/2;
for n=0:N-1
h(n+1)=(sin(wc*(n-M)))/(pi*(n-M));
end
h(M+1)=1;
plot(h)
w1=0:1/100:pi;
H=0;
j=sqrt(-1);
for n=1:length(h)
    H=H+h(n)*exp(-j*w1*n);
end
figure;
plot(abs(H))
