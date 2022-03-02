function zmp = costfcn1(S,H,h,n)
S=11;
H=3;
h=3;
n=4;
d1=4;
d2=4.5;
d3=6.2;
d5=6.2;
w1=6.6;
T=1;
t1=0:0.01:0.2;
t2=0.21:0.01:0.8;
t3=0.81:0.01:1;

t4=0:0.01:1;
t5=0:0.01:0.2;
t6=0.21:0.01:1;
t7=0:0.01:0.2;
t8=0.21:0.01:1;

% [P1,P6,P12] = hamtoado(d1,d2,d3,d5,h,H,n,S,T,t1,t2,w1,t);
% [deta1,deta2,deta3,deta4,deta5,deta6,deta7,deta8,deta9,deta10,deta11,deta12] = biped_backward(P1,P6,P12); 
% [P1,P2,P3,P5,P6,P7,P8,P10,P11,P12] = biped_forward(deta1,deta2,deta3,deta5,deta7,deta8,deta10,deta11);
% [zmp,com] = biped_zmp(P1,P2,P3,P5,P6,P7,P8,P10,P11,P12);

[P1,P6,P12] = hamtoado(d1,d2,d3,d5,h,H,n,S,T,w1,t1,t2,t3,t4,t5,t6,t7,t8);
[deta1,deta2,deta3,deta4,deta5,deta6,deta7,deta8,deta9,deta10,deta11,deta12] = biped_backward(P1,P6,P12);

[P1,P2,P3,P5,P6,P7,P8,P10,P11,P12] = biped_forward(deta1,deta2,deta3,deta5,deta7,deta8,deta10,deta11);
[zmp,com] = biped_zmp(P1,P2,P3,P5,P6,P7,P8,P10,P11,P12);

plot(zmp.x,zmp.y);
end

