clc;
clear;
close all;

view_joints = 1;
view_foots = 1;
view_COM = 1;
view_ZMP = 1;
view_hold = 0; %(1:no save,0:save)
delay=0.04;

S=11;
H=3;
h=2;
n=5;

d1=4;
d2=4.5;
d3=6.2;
d5=6.2;

d7=6.2;
d8=6.2;
d10=4.5;
d11=4;
w=6.6;
T=1;

t1=0:0.01:0.2;
t2=0.21:0.01:0.8;
t3=0.81:0.01:1;

t4=0:0.01:1;
t5=0:0.01:0.2;
t6=0.21:0.01:1;
t7=0:0.01:0.2;
t8=0.21:0.01:1;

[P1,P6,P12] = gait_trajectory(S,H,h,n);
[deta1,deta2,deta3,deta4,deta5,deta6,deta7,deta8,deta9,deta10,deta11,deta12] = inverse_kinematics(P1,P6,P12);
[P1,P2,P3,P5,P6,P7,P8,P10,P11,P12] = forward_kinamatics(deta1,deta2,deta3,deta5,deta7,deta8,deta10,deta11);
[zmp,com] = zmp(P1,P2,P3,P5,P6,P7,P8,P10,P11,P12);

%Kich thuoc ban chan
F1.x1 = 6.5;
F1.x2 = 2.0;
F1.y1 = 4.3;
F1.y2 = 2.0;

F2.x1 = 6.5;
F2.x2 = 2.0;
F2.y1 = 4.3;
F2.y2 = 2.0;

PF1.x = P1.x + F1.x1;
PF1.y = P1.y + F1.y1;
PF1.z = P1.z;

PF2.x = P1.x + F1.x1;
PF2.y = P1.y - F1.y2;
PF2.z = P1.z;

PF3.x = P1.x - F1.x2;
PF3.y = P1.y - F1.y2;
PF3.z = P1.z;

PF4.x = P1.x - F1.x2;
PF4.y = P1.y + F1.y1;
PF4.z = P1.z;

PF5.x = P12.x + F2.x1;
PF5.y = P12.y + F2.y2;
PF5.z = P12.z;

PF6.x = P12.x + F2.x1;
PF6.y = P12.y - F2.y1;
PF6.z = P12.z;

PF7.x = P12.x - F2.x2;
PF7.y = P12.y - F2.y1;
PF7.z = P12.z;

PF8.x = P12.x - F2.x2;
PF8.y = P12.y + F2.y2;
PF8.z = P12.z;

%So luong mau
sample_number = 101;
for i = 1:sample_number 
% Noi cac khop      
   x0 = [P1.x(i),P2.x(i)];
   y0 = [P1.y(i),P2.y(i)];
   z0 = [P1.z(i),P2.z(i)];
   
   x1 = [P2.x(i),P3.x(i)];
   y1 = [P2.y(i),P3.y(i)];
   z1 = [P2.z(i),P3.z(i)];
   
   x2 = [P3.x(i),P5.x(i)];
   y2 = [P3.y(i),P5.y(i)];
   z2 = [P3.z(i),P5.z(i)];
   
   x3 = [P5.x(i),P6.x(i)];
   y3 = [P5.y(i),P6.y(i)];
   z3 = [P5.z(i),P6.z(i)];
   
   x5 = [P7.x(i),P8.x(i)];
   y5 = [P7.y(i),P8.y(i)];
   z5 = [P7.z(i),P8.z(i)];
   
   x6 = [P8.x(i),P10.x(i)];
   y6 = [P8.y(i),P10.y(i)];
   z6 = [P8.z(i),P10.z(i)];
  
   x7 = [P10.x(i),P11.x(i)];
   y7 = [P10.y(i),P11.y(i)];
   z7 = [P10.z(i),P11.z(i)];
   
   x8 = [P11.x(i),P12.x(i)];
   y8 = [P11.y(i),P12.y(i)];
   z8 = [P11.z(i),P12.z(i)];
   
   x9 = [P6.x(i),P7.x(i)];
   y9 = [P6.y(i),P7.y(i)];
   z9 = [P6.z(i),P7.z(i)];
   
   xlabel('x');
   ylabel('y');
   zlabel('z');
   axis([-10 15 -15 7 0 20]);
   title('Zero Moment Point (ZMP)');
   
if(view_foots)
%Noi khop ban chan
   dx1 = [PF1.x(i),PF2.x(i)];
   dx2 = [PF2.x(i),PF3.x(i)];
   dx3 = [PF3.x(i),PF4.x(i)];
   dx4 = [PF4.x(i),PF1.x(i)];
   
   dy1 = [PF1.y(i),PF2.y(i)];
   dy2 = [PF2.y(i),PF3.y(i)];
   dy3 = [PF3.y(i),PF4.y(i)];
   dy4 = [PF4.y(i),PF1.y(i)];
   
   dz1 = [PF1.z(i),PF2.z(i)];
   dz2 = [PF2.z(i),PF3.z(i)];
   dz3 = [PF3.z(i),PF4.z(i)];
   dz4 = [PF4.z(i),PF1.z(i)];

   dx5 = [PF5.x(i),PF6.x(i)];
   dx6 = [PF6.x(i),PF7.x(i)];
   dx7 = [PF7.x(i),PF8.x(i)];
   dx8 = [PF8.x(i),PF5.x(i)];
  
   dy5 = [PF5.y(i),PF6.y(i)];
   dy6 = [PF6.y(i),PF7.y(i)];
   dy7 = [PF7.y(i),PF8.y(i)];
   dy8 = [PF8.y(i),PF5.y(i)];
   
   dz5 = [PF5.z(i),PF6.z(i)];
   dz6 = [PF6.z(i),PF7.z(i)];
   dz7 = [PF7.z(i),PF8.z(i)];
   dz8 = [PF8.z(i),PF5.z(i)];
end
   pause(delay);
if(view_joints)
   %Ve khop 
   plot3(x0,y0,z0,'color','r');
   hold on;
   plot3(x1,y1,z1,'color','r');
   plot3(x2,y2,z2,'color','r');
   plot3(x3,y3,z3,'color','r');
   plot3(x5,y5,z5,'color','g');
   plot3(x6,y6,z6,'color','g');
   plot3(x7,y7,z7,'color','g');
   plot3(x8,y8,z8,'color','g');
   plot3(x9,y9,z9,'color','b');
   grid on;
end 
if(view_foots)
%Ve ban chan
    plot3(dx1,dy1,dz1,'c');
    plot3(dx2,dy2,dz2,'c');
    plot3(dx3,dy3,dz3,'c');
    plot3(dx4,dy4,dz4,'c');
    plot3(dx5,dy5,dz5,'m');
    plot3(dx6,dy6,dz6,'m');
    plot3(dx7,dy7,dz7,'m');
    plot3(dx8,dy8,dz8,'m');
end 
if(view_COM)
%Ve ZMP and COM
     plot3(com.x(i),com.y(i),com.z(i), '*b');
end
if(view_ZMP)
     plot3(zmp.x(i),zmp.y(i),0, '*m');
end
if(view_hold)
  hold off;  
end
end

clearvars -except deta1 deta2 deta3 deta5 deta6 deta7 deta8 deta10 deta11 deta12
