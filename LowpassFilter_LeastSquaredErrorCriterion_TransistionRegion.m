clc 
close all 
clear all
N=21; 
f1=0.2;
f2=0.3;
M=(N-1)/2;
h=zeros(1,N);
for i=0:N-1
    h(i+1)=(sin(pi*(f2-f1)*(i-M)*sin(pi*(f2+f1)*(i-M))))/((pi^2)*(f2-f1)*((i-M)^2));
end
h(M+1)=f1+f2;
 
plot(h)
 
w1=0:1/100:pi;
H=0;
j=sqrt(-1);
for n=1:length(h)
    H=H+h(n)*exp(-j*w1*n);
end
  figure;
  plot(w1,abs(H))
  figure;
  plot(w1,20*log(abs(H)))
