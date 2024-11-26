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
x=0:h:1;
phi_p_5=x'.*0;
phi_p_5(0.1<=x & x<=0.3,1)=1;
% phi_p=sin(100*pi.*x)';
phi_p_5(N)=phi_p_5(1);
f_5=phi_p_5;
A(1,1)=1; A(N,N)=1;
k=2;
for j=2:N-1
   A(k,j-1)=0.5*v+0.5*v^2;
   A(k,j)=1-v^2;
   A(k,j+1)=-0.5*v+0.5*v^2;
   k=k+1;
end
A=sparse(A);

for i=1:tstep
    phi_5=A*phi_p_5;
    phi_p_5=phi_5;
end
figure();
plot(x',phi_5);
title('t=2.5 s');
figure();
plot(x',f_5);
title('t=0 s');
