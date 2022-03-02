function X_dd = biped_giatoc(Xn)
Ts = 0.01;
[m,n] = size(Xn);    %101x1, m =101, n=1;
Xn1=[0;Xn(1:m-1,:)];
Xn2=[0;0;Xn(1:m-2,:)];

X_dd = (Xn-2*Xn1+Xn2)/Ts^2;
end