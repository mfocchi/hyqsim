updateHomogeneousTransforms(q);
updateJacobians(q);
updateMotionTransforms(q);
updateForceTransforms(q);
ci = compositeInertia(ip, ft);
[H Ic_trunk F]=updateJSIM();
Ic = Ic_trunk;

J.LF = jacs.fr_trunk_J_LF_foot(4:6,1:3);
J.RF = jacs.fr_trunk_J_RF_foot(4:6,1:3);
J.LH = jacs.fr_trunk_J_LH_foot(4:6,1:3);
J.RH = jacs.fr_trunk_J_RH_foot(4:6,1:3);
feet.LF = fwdKin( 'LF'); 
feet.RF = fwdKin( 'RF'); 
feet.LH = fwdKin( 'LH'); 
feet.RH = fwdKin( 'RH'); 
feetVel.LF = J.LF*getLegData('LF',qd);
feetVel.RF = J.RF*getLegData('RF',qd);
feetVel.LH = J.LH*getLegData('LH',qd);
feetVel.RH = J.RH*getLegData('RH',qd);
hips.LF = getHipPos( 'LF');
hips.RF = getHipPos( 'RF');
hips.LH = getHipPos( 'LH');
hips.RH = getHipPos( 'RH');

b_R_w = rpyToRot(basePoseW(1:3,1));
mapOmegaToRPYDer = inv(rpyToEar(basePoseW(1), basePoseW(2), basePoseW(3)));
        

