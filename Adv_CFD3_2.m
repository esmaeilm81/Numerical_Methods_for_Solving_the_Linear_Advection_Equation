clc;
clear;
close all;

% Lax method
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
phi_p_2 =x'.*0;
phi_p_2(0.1<=x & x<=0.3,1)=1;
% phi_p=sin(100*pi.*x)';
phi_p_2(N)=phi_p_2(1);
f_2=phi_p_2;
A(1,1)=1; A(N,N)=1;
k=2;
for j=2:N-1
   A(k,j-1)=0.5*(1+v);
   A(k,j+1)=0.5*(1-v);
   k=k+1;
end
A=sparse(A);

for i=1:tstep
    phi_2=A*phi_p_2;
    phi_p_2=phi_2;
end
figure();
plot(x',phi_2);
title('t=2.5 s');
figure();
plot(x',f_2);
title('t=0 s');
