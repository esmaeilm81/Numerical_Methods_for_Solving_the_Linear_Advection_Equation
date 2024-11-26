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

B=zeros(N,N);
x=0:h:1;
phi_p_6 =x'.*0;
phi_p_6(0.1<=x & x<=0.3,1)=1;
% phi_p=sin(100*pi.*x)';
phi_p_6(N)=phi_p_6(1);
f_6=phi_p_6;
B(1,1)=1; B(N,N)=1;
k=2;
for j=2:N-1
   B(k,j-1)=-0.25*v;
   B(k,j)=1;
   B(k,j+1)=0.25*v;
   k=k+1;
end
B=sparse(B);

A=zeros(N,N);
A(1,1)=1; A(N,N)=1;
k=2;
for j=2:N-1
   A(k,j-1)=0.25*v;
   A(k,j)=1;
   A(k,j+1)=-0.25*v;
   k=k+1;
end
A=sparse(A);
for i=1:tstep
    phi_6=gmres(B,A*phi_p_6,[],tol,maxit);
    phi_p_6=phi_6;
end
figure();
plot(x',phi_6);
title('t=2.5 s');
figure();
plot(x',f_6);
title('t=0 s');