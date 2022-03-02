function [deta1,deta2,deta3,deta4,deta5,deta6,deta7,deta8,deta9,deta10,deta11,deta12] = biped_backward(P1,P6,P12)
% S=11;
% H=3;
% h=3;
% n=3;
d1=4;
d2=4.5;
d3=6.2;
d5=6.2;

% T=1;
% t1=0:0.01:0.2;
% t2=0.21:0.01:0.8;
% t3=0.81:0.01:1;
% 
% t4=0:0.01:1;
% t5=0:0.01:0.2;
% t6=0.21:0.01:1;
% t7=0:0.01:0.2;
% t8=0.21:0.01:1;

l.x=P1.x-P6.x;
l.y=-P6.y;
l.z=P1.z-P6.z;

r.x=P12.x-P6.x;
r.y=-P6.y;
r.z=P12.z-P6.z;

deta1=atan(l.y./l.z);
deta6=deta1;
deta12=atan(r.y./r.z);
deta7=deta12;

% P7.x = P6.x;
% P7.y = P6.y - w1;
% P7.z = P6.z;
% 
% P2.x = P1.x;
% P2.y = P1.x + d1.*sin(deta1);
% P2.z = P1.x + d1.*cos(deta1);
% 
% P5.x = P6.x;
% P5.y = P6.y + d5.*sin(deta6);
% P5.z = P6.z - d5.*cos(deta6);
% 
% P8.x = P7.x;
% P8.y = P7.y + d5.*sin(deta7);
% P8.z = P7.z - d5.*cos(deta7);
% 
% P11.x = P12.x;
% P11.y = P12.y + d1.*sin(deta12);
% P11.z = P12.z + d1.*cos(deta12);

% l_l=sqrt((P5.x-P2.x).^2+(P5.y-P2.y).^2+(P5.z-P2.z).^2);
% l_r=sqrt((P11.x-P8.x).^2+(P11.y-P8.y).^2+(P11.z-P8.z).^2);

l_l=sqrt(l.x.^2+0.25.*(l.y.^2)+(l.z+d1+d5).^2);
l_r=sqrt(r.x.^2+0.25.*(r.y.^2)+(r.z+d1+d5).^2);

detaA=acos((d2^2+d3^2-l_l.^2)/(2*d2*d3));
detaB=acos((d3.*sin(detaA))./l_l);
detaC=acos((d2^2+d3^2-l_r.^2)/(2*d2*d3));
detaD=acos((d3.*sin(detaC))./l_r);

deta5=pi/2 - detaA + detaB + asin(l.x./l_l);
deta3=pi-detaA;
deta2=(deta3-deta5);

deta8=pi/2 - detaC + detaD + asin(r.x./l_r);
deta10=pi-detaC;
deta11=(deta10-deta8);
deta4=0;
deta9=0;

% plot(deta1,'r');
% hold on;
% grid on;
% plot(deta2,'b');
% plot(deta3,'green');
% plot(deta4,'m');
% plot(deta5,'c');
% plot(deta6,'black');
% plot(deta7,'color','[1 1 1]');
% plot(deta8,'color','[1 1 0.2]');
% plot(deta9,'color','[0.8 0.2 0.6]');
% plot(deta10,'color','[0.4 0.5 0.9]');
% plot(deta11,'color','[0.7 0.6 0.5]');
% plot(deta12,'color','[0.9 0.9 0.9]');
end

