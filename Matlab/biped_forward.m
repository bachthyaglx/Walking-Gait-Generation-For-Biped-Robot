function [P1,P2,P3,P5,P6,P7,P8,P10,P11,P12] = biped_forward(deta1,deta2,deta3,deta5,deta7,deta8,deta10,deta11)
%Lengths between joints 
% S=6;
% H=5;
% h=4;
% n=2;
d1=4;
d2=4.5;
d3=6.2;
d5=6.2;
d7=6.2;
d8=6.2;
d10=4.5;
d11=4;
w1=6.6;
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

%Length
matrix_row = 101; %row matrix
matrix_line = 1;  %line matrix

%Position (x,y,z) P0,P1,P2,...,P13
P1.x = zeros(matrix_row,matrix_line);
P1.y = zeros(matrix_row,matrix_line);
P1.z = zeros(matrix_row,matrix_line);

P2.x = P1.x;
P2.z = d1.*cos(deta1);
P2.y = P2.z.*sin(deta1);

P3.x = d2.*sin(deta2);
P3.z = P2.z + d2.*cos(deta2).*cos(deta1);
P3.y = P3.z.*sin(deta1);

P5.x = P3.x + d3.*sin(deta2-deta3);
P5.z = P3.z + d3.*cos(deta2-deta3).*cos(deta1);
P5.y = P5.z.*sin(deta1);

P6.x = P5.x + d5.*sin(deta2-deta3+deta5);
P6.z = P5.z + d5.*cos(deta2-deta3+deta5).*cos(deta1);
P6.y = P6.z.*sin(deta1);

P7.x = P6.x;
P7.y = P6.y - w1;
P7.z = P6.z;

P8.x = P7.x;
P8.z = P7.z - d7.*cos(deta7);
P8.y = P7.y - (P7.z-P8.z).*sin(deta7);

P10.x = P8.x + d8.*sin(deta8);
P10.z = P8.z - d8.*cos(deta8).*cos(deta7);
P10.y = P7.y - (P7.z-P10.z).*sin(deta7);

P11.x = P10.x + d10.*sin(deta8-deta10);
P11.z = P10.z - d10.*cos(deta8-deta10).*cos(deta7);
P11.y = P7.y - (P7.z-P11.z).*sin(deta7);

P12.x = P11.x + d11.*sin(deta8-deta10+deta11);
P12.z = P11.z - d11.*cos(deta8-deta10+deta11).*cos(deta7);
P12.y = P7.y - (P7.z-P12.z).*sin(deta7);

end







