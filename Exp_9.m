clc
close all
clear all
w=0:0.005:pi;
s1=1i*w;
F=zeros(1,length(w));
dp=0.1;%input('Enter max pass-band ripple (0 to 1): ');
e=sqrt((1-dp)^-2-1);
ws=1.6;%input('Enter stop-band frequency: ');
ds=0.2;%input('Enter max magn allowed in stop-band: ');
T1=acosh(sqrt(1-ds^2)/(e*ds));
T2=acosh(ws);
N=T1/T2;
N1=ceil(N);
v=asinh(1/e)/N1;
for i=1:length(w)
    F(i)=1/sqrt(1+(e*cos(N1*acos(w(i))))^2);
end
figure
plot(w,abs(F))

%Poles
b=(asinh(1/e))/N1;
k=1:2*N1;
al=zeros(1,length(k));
for i=1:length(k)
al(i)=((2*k(i)-1)*(pi/2))/(N1);
end
sig=zeros(1,length(k));
omg=zeros(1,length(k));
for i=1:length(k)
    sig(i)=sin(al(i))*sinh(b);
    omg(i)=cos(al(i))*cosh(b);
end
pol=zeros(1,length(k));
for i=1:length(k)
   pol(i)=sig(i)+1i*(omg(i));
end
figure;
scatter(sig,omg)

