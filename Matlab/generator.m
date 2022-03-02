function [P0x,P0y,P0z,P6x,P6y,P6z,P12x,P12y,P12z] = generator(T6x1,T6x2,a6x0,a6x1,a6x2,a6x3,T6y1,T6y2,a6y1,a6y2,T12x1,T12x2,a12x0,a12x1,a12x2,a12x3,T12z1,T12z2,a12z1,a12z2,a12z3,h,t)
T6x0=0;
T6y0=0;
T12x0=0;
T12z0=0;
T6x3=1;
T6y3=1;
T12x3=1;
T12z3=1;
a6y0=0;
a6y3=0;
a12z0=0;
d3=4.8;
d4=6.3;
d5=6;
d6=5;
W=6.6;
P0x=0;
P0y=0;
P0z=0;
P12y=-W;
P6z=d3+d4+d5+d6-h;
P6x=interpolation(T6x0,T6x1,T6x2,T6x3,a6x0,a6x1,a6x2,a6x3,t);
P6y=interpolation(T6y0,T6y1,T6y2,T6y3,a6y0,a6y1,a6y2,a6y3,t);
P12x=interpolation(T12x0,T12x1,T12x2,T12x3,a12x0,a12x1,a12x2,a12x3,t);
P12z=interpolation(T12z0,T12z1,T12z2,T12z3,a12z0,a12z1,a12z2,a12z3,t);
end