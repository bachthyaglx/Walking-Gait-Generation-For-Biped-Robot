function [zmp,com] = biped_zmp(P1,P2,P3,P5,P6,P7,P8,P10,P11,P12)

M = [55 65 90 55 400 55 90 65 55];
g = 981;

PP1.x = (P1.x + P2.x)/2;
PP1.y = (P1.y + P2.y)/2;
PP1.z = (P1.z + P2.z)/2;

PP2.x = (P2.x + P3.x)/2;
PP2.y = (P2.y + P3.y)/2;
PP2.z = (P2.z + P3.z)/2;

PP3.x = (P3.x + P5.x)/2;
PP3.y = (P3.y + P5.y)/2;
PP3.z = (P3.z + P5.z)/2;

PP5.x = (P5.x + P6.x)/2;
PP5.y = (P5.y + P6.y)/2;
PP5.z = (P5.z + P6.z)/2;

PPM.x = (P6.x + P7.x)/2;
PPM.y = (P6.y + P7.y)/2;
PPM.z = (P6.z + P7.z)/2 + 6;

PP7.x = (P7.x + P8.x)/2;
PP7.y = (P7.y + P8.y)/2;
PP7.z = (P7.z + P8.z)/2;

PP8.x = (P8.x + P10.x)/2;
PP8.y = (P8.y + P10.y)/2;
PP8.z = (P8.z + P10.z)/2;

PP10.x = (P10.x + P11.x)/2;
PP10.y = (P10.y + P11.y)/2;
PP10.z = (P10.z + P11.z)/2;

PP11.x = (P11.x + P12.x)/2;
PP11.y = (P11.y + P12.y)/2;
PP11.z = (P11.z + P12.z)/2;

PPx = [PP1.x PP2.x PP3.x PP5.x PPM.x PP7.x PP8.x PP10.x PP11.x];
PPy = [PP1.y PP2.y PP3.y PP5.y PPM.y PP7.y PP8.y PP10.y PP11.y];
PPz = [PP1.z PP2.z PP3.z PP5.z PPM.z PP7.z PP8.z PP10.z PP11.z];

PP1x_dd = biped_giatoc(PP1.x);
PP2x_dd = biped_giatoc(PP2.x);
PP3x_dd = biped_giatoc(PP3.x);
PP5x_dd = biped_giatoc(PP5.x);
PPMx_dd = biped_giatoc(PPM.x);
PP7x_dd = biped_giatoc(PP7.x);
PP8x_dd = biped_giatoc(PP8.x);
PP10x_dd = biped_giatoc(PP10.x);
PP11x_dd = biped_giatoc(PP11.x);

PP1y_dd = biped_giatoc(PP1.y);
PP2y_dd = biped_giatoc(PP2.y);
PP3y_dd = biped_giatoc(PP3.y);
PP5y_dd = biped_giatoc(PP5.y);
PPMy_dd = biped_giatoc(PPM.y);
PP7y_dd = biped_giatoc(PP7.y);
PP8y_dd = biped_giatoc(PP8.y);
PP10y_dd = biped_giatoc(PP10.y);
PP11y_dd = biped_giatoc(PP11.y);

PP1z_dd = biped_giatoc(PP1.z);
PP2z_dd = biped_giatoc(PP2.z);
PP3z_dd = biped_giatoc(PP3.z);
PP5z_dd = biped_giatoc(PP5.z);
PPMz_dd = biped_giatoc(PPM.z);
PP7z_dd = biped_giatoc(PP7.z);
PP8z_dd = biped_giatoc(PP8.z);
PP10z_dd = biped_giatoc(PP10.z);
PP11z_dd = biped_giatoc(PP11.z);

PPx_dd = [PP1x_dd PP2x_dd PP3x_dd PP5x_dd PPMx_dd PP7x_dd PP8x_dd PP10x_dd PP11x_dd];
PPy_dd = [PP1y_dd PP2y_dd PP3y_dd PP5y_dd PPMy_dd PP7y_dd PP8y_dd PP10y_dd PP11y_dd];
PPz_dd = [PP1z_dd PP2z_dd PP3z_dd PP5z_dd PPMz_dd PP7z_dd PP8z_dd PP10z_dd PP11z_dd];

com.x = PPx*M'/sum(M);
com.y = PPy*M'/sum(M);
com.z = PPz*M'/sum(M);

zmp.x = com.x + ((PPx.*PPz_dd)*M'-(PPz.*PPx_dd)*M')./(g*sum(M));
zmp.y = com.y + ((PPy.*PPz_dd)*M'-(PPz.*PPy_dd)*M')./(g*sum(M));
end