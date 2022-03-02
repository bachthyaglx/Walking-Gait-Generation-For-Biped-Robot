function [deta1,deta2,deta3,deta4,deta5,deta6,deta7,deta8,deta9,deta10,deta11,deta12] = inverse_kinematics(P1,P6,P12)
d1=4;
d2=4.5;
d3=6.2;
d5=6.2;

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

l_l=sqrt(l.x.^2+0.25.*(l.y.^2)+(l.z+d1+d5).^2);
l_r=sqrt(r.x.^2+0.25.*(r.y.^2)+(r.z+d1+d5).^2);

detaA=acos((d2^2+d3^2-l_l.^2)/(2*d2*d3));
detaB=acos((d3.*sin(detaA))./l_l);
detaC=acos((d2^2+d3^2-l_r.^2)/(2*d2*d3));
detad=acos((d3.*sin(detaC))./l_r);

deta5=pi/2 - detaA + detaB + asin(l.x./l_l);
deta3=pi-detaA;
deta2=(deta3-deta5);

deta8=pi/2 - detaC + detad + asin(r.x./l_r);
deta10=pi-detaC;
deta11=deta10-deta8;

deta4=0;
deta9=0;

end

% plot(deta1,'r');
% hold on;
% grid on;
% plot(deta6,'black');
% plot(deta2,'b');
% plot(deta3,'green');
% plot(deta4,'m');
% plot(deta5,'y');
% plot(deta8,'color','[1 1 0.2]');
% plot(deta9,'color','[0.8 0.2 0.6]');
% plot(deta10,'color','[0.4 0.5 0.9]');
% plot(deta11,'color','[0.7 0.6 0.5]');
% plot(deta7,'color','[1 0.3 1]');
% plot(deta12,'color','[0.9 0.9 0.9]');