
function  [h1 h2 h3 h4 h5 h6] = plotLegs(leg)
%fwd kinematics plot robot posture
hold on

if strcmp(leg, 'LF') 
haa_orig=evalin('base', 'ht.fr_trunk_Xh_fr_LF_HAA(1:3,4)'); 
hfe_orig=evalin('base', 'ht.fr_trunk_Xh_fr_LF_HFE(1:3,4)'); 
kfe_orig=evalin('base', 'ht.fr_trunk_Xh_fr_LF_KFE(1:3,4)'); 
foot_orig=evalin('base', 'ht.fr_trunk_Xh_LF_foot(1:3,4)'); 
end

if strcmp(leg, 'RF') 
haa_orig=evalin('base', 'ht.fr_trunk_Xh_fr_RF_HAA(1:3,4)'); 
hfe_orig=evalin('base', 'ht.fr_trunk_Xh_fr_RF_HFE(1:3,4)'); 
kfe_orig=evalin('base', 'ht.fr_trunk_Xh_fr_RF_KFE(1:3,4)'); 
foot_orig=evalin('base', 'ht.fr_trunk_Xh_RF_foot(1:3,4)'); 
end

if strcmp(leg, 'LH') 
haa_orig=evalin('base', 'ht.fr_trunk_Xh_fr_LH_HAA(1:3,4)'); 
hfe_orig=evalin('base', 'ht.fr_trunk_Xh_fr_LH_HFE(1:3,4)'); 
kfe_orig=evalin('base', 'ht.fr_trunk_Xh_fr_LH_KFE(1:3,4)'); 
foot_orig=evalin('base', 'ht.fr_trunk_Xh_LH_foot(1:3,4)'); 
end

if strcmp(leg, 'RH') 
haa_orig=evalin('base', 'ht.fr_trunk_Xh_fr_RH_HAA(1:3,4)'); 
hfe_orig=evalin('base', 'ht.fr_trunk_Xh_fr_RH_HFE(1:3,4)'); 
kfe_orig=evalin('base', 'ht.fr_trunk_Xh_fr_RH_KFE(1:3,4)'); 
foot_orig=evalin('base', 'ht.fr_trunk_Xh_RH_foot(1:3,4)'); 

end

b_R_w = evalin('base', 'b_R_w');
basePoseW = evalin('base', 'basePoseW');
grForcesB=evalin('base', 'grForcesB'); 


haa_origW = mapPosToWorld(haa_orig);
hfe_origW = mapPosToWorld(hfe_orig);
kfe_origW = mapPosToWorld(kfe_orig);
foot_origW= mapPosToWorld(foot_orig);

x=[haa_origW(1) hfe_origW(1) NaN hfe_origW(1) kfe_origW(1) NaN kfe_origW(1) foot_origW(1)];
y=[haa_origW(2) hfe_origW(2) NaN hfe_origW(2) kfe_origW(2) NaN kfe_origW(2) foot_origW(2)];
z=[haa_origW(3) hfe_origW(3) NaN hfe_origW(3) kfe_origW(3) NaN kfe_origW(3) foot_origW(3)];
h1 = plot3(x,y,z,'Color', 'k','LineWidth',10);
h2 = plot3(foot_origW(1),foot_origW(2),foot_origW(3),'or');

h3=plot3( haa_origW(1),haa_origW(2),haa_origW(3),'ro');
h4=plot3( hfe_origW(1),hfe_origW(2),hfe_origW(3),'ro');
h5=plot3( kfe_origW(1),kfe_origW(2),kfe_origW(3),'ro');

%PLOT THE CONTACT FORCE
grForceLegB= getLegData(leg, grForcesB);
h6 = arrow3d_points(foot_origW, foot_origW+ b_R_w'*grForceLegB/1000,'color',[1 0 0]);grid on;

assignin('base', 'h1', h1)
assignin('base', 'h2', h2) 
%axis equal
% 
% view(3)
 %view([-90,120,40]) % swap the x and y axis
% 
xlim([-0.5 ,0.5])
ylim([-0.5,0.5])
zlim([-0.2 ,1])


xlabel('$X$','interpreter','latex')
ylabel('$Y$','interpreter','latex')
zlabel('$Z$','interpreter','latex')


end

