clc
close all
clear all
 
wp=0.9;%input('Enter the passband cutoff frequency;');
delp=0.8;%input('Enter the passband limit');
%Order%
e=(1/delp)^2;
N=(log(e-1))/(2*log(wp));
r=round(N);
j=sqrt(-1);
w3=0:(2*r)-1;
s=zeros(1,2*r);
 
K1=(delp^-1)-1;
R=log10(wp)-(0.5*log10(K1)/N);
wc=10^R;
w=0:0.005:pi;
F=ones(1,length(w));
for k=1:length(w)
    F(k)=1/sqrt((1+(w(k)/wc)^(2*N)));
end
figure;
plot(w,abs(F))
 
for i=1:length(w3)
s(i)=exp((j*(2*w3(i)+1+r)*pi)/(2*r));
end
w1=0:length(s)-1;
figure;
scatter(real(s),imag(s))
pol=zeros(1,(length(s)/2));
 
for i=1:(length(s)/2)
        pol(i)=s(i);  
end
w2=0:(length(s)/2)-1;
figure;
scatter(real(pol),imag(pol))
