clc;
clear;
close all;

N=201;
a=0.2;
v=1;
h=1/(N-1);
t=v*h/a;
tol=1e-9;
maxit=N;
tstep=2.5/t;

A=zeros(N,N);
B=zeros(N,N);
x=0:h:1;
phi_pp =x'.*0;
phi_pp(0.1<=x & x<=0.3,1)=1;
% phi_pp=sin(100*pi.*x)';
phi_pp(N)=phi_pp(1);
f_3=phi_pp;

A(1,1)=1; A(N,N)=1;
k=2;
for j=2:N-1
   A(k,j-1)=v;
   A(k,j)=1-v;
   k=k+1;
end
A=sparse(A);
phi_p_3=A*phi_pp;

B(1,1)=1; B(N,N)=1;
k=2;
for j=2:N-1
   B(k,j-1)=v;
   B(k,j+1)=-v;
   k=k+1;
end
for i=1:tstep
    phi_3=B*phi_p_3+phi_pp;
    phi_p_3=phi_3;
    phi_pp=phi_p_3;
end
figure();
plot(x',phi_3);
title('t=2.5 s');
figure();
plot(x',f_3);
title('t=0 s');