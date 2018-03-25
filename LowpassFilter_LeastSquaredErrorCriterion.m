clc
close all
clear all
 
L=81;%input('Enter the length of the filter:');
N=21;
cut=pi/2;
 
w=zeros(1,L);
for i=1:L
    w(i)=(2*pi*i)/L;
end
 
A=zeros(1,L);
for i=1:L
    if (w(i)<=cut)
        A(i)=1;
    else if (w(i)>=((2*pi)-cut))
            A(i)=1;
        end
    end
end
 
M=(N-1)/2;
F=ones(L,M+1);
 
for i=1:L
    for j=0:M-1
    F(i,j+1)=2*cos(((2*pi.*i)/L).*(M-j));
    end
end
 
h=inv((F')*F)*(F')*A';
 
for i=M+1:N-1
    h(i+1)=h(N-i);
end
 
h1=h';
w1=0:0.001:pi;
H=zeros(1,length(w1));
  for i=1:length(w1)
      for j=1:N
          H(i)=H(i)+h1(j)*exp(-1i*w1(i)*(j));
      end
  end
 z=roots(h);
 figure;
plot(w1,abs(H))
figure
plot(w1,20*log(abs(H)))
figure
plot(w1,phase(H))
figure
scatter(real(z),imag(z))
