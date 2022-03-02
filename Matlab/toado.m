function [P1,P6,P12] = toado(d1,d2,d3,d5,h,H,n,S,T,t1,t2,w1,t)

S=7;
H=3;
h=3;
n=2;
d1=4;
d2=4.5;
d3=6.2;
d5=6.2;
w1=6.6;
T=1;
t=transpose(0:0.02:1);
t1=0.2;
t2=0.8;

% % P1,P6,P12 1 chu ky
% P1.x=(S/2).*sin((pi/T).*(t-T/2)).*(u(t-2*T)-u(t-T));
% P1.y=transpose(repelem(-w1,101)).*(u(t-2*T)-u(t-T));
% P1.z=H/2 + H.*sin(pi.*((P1.x/S)+0.5)).*(u(t-2*T)-u(t-T));
% 
% P12.x=(S/2).*sin(pi.*(t-T/2)/T).*(u(t)-u(t-T));
% P12.y=transpose(repelem(-w1,101)).*(u(t)-u(t-T));        
% P12.z=H.*sin(pi.*((P12.x/S)+0.5)).*(u(t)-u(t-T));
% 
% P6.x=(S/4).*sin((pi/T).*(tt(t,T)-T/2));
% P6_half_cycle.y=n.*sin(pi/(2*t1).*tt(t,T)).*(u(tt(t,T))-u(tt(t,T)-t1))+n.*(u(tt(t,T)-t1)-u(tt(t,T)-t2))+n.*cos(pi/(2*(T-t2)).*(tt(t,T)-t2)).*(u(tt(t,T)-t2)-u(tt(t,T)-T));
% P6.y=P6_half_cycle.y.*(u(t)-u(t-T))-P6_half_cycle.y.*(u(t-T)-u(t-2*T));
% P6.z=transpose(repelem(d1+d2+d3+d5-h,101));

% P0,P6,P12 1/2 chu ky
P1.x=0;
P1.y=0;
P1.z=0;

P12.x=(S/2).*sin(pi.*(t-T/2)/T);
P12.y=transpose(repelem(-w1,51));
P12.z=H.*sin(pi.*((P12.x/S)+0.5));

P6.x=(S/4).*sin((pi/T).*(tt(t,T)-T/2));
P6.y=n.*sin(pi/(2*t1).*tt(t,T)).*(u(tt(t,T))-u(tt(t,T)-t1))...
+n.*(u(tt(t,T)-t1)-u(tt(t,T)-t2))...
+n.*cos(pi/(2*(T-t2)).*(tt(t,T)-t2)).*(u(tt(t,T)-t2)-u(tt(t,T)-T));
P6.z=transpose(repelem(d1+d2+d3+d5-h,51));

plot3(P1.x,P1.y,P1.z,'*black');
hold on;
grid on;
plot3(P6.x,P6.y,P6.z,'r');
plot3(P12.x,P12.y,P12.z,'black');

xlabel('x');
ylabel('y');
zlabel('z');
axis([-30 30 -20 10 0 20]);
end
%P1x,P1y,P1z,P12x,P12y,P12z
function ti=u(t)
if (t>=0)
   ti=1;
else
   ti=0;
end
end
%P6x,P6y,P6z 1/2 chu ky
function to = tt(t,T)
if (t>=0 & t<=T)
       to=t;
else
       to=t-T;
end
end
