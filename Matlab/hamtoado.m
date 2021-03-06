function [P1,P6,P12] = hamtoado(d1,d2,d3,d5,h,H,n,S,w1,t1,t2,t3,t4,t5,t6,t7,t8)
% Thong so robot
S=11;
H=4;
h=3;
n=5;

d1=4;
d2=4.5;
d3=6.2;
d5=6.2;
w1=6.6;
%Thoi gian cua quy dao P6,P12
t1=0:0.01:0.2;
t2=0.21:0.01:0.8;
t3=0.81:0.01:1;

t4=0:0.01:1;
t5=0:0.01:0.2;
t6=0.21:0.01:1;
t7=0:0.01:0.2;
t8=0.21:0.01:1;

%Toa do P1,P6,P12
P12x1=-ones(size(t5))*(S/2);
P12x2=((S/2)*sin((2*pi/1.58)*t6+3.87));

P12z1=ones(size(t7))*0;
P12z2=H*sin(((2*pi)/1.58)*t8-0.832921);

P1y1=n*sin(((2*pi)/0.8)*t1);
P1y2=ones(size(t2))*n;
P1y3=n*sin(((2*pi)/0.8)*t3+pi/2);

P1.x=zeros(101,1);
P1.y=zeros(101,1);
P1.z=zeros(101,1);

P6.x=transpose((S/12)*sin(-(2*pi/2)*t4-pi/2));
P6.y=transpose([P1y1 P1y2 P1y3]);
P6.z=transpose(repelem(d1+d2+d3+d5-h,101));

P12.x=transpose([P12x1 P12x2]);
P12.y=transpose(repelem(-w1,101));
P12.z=transpose([P12z1 P12z2]);

%Ve P1,P6,P12
plot3(P1.x,P1.y,P1.z,'*','color','black');
hold on;
grid on;
plot3(P6.x,P6.y,P6.z,'r');
plot3(P12.x,P12.y,P12.z,'b');
end






