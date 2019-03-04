updateHomogeneousTransforms(q);
updateJacobians(q);
updateMotionTransforms(q);
updateForceTransforms(q);
[H Ic_trunk F]=updateJSIM();


J.LF = jacs.fr_trunk_J_LF_foot(4:6,1:3);
J.RF = jacs.fr_trunk_J_RF_foot(4:6,1:3);
J.LH = jacs.fr_trunk_J_LH_foot(4:6,1:3);
J.RH = jacs.fr_trunk_J_RH_foot(4:6,1:3);
feet.LF = fwdKin( 'LF'); feetVel.LF = J.LF*getLegData('LF',qd);
feet.RF = fwdKin( 'RF'); feetVel.RF = J.RF*getLegData('RF',qd);
feet.LH = fwdKin( 'LH'); feetVel.LH = J.LH*getLegData('LH',qd);
feet.RH = fwdKin( 'RH'); feetVel.RH = J.RH*getLegData('RH',qd);

hips.LF = getHipPos( 'LF');
hips.LF = getHipPos( 'RF');
hips.LF = getHipPos( 'LH');
hips.v = getHipPos( 'RH');

b_R_w = rpyToRot(basePoseW(1:3,1));
mapOmegaToRPYDer = inv(rpyToEar(basePoseW(1), basePoseW(2), basePoseW(3)));
        