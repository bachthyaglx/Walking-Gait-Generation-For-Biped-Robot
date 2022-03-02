function [deta1,deta2,deta3,deta4,deta5,deta6,deta7,deta8,deta9,deta10,deta11,deta12] = inverse_kinematic(P0x,P0y,P0z,P6x,P6y,P6z,P12x,P12y,P12z)
d3=4.8;
d4=6.3;
d5=6;
d6=5;
x_l=P0x-P6x;
y_l=-P6y;
z_l=P0z-P6z;
x_r=P12x-P6x;
y_r=-P6y;
z_r=P12z-P6z;
l_l=sqrt(x_l*x_l+0.25*y_l*y_l+(z_l+d3+d6)*(z_l+d3+d6));
l_r=sqrt(x_r*x_r+0.25*y_r*y_r+(z_r+d3+d6)*(z_r+d3+d6));

detaA=acos((d4*d4+d5*d5-l_l*l_l)/(2*d4*d5));
detaB=acos(d4*sin(detaA)/l_l);
detaC=acos((d4*d4+d5*d5-l_r*l_r)/(2*d4*d5));
detaD=acos(d4*sin(detaC)/l_r);

deta1=atan(y_l/z_l);
deta6=deta1;
deta5=pi/2 - detaA + detaB + asin(x_l/l_l);
deta3=pi-detaA;
deta2=(deta3 - deta5);
deta10=pi-detaC;
deta8=pi/2 - detaC + detaD + asin(x_r/l_r);
deta12=atan(y_r/z_r);
deta7=deta12;
deta11=(deta10 - deta8);
deta4=0;
deta9=0;
end