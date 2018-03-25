clc 
close all 
clear all

N=input('Enter the Length of filter:');
cutoff=input('Enter the cut off frequency:');

w=zeros(1,length(N));
for i=0:N-1
w(i+1)=(2*pi*i)/N;
end

A=zeros(1,N);
for j=1:N
    if (w(j)<=cutoff)
    A(j)=1;
    else
        A(j)=0;
    end
end

M=(N-1)/2;
h1=zeros(1,N);
h=zeros(1,N);
% For ODD Length Impulse Response %
if rem(N,2)==1
for j=1:N
for k=1:M-1
h1(j)=h1(j)+2.*abs(A(k+1)).*cos((2*pi*k/N)*(j-M));
end
h(j)=1/N.*(abs(A(1))+h1(j));
end
else
% For EVEN Length Impulse Response %
for j=1:N
    for k=1:(N/2)-1
        h1(j)=h1(j)+2.*abs(A(k+1)).*cos((2*pi*k/N)*(j-M));
    end 
    h(j)=1/N.*(abs(A(1))+h1(j));
end
end

fs=2000;
w1=0:1/100:pi;
H=0;
j=sqrt(-1);
for n=1:length(h)
    H=H+h(n)*exp(-j*w1*n);
end

z=roots(h);
l=zeros(1,20);
for i=1:20
   l(i)= abs(z(i));
end


figure;
plot(w,h)
figure;
plot(w1,abs(H))
figure
plot(w1,20*log(abs(H)))
figure;
plot(w1,phase(H))
figure;
scatter(real(z),imag(z))
