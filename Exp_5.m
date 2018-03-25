clc 
close all 
clear all

N=input('Enter the Length of filter:');
M=(N-1)/2;
h=zeros(1,N);

for i=0:N-1
    h(i+1)=(cos(pi*(i-M)))/(i-M)-sin(pi*(i-M))/(pi*((i-M)^2));
end
if rem(N,2)==1
h(M+1)=0;
end

w1=0:1/100:pi;
H=0;
j=sqrt(-1);
for n=1:length(h)
    H=H+h(n)*exp(-j*w1*n);
end

figure;
plot(w1,abs(H))
title('Length N=20-Magnitude Response')
figure;
plot(w1,phase(H))
title('Length N=20-Phase Response ')