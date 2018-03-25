clc
clear all
close all
% Using poles and zeros
w=0:0.005:pi;
s1=exp(1i*w);
n = 3;%input('Enter the order of the filter: ');
Rp = 0.9151;%input('Enter max passband ripple(in dB): ');
Rs = 20;%input('Enter max stopband ripple(in dB): ');
Wp = 0.9999;%input('Enter passband frequency: '); 
ftype = 'low'; 


[z,p,k1] = ellip(n,Rp,Rs,Wp,ftype); 

[b,a] = zp2tf(z,p,k1); 
F1=ones(1,length(w));
scatter(real(p),imag(p))
figure
    for k=1:length(w)
        for h=1:length(p)
            F1(k)= F1(k)*(s1(k)-z(h))*((s1(k)-p(h))^-1); 
        end
    end
F2=k1.*abs(F1);
plot(w,abs(F2))


