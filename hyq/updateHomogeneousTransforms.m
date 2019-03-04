function out = updateHomogeneousTransforms( q)

ht = evalin('base', 'ht');
consts = evalin('base', 'consts');
params = evalin('base', 'params');
sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
ht.fr_trunk_Xh_LF_hipassemblyCOM(2,1) = -sin_q_LF_HAA;
ht.fr_trunk_Xh_LF_hipassemblyCOM(2,2) = -cos_q_LF_HAA;
ht.fr_trunk_Xh_LF_hipassemblyCOM(2,4) =  consts.ty_LF_HAA-( consts.tx_LF_hipassemblyCOM * sin_q_LF_HAA);
ht.fr_trunk_Xh_LF_hipassemblyCOM(3,1) = -cos_q_LF_HAA;
ht.fr_trunk_Xh_LF_hipassemblyCOM(3,2) = sin_q_LF_HAA;
ht.fr_trunk_Xh_LF_hipassemblyCOM(3,4) = - consts.tx_LF_hipassemblyCOM * cos_q_LF_HAA;

sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
ht.fr_trunk_Xh_RF_hipassemblyCOM(2,1) = sin_q_RF_HAA;
ht.fr_trunk_Xh_RF_hipassemblyCOM(2,2) = cos_q_RF_HAA;
ht.fr_trunk_Xh_RF_hipassemblyCOM(2,4) = ( consts.tx_RF_hipassemblyCOM * sin_q_RF_HAA)+ consts.ty_RF_HAA;
ht.fr_trunk_Xh_RF_hipassemblyCOM(3,1) = -cos_q_RF_HAA;
ht.fr_trunk_Xh_RF_hipassemblyCOM(3,2) = sin_q_RF_HAA;
ht.fr_trunk_Xh_RF_hipassemblyCOM(3,4) = - consts.tx_RF_hipassemblyCOM * cos_q_RF_HAA;

sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
ht.fr_trunk_Xh_LH_hipassemblyCOM(2,1) = -sin_q_LH_HAA;
ht.fr_trunk_Xh_LH_hipassemblyCOM(2,2) = -cos_q_LH_HAA;
ht.fr_trunk_Xh_LH_hipassemblyCOM(2,4) =  consts.ty_LH_HAA-( consts.tx_LH_hipassemblyCOM * sin_q_LH_HAA);
ht.fr_trunk_Xh_LH_hipassemblyCOM(3,1) = -cos_q_LH_HAA;
ht.fr_trunk_Xh_LH_hipassemblyCOM(3,2) = sin_q_LH_HAA;
ht.fr_trunk_Xh_LH_hipassemblyCOM(3,4) = - consts.tx_LH_hipassemblyCOM * cos_q_LH_HAA;

sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
ht.fr_trunk_Xh_RH_hipassemblyCOM(2,1) = sin_q_RH_HAA;
ht.fr_trunk_Xh_RH_hipassemblyCOM(2,2) = cos_q_RH_HAA;
ht.fr_trunk_Xh_RH_hipassemblyCOM(2,4) = ( consts.tx_RH_hipassemblyCOM * sin_q_RH_HAA)+ consts.ty_RH_HAA;
ht.fr_trunk_Xh_RH_hipassemblyCOM(3,1) = -cos_q_RH_HAA;
ht.fr_trunk_Xh_RH_hipassemblyCOM(3,2) = sin_q_RH_HAA;
ht.fr_trunk_Xh_RH_hipassemblyCOM(3,4) = - consts.tx_RH_hipassemblyCOM * cos_q_RH_HAA;

sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
sin_q_LF_HFE = sin( q(2));
cos_q_LF_HFE = cos( q(2));
ht.fr_trunk_Xh_LF_upperlegCOM(1,1) = -sin_q_LF_HFE;
ht.fr_trunk_Xh_LF_upperlegCOM(1,2) = -cos_q_LF_HFE;
ht.fr_trunk_Xh_LF_upperlegCOM(1,4) = (- consts.tx_LF_upperlegCOM * sin_q_LF_HFE)-( consts.ty_LF_upperlegCOM * cos_q_LF_HFE)+ consts.tx_LF_HAA;
ht.fr_trunk_Xh_LF_upperlegCOM(2,1) = -sin_q_LF_HAA * cos_q_LF_HFE;
ht.fr_trunk_Xh_LF_upperlegCOM(2,2) = sin_q_LF_HAA * sin_q_LF_HFE;
ht.fr_trunk_Xh_LF_upperlegCOM(2,3) = cos_q_LF_HAA;
ht.fr_trunk_Xh_LF_upperlegCOM(2,4) = ( consts.ty_LF_upperlegCOM * sin_q_LF_HAA * sin_q_LF_HFE)-( consts.tx_LF_upperlegCOM * sin_q_LF_HAA * cos_q_LF_HFE)-( consts.tx_LF_HFE * sin_q_LF_HAA)+ consts.ty_LF_HAA;
ht.fr_trunk_Xh_LF_upperlegCOM(3,1) = -cos_q_LF_HAA * cos_q_LF_HFE;
ht.fr_trunk_Xh_LF_upperlegCOM(3,2) = cos_q_LF_HAA * sin_q_LF_HFE;
ht.fr_trunk_Xh_LF_upperlegCOM(3,3) = -sin_q_LF_HAA;
ht.fr_trunk_Xh_LF_upperlegCOM(3,4) = ( consts.ty_LF_upperlegCOM * cos_q_LF_HAA * sin_q_LF_HFE)-( consts.tx_LF_upperlegCOM * cos_q_LF_HAA * cos_q_LF_HFE)-( consts.tx_LF_HFE * cos_q_LF_HAA);

sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
sin_q_RF_HFE = sin( q(5));
cos_q_RF_HFE = cos( q(5));
ht.fr_trunk_Xh_RF_upperlegCOM(1,1) = -sin_q_RF_HFE;
ht.fr_trunk_Xh_RF_upperlegCOM(1,2) = -cos_q_RF_HFE;
ht.fr_trunk_Xh_RF_upperlegCOM(1,4) = (- consts.tx_RF_upperlegCOM * sin_q_RF_HFE)-( consts.ty_RF_upperlegCOM * cos_q_RF_HFE)+ consts.tx_RF_HAA;
ht.fr_trunk_Xh_RF_upperlegCOM(2,1) = sin_q_RF_HAA * cos_q_RF_HFE;
ht.fr_trunk_Xh_RF_upperlegCOM(2,2) = -sin_q_RF_HAA * sin_q_RF_HFE;
ht.fr_trunk_Xh_RF_upperlegCOM(2,3) = cos_q_RF_HAA;
ht.fr_trunk_Xh_RF_upperlegCOM(2,4) = (- consts.ty_RF_upperlegCOM * sin_q_RF_HAA * sin_q_RF_HFE)+( consts.tx_RF_upperlegCOM * sin_q_RF_HAA * cos_q_RF_HFE)+( consts.tx_RF_HFE * sin_q_RF_HAA)+ consts.ty_RF_HAA;
ht.fr_trunk_Xh_RF_upperlegCOM(3,1) = -cos_q_RF_HAA * cos_q_RF_HFE;
ht.fr_trunk_Xh_RF_upperlegCOM(3,2) = cos_q_RF_HAA * sin_q_RF_HFE;
ht.fr_trunk_Xh_RF_upperlegCOM(3,3) = sin_q_RF_HAA;
ht.fr_trunk_Xh_RF_upperlegCOM(3,4) = ( consts.ty_RF_upperlegCOM * cos_q_RF_HAA * sin_q_RF_HFE)-( consts.tx_RF_upperlegCOM * cos_q_RF_HAA * cos_q_RF_HFE)-( consts.tx_RF_HFE * cos_q_RF_HAA);

sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
sin_q_LH_HFE = sin( q(8));
cos_q_LH_HFE = cos( q(8));
ht.fr_trunk_Xh_LH_upperlegCOM(1,1) = -sin_q_LH_HFE;
ht.fr_trunk_Xh_LH_upperlegCOM(1,2) = -cos_q_LH_HFE;
ht.fr_trunk_Xh_LH_upperlegCOM(1,4) = (- consts.tx_LH_upperlegCOM * sin_q_LH_HFE)-( consts.ty_LH_upperlegCOM * cos_q_LH_HFE)+ consts.tx_LH_HAA;
ht.fr_trunk_Xh_LH_upperlegCOM(2,1) = -sin_q_LH_HAA * cos_q_LH_HFE;
ht.fr_trunk_Xh_LH_upperlegCOM(2,2) = sin_q_LH_HAA * sin_q_LH_HFE;
ht.fr_trunk_Xh_LH_upperlegCOM(2,3) = cos_q_LH_HAA;
ht.fr_trunk_Xh_LH_upperlegCOM(2,4) = ( consts.ty_LH_upperlegCOM * sin_q_LH_HAA * sin_q_LH_HFE)-( consts.tx_LH_upperlegCOM * sin_q_LH_HAA * cos_q_LH_HFE)-( consts.tx_LH_HFE * sin_q_LH_HAA)+ consts.ty_LH_HAA;
ht.fr_trunk_Xh_LH_upperlegCOM(3,1) = -cos_q_LH_HAA * cos_q_LH_HFE;
ht.fr_trunk_Xh_LH_upperlegCOM(3,2) = cos_q_LH_HAA * sin_q_LH_HFE;
ht.fr_trunk_Xh_LH_upperlegCOM(3,3) = -sin_q_LH_HAA;
ht.fr_trunk_Xh_LH_upperlegCOM(3,4) = ( consts.ty_LH_upperlegCOM * cos_q_LH_HAA * sin_q_LH_HFE)-( consts.tx_LH_upperlegCOM * cos_q_LH_HAA * cos_q_LH_HFE)-( consts.tx_LH_HFE * cos_q_LH_HAA);

sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
sin_q_RH_HFE = sin( q(11));
cos_q_RH_HFE = cos( q(11));
ht.fr_trunk_Xh_RH_upperlegCOM(1,1) = -sin_q_RH_HFE;
ht.fr_trunk_Xh_RH_upperlegCOM(1,2) = -cos_q_RH_HFE;
ht.fr_trunk_Xh_RH_upperlegCOM(1,4) = (- consts.tx_RH_upperlegCOM * sin_q_RH_HFE)-( consts.ty_RH_upperlegCOM * cos_q_RH_HFE)+ consts.tx_RH_HAA;
ht.fr_trunk_Xh_RH_upperlegCOM(2,1) = sin_q_RH_HAA * cos_q_RH_HFE;
ht.fr_trunk_Xh_RH_upperlegCOM(2,2) = -sin_q_RH_HAA * sin_q_RH_HFE;
ht.fr_trunk_Xh_RH_upperlegCOM(2,3) = cos_q_RH_HAA;
ht.fr_trunk_Xh_RH_upperlegCOM(2,4) = (- consts.ty_RH_upperlegCOM * sin_q_RH_HAA * sin_q_RH_HFE)+( consts.tx_RH_upperlegCOM * sin_q_RH_HAA * cos_q_RH_HFE)+( consts.tx_RH_HFE * sin_q_RH_HAA)+ consts.ty_RH_HAA;
ht.fr_trunk_Xh_RH_upperlegCOM(3,1) = -cos_q_RH_HAA * cos_q_RH_HFE;
ht.fr_trunk_Xh_RH_upperlegCOM(3,2) = cos_q_RH_HAA * sin_q_RH_HFE;
ht.fr_trunk_Xh_RH_upperlegCOM(3,3) = sin_q_RH_HAA;
ht.fr_trunk_Xh_RH_upperlegCOM(3,4) = ( consts.ty_RH_upperlegCOM * cos_q_RH_HAA * sin_q_RH_HFE)-( consts.tx_RH_upperlegCOM * cos_q_RH_HAA * cos_q_RH_HFE)-( consts.tx_RH_HFE * cos_q_RH_HAA);

sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
sin_q_LF_HFE = sin( q(2));
cos_q_LF_HFE = cos( q(2));
sin_q_LF_KFE = sin( q(3));
cos_q_LF_KFE = cos( q(3));
ht.fr_trunk_Xh_LF_lowerlegCOM(1,1) = (-cos_q_LF_HFE * sin_q_LF_KFE)-(sin_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_lowerlegCOM(1,2) = (sin_q_LF_HFE * sin_q_LF_KFE)-(cos_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_lowerlegCOM(1,4) = (- consts.tx_LF_lowerlegCOM * cos_q_LF_HFE * sin_q_LF_KFE)-( consts.tx_LF_lowerlegCOM * sin_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * sin_q_LF_HFE)+ consts.tx_LF_HAA;
ht.fr_trunk_Xh_LF_lowerlegCOM(2,1) = (sin_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-(sin_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_lowerlegCOM(2,2) = (sin_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+(sin_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_lowerlegCOM(2,3) = cos_q_LF_HAA;
ht.fr_trunk_Xh_LF_lowerlegCOM(2,4) = ( consts.tx_LF_lowerlegCOM * sin_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-( consts.tx_LF_lowerlegCOM * sin_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * sin_q_LF_HAA * cos_q_LF_HFE)-( consts.tx_LF_HFE * sin_q_LF_HAA)+ consts.ty_LF_HAA;
ht.fr_trunk_Xh_LF_lowerlegCOM(3,1) = (cos_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-(cos_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_lowerlegCOM(3,2) = (cos_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+(cos_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_lowerlegCOM(3,3) = -sin_q_LF_HAA;
ht.fr_trunk_Xh_LF_lowerlegCOM(3,4) = ( consts.tx_LF_lowerlegCOM * cos_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-( consts.tx_LF_lowerlegCOM * cos_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * cos_q_LF_HAA * cos_q_LF_HFE)-( consts.tx_LF_HFE * cos_q_LF_HAA);

sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
sin_q_RF_HFE = sin( q(5));
cos_q_RF_HFE = cos( q(5));
sin_q_RF_KFE = sin( q(6));
cos_q_RF_KFE = cos( q(6));
ht.fr_trunk_Xh_RF_lowerlegCOM(1,1) = (-cos_q_RF_HFE * sin_q_RF_KFE)-(sin_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_lowerlegCOM(1,2) = (sin_q_RF_HFE * sin_q_RF_KFE)-(cos_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_lowerlegCOM(1,4) = (- consts.tx_RF_lowerlegCOM * cos_q_RF_HFE * sin_q_RF_KFE)-( consts.tx_RF_lowerlegCOM * sin_q_RF_HFE * cos_q_RF_KFE)-( consts.tx_RF_KFE * sin_q_RF_HFE)+ consts.tx_RF_HAA;
ht.fr_trunk_Xh_RF_lowerlegCOM(2,1) = (sin_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)-(sin_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE);
ht.fr_trunk_Xh_RF_lowerlegCOM(2,2) = (-sin_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)-(sin_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_lowerlegCOM(2,3) = cos_q_RF_HAA;
ht.fr_trunk_Xh_RF_lowerlegCOM(2,4) = (- consts.tx_RF_lowerlegCOM * sin_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)+( consts.tx_RF_lowerlegCOM * sin_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)+( consts.tx_RF_KFE * sin_q_RF_HAA * cos_q_RF_HFE)+( consts.tx_RF_HFE * sin_q_RF_HAA)+ consts.ty_RF_HAA;
ht.fr_trunk_Xh_RF_lowerlegCOM(3,1) = (cos_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)-(cos_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_lowerlegCOM(3,2) = (cos_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)+(cos_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_lowerlegCOM(3,3) = sin_q_RF_HAA;
ht.fr_trunk_Xh_RF_lowerlegCOM(3,4) = ( consts.tx_RF_lowerlegCOM * cos_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)-( consts.tx_RF_lowerlegCOM * cos_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)-( consts.tx_RF_KFE * cos_q_RF_HAA * cos_q_RF_HFE)-( consts.tx_RF_HFE * cos_q_RF_HAA);

sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
sin_q_LH_HFE = sin( q(8));
cos_q_LH_HFE = cos( q(8));
sin_q_LH_KFE = sin( q(9));
cos_q_LH_KFE = cos( q(9));
ht.fr_trunk_Xh_LH_lowerlegCOM(1,1) = (-cos_q_LH_HFE * sin_q_LH_KFE)-(sin_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_lowerlegCOM(1,2) = (sin_q_LH_HFE * sin_q_LH_KFE)-(cos_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_lowerlegCOM(1,4) = (- consts.tx_LH_lowerlegCOM * cos_q_LH_HFE * sin_q_LH_KFE)-( consts.tx_LH_lowerlegCOM * sin_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * sin_q_LH_HFE)+ consts.tx_LH_HAA;
ht.fr_trunk_Xh_LH_lowerlegCOM(2,1) = (sin_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-(sin_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_lowerlegCOM(2,2) = (sin_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+(sin_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_lowerlegCOM(2,3) = cos_q_LH_HAA;
ht.fr_trunk_Xh_LH_lowerlegCOM(2,4) = ( consts.tx_LH_lowerlegCOM * sin_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-( consts.tx_LH_lowerlegCOM * sin_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * sin_q_LH_HAA * cos_q_LH_HFE)-( consts.tx_LH_HFE * sin_q_LH_HAA)+ consts.ty_LH_HAA;
ht.fr_trunk_Xh_LH_lowerlegCOM(3,1) = (cos_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-(cos_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_lowerlegCOM(3,2) = (cos_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+(cos_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_lowerlegCOM(3,3) = -sin_q_LH_HAA;
ht.fr_trunk_Xh_LH_lowerlegCOM(3,4) = ( consts.tx_LH_lowerlegCOM * cos_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-( consts.tx_LH_lowerlegCOM * cos_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * cos_q_LH_HAA * cos_q_LH_HFE)-( consts.tx_LH_HFE * cos_q_LH_HAA);

sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
sin_q_RH_HFE = sin( q(11));
cos_q_RH_HFE = cos( q(11));
sin_q_RH_KFE = sin( q(12));
cos_q_RH_KFE = cos( q(12));
ht.fr_trunk_Xh_RH_lowerlegCOM(1,1) = (-cos_q_RH_HFE * sin_q_RH_KFE)-(sin_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_lowerlegCOM(1,2) = (sin_q_RH_HFE * sin_q_RH_KFE)-(cos_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_lowerlegCOM(1,4) = (- consts.tx_RH_lowerlegCOM * cos_q_RH_HFE * sin_q_RH_KFE)-( consts.tx_RH_lowerlegCOM * sin_q_RH_HFE * cos_q_RH_KFE)-( consts.tx_RH_KFE * sin_q_RH_HFE)+ consts.tx_RH_HAA;
ht.fr_trunk_Xh_RH_lowerlegCOM(2,1) = (sin_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)-(sin_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE);
ht.fr_trunk_Xh_RH_lowerlegCOM(2,2) = (-sin_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)-(sin_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_lowerlegCOM(2,3) = cos_q_RH_HAA;
ht.fr_trunk_Xh_RH_lowerlegCOM(2,4) = (- consts.tx_RH_lowerlegCOM * sin_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)+( consts.tx_RH_lowerlegCOM * sin_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)+( consts.tx_RH_KFE * sin_q_RH_HAA * cos_q_RH_HFE)+( consts.tx_RH_HFE * sin_q_RH_HAA)+ consts.ty_RH_HAA;
ht.fr_trunk_Xh_RH_lowerlegCOM(3,1) = (cos_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)-(cos_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_lowerlegCOM(3,2) = (cos_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)+(cos_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_lowerlegCOM(3,3) = sin_q_RH_HAA;
ht.fr_trunk_Xh_RH_lowerlegCOM(3,4) = ( consts.tx_RH_lowerlegCOM * cos_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)-( consts.tx_RH_lowerlegCOM * cos_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)-( consts.tx_RH_KFE * cos_q_RH_HAA * cos_q_RH_HFE)-( consts.tx_RH_HFE * cos_q_RH_HAA);

ht.LF_foot_Xh_fr_LF_lowerleg(3,4) =  params.foot_x;

ht.RF_foot_Xh_fr_RF_lowerleg(3,4) =  params.foot_x;

ht.LH_foot_Xh_fr_LH_lowerleg(3,4) =  params.foot_x;

ht.RH_foot_Xh_fr_RH_lowerleg(3,4) =  params.foot_x;

sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
sin_q_LF_HFE = sin( q(2));
cos_q_LF_HFE = cos( q(2));
sin_q_LF_KFE = sin( q(3));
cos_q_LF_KFE = cos( q(3));
ht.fr_trunk_Xh_LF_foot(1,1) = (cos_q_LF_HFE * cos_q_LF_KFE)-(sin_q_LF_HFE * sin_q_LF_KFE);
ht.fr_trunk_Xh_LF_foot(1,3) = (cos_q_LF_HFE * sin_q_LF_KFE)+(sin_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_foot(1,4) = (- params.foot_x * cos_q_LF_HFE * sin_q_LF_KFE)-( params.foot_x * sin_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * sin_q_LF_HFE)+ consts.tx_LF_HAA;
ht.fr_trunk_Xh_LF_foot(2,1) = (-sin_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)-(sin_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_foot(2,2) = cos_q_LF_HAA;
ht.fr_trunk_Xh_LF_foot(2,3) = (sin_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)-(sin_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE);
ht.fr_trunk_Xh_LF_foot(2,4) = ( params.foot_x * sin_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-( params.foot_x * sin_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * sin_q_LF_HAA * cos_q_LF_HFE)-( consts.tx_LF_HFE * sin_q_LF_HAA)+ consts.ty_LF_HAA;
ht.fr_trunk_Xh_LF_foot(3,1) = (-cos_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)-(cos_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_foot(3,2) = -sin_q_LF_HAA;
ht.fr_trunk_Xh_LF_foot(3,3) = (cos_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)-(cos_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE);
ht.fr_trunk_Xh_LF_foot(3,4) = ( params.foot_x * cos_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-( params.foot_x * cos_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * cos_q_LF_HAA * cos_q_LF_HFE)-( consts.tx_LF_HFE * cos_q_LF_HAA);

sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
sin_q_RF_HFE = sin( q(5));
cos_q_RF_HFE = cos( q(5));
sin_q_RF_KFE = sin( q(6));
cos_q_RF_KFE = cos( q(6));
ht.fr_trunk_Xh_RF_foot(1,1) = (cos_q_RF_HFE * cos_q_RF_KFE)-(sin_q_RF_HFE * sin_q_RF_KFE);
ht.fr_trunk_Xh_RF_foot(1,3) = (cos_q_RF_HFE * sin_q_RF_KFE)+(sin_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_foot(1,4) = (- params.foot_x * cos_q_RF_HFE * sin_q_RF_KFE)-( params.foot_x * sin_q_RF_HFE * cos_q_RF_KFE)-( consts.tx_RF_KFE * sin_q_RF_HFE)+ consts.tx_RF_HAA;
ht.fr_trunk_Xh_RF_foot(2,1) = (sin_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)+(sin_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_foot(2,2) = cos_q_RF_HAA;
ht.fr_trunk_Xh_RF_foot(2,3) = (sin_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)-(sin_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_foot(2,4) = (- params.foot_x * sin_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)+( params.foot_x * sin_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)+( consts.tx_RF_KFE * sin_q_RF_HAA * cos_q_RF_HFE)+( consts.tx_RF_HFE * sin_q_RF_HAA)+ consts.ty_RF_HAA;
ht.fr_trunk_Xh_RF_foot(3,1) = (-cos_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)-(cos_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_foot(3,2) = sin_q_RF_HAA;
ht.fr_trunk_Xh_RF_foot(3,3) = (cos_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)-(cos_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE);
ht.fr_trunk_Xh_RF_foot(3,4) = ( params.foot_x * cos_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)-( params.foot_x * cos_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)-( consts.tx_RF_KFE * cos_q_RF_HAA * cos_q_RF_HFE)-( consts.tx_RF_HFE * cos_q_RF_HAA);

sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
sin_q_LH_HFE = sin( q(8));
cos_q_LH_HFE = cos( q(8));
sin_q_LH_KFE = sin( q(9));
cos_q_LH_KFE = cos( q(9));
ht.fr_trunk_Xh_LH_foot(1,1) = (cos_q_LH_HFE * cos_q_LH_KFE)-(sin_q_LH_HFE * sin_q_LH_KFE);
ht.fr_trunk_Xh_LH_foot(1,3) = (cos_q_LH_HFE * sin_q_LH_KFE)+(sin_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_foot(1,4) = (- params.foot_x * cos_q_LH_HFE * sin_q_LH_KFE)-( params.foot_x * sin_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * sin_q_LH_HFE)+ consts.tx_LH_HAA;
ht.fr_trunk_Xh_LH_foot(2,1) = (-sin_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)-(sin_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_foot(2,2) = cos_q_LH_HAA;
ht.fr_trunk_Xh_LH_foot(2,3) = (sin_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)-(sin_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE);
ht.fr_trunk_Xh_LH_foot(2,4) = ( params.foot_x * sin_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-( params.foot_x * sin_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * sin_q_LH_HAA * cos_q_LH_HFE)-( consts.tx_LH_HFE * sin_q_LH_HAA)+ consts.ty_LH_HAA;
ht.fr_trunk_Xh_LH_foot(3,1) = (-cos_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)-(cos_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_foot(3,2) = -sin_q_LH_HAA;
ht.fr_trunk_Xh_LH_foot(3,3) = (cos_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)-(cos_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE);
ht.fr_trunk_Xh_LH_foot(3,4) = ( params.foot_x * cos_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-( params.foot_x * cos_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * cos_q_LH_HAA * cos_q_LH_HFE)-( consts.tx_LH_HFE * cos_q_LH_HAA);

sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
sin_q_RH_HFE = sin( q(11));
cos_q_RH_HFE = cos( q(11));
sin_q_RH_KFE = sin( q(12));
cos_q_RH_KFE = cos( q(12));
ht.fr_trunk_Xh_RH_foot(1,1) = (cos_q_RH_HFE * cos_q_RH_KFE)-(sin_q_RH_HFE * sin_q_RH_KFE);
ht.fr_trunk_Xh_RH_foot(1,3) = (cos_q_RH_HFE * sin_q_RH_KFE)+(sin_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_foot(1,4) = (- params.foot_x * cos_q_RH_HFE * sin_q_RH_KFE)-( params.foot_x * sin_q_RH_HFE * cos_q_RH_KFE)-( consts.tx_RH_KFE * sin_q_RH_HFE)+ consts.tx_RH_HAA;
ht.fr_trunk_Xh_RH_foot(2,1) = (sin_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)+(sin_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_foot(2,2) = cos_q_RH_HAA;
ht.fr_trunk_Xh_RH_foot(2,3) = (sin_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)-(sin_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_foot(2,4) = (- params.foot_x * sin_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)+( params.foot_x * sin_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)+( consts.tx_RH_KFE * sin_q_RH_HAA * cos_q_RH_HFE)+( consts.tx_RH_HFE * sin_q_RH_HAA)+ consts.ty_RH_HAA;
ht.fr_trunk_Xh_RH_foot(3,1) = (-cos_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)-(cos_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_foot(3,2) = sin_q_RH_HAA;
ht.fr_trunk_Xh_RH_foot(3,3) = (cos_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)-(cos_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE);
ht.fr_trunk_Xh_RH_foot(3,4) = ( params.foot_x * cos_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)-( params.foot_x * cos_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)-( consts.tx_RH_KFE * cos_q_RH_HAA * cos_q_RH_HFE)-( consts.tx_RH_HFE * cos_q_RH_HAA);

ht.fr_LF_lowerleg_Xh_LF_foot(1,4) =  params.foot_x;

ht.fr_RF_lowerleg_Xh_RF_foot(1,4) =  params.foot_x;

ht.fr_LH_lowerleg_Xh_LH_foot(1,4) =  params.foot_x;

ht.fr_RH_lowerleg_Xh_RH_foot(1,4) =  params.foot_x;

sin_q_LF_KFE = sin( q(3));
cos_q_LF_KFE = cos( q(3));
sin_q_LF_HFE = sin( q(2));
cos_q_LF_HFE = cos( q(2));
sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
ht.fr_LF_lowerleg_Xh_fr_trunk(1,1) = (-cos_q_LF_HFE * sin_q_LF_KFE)-(sin_q_LF_HFE * cos_q_LF_KFE);
ht.fr_LF_lowerleg_Xh_fr_trunk(1,2) = (sin_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-(sin_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE);
ht.fr_LF_lowerleg_Xh_fr_trunk(1,3) = (cos_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-(cos_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE);
ht.fr_LF_lowerleg_Xh_fr_trunk(1,4) = ((( consts.tx_LF_HAA * cos_q_LF_HFE)+(( consts.tx_LF_HFE-( consts.ty_LF_HAA * sin_q_LF_HAA)) * sin_q_LF_HFE)) * sin_q_LF_KFE)+((- consts.tx_LF_KFE+((( consts.ty_LF_HAA * sin_q_LF_HAA)- consts.tx_LF_HFE) * cos_q_LF_HFE)+( consts.tx_LF_HAA * sin_q_LF_HFE)) * cos_q_LF_KFE);
ht.fr_LF_lowerleg_Xh_fr_trunk(2,1) = (sin_q_LF_HFE * sin_q_LF_KFE)-(cos_q_LF_HFE * cos_q_LF_KFE);
ht.fr_LF_lowerleg_Xh_fr_trunk(2,2) = (sin_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+(sin_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);
ht.fr_LF_lowerleg_Xh_fr_trunk(2,3) = (cos_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+(cos_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);
ht.fr_LF_lowerleg_Xh_fr_trunk(2,4) = (( consts.tx_LF_KFE+(( consts.tx_LF_HFE-( consts.ty_LF_HAA * sin_q_LF_HAA)) * cos_q_LF_HFE)-( consts.tx_LF_HAA * sin_q_LF_HFE)) * sin_q_LF_KFE)+((( consts.tx_LF_HAA * cos_q_LF_HFE)+(( consts.tx_LF_HFE-( consts.ty_LF_HAA * sin_q_LF_HAA)) * sin_q_LF_HFE)) * cos_q_LF_KFE);
ht.fr_LF_lowerleg_Xh_fr_trunk(3,2) = cos_q_LF_HAA;
ht.fr_LF_lowerleg_Xh_fr_trunk(3,3) = -sin_q_LF_HAA;
ht.fr_LF_lowerleg_Xh_fr_trunk(3,4) = - consts.ty_LF_HAA * cos_q_LF_HAA;

sin_q_RF_KFE = sin( q(6));
cos_q_RF_KFE = cos( q(6));
sin_q_RF_HFE = sin( q(5));
cos_q_RF_HFE = cos( q(5));
sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
ht.fr_RF_lowerleg_Xh_fr_trunk(1,1) = (-cos_q_RF_HFE * sin_q_RF_KFE)-(sin_q_RF_HFE * cos_q_RF_KFE);
ht.fr_RF_lowerleg_Xh_fr_trunk(1,2) = (sin_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)-(sin_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE);
ht.fr_RF_lowerleg_Xh_fr_trunk(1,3) = (cos_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)-(cos_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE);
ht.fr_RF_lowerleg_Xh_fr_trunk(1,4) = ((( consts.tx_RF_HAA * cos_q_RF_HFE)+((( consts.ty_RF_HAA * sin_q_RF_HAA)+ consts.tx_RF_HFE) * sin_q_RF_HFE)) * sin_q_RF_KFE)+((- consts.tx_RF_KFE+(((- consts.ty_RF_HAA * sin_q_RF_HAA)- consts.tx_RF_HFE) * cos_q_RF_HFE)+( consts.tx_RF_HAA * sin_q_RF_HFE)) * cos_q_RF_KFE);
ht.fr_RF_lowerleg_Xh_fr_trunk(2,1) = (sin_q_RF_HFE * sin_q_RF_KFE)-(cos_q_RF_HFE * cos_q_RF_KFE);
ht.fr_RF_lowerleg_Xh_fr_trunk(2,2) = (-sin_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)-(sin_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);
ht.fr_RF_lowerleg_Xh_fr_trunk(2,3) = (cos_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)+(cos_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);
ht.fr_RF_lowerleg_Xh_fr_trunk(2,4) = (( consts.tx_RF_KFE+((( consts.ty_RF_HAA * sin_q_RF_HAA)+ consts.tx_RF_HFE) * cos_q_RF_HFE)-( consts.tx_RF_HAA * sin_q_RF_HFE)) * sin_q_RF_KFE)+((( consts.tx_RF_HAA * cos_q_RF_HFE)+((( consts.ty_RF_HAA * sin_q_RF_HAA)+ consts.tx_RF_HFE) * sin_q_RF_HFE)) * cos_q_RF_KFE);
ht.fr_RF_lowerleg_Xh_fr_trunk(3,2) = cos_q_RF_HAA;
ht.fr_RF_lowerleg_Xh_fr_trunk(3,3) = sin_q_RF_HAA;
ht.fr_RF_lowerleg_Xh_fr_trunk(3,4) = - consts.ty_RF_HAA * cos_q_RF_HAA;

sin_q_LH_KFE = sin( q(9));
cos_q_LH_KFE = cos( q(9));
sin_q_LH_HFE = sin( q(8));
cos_q_LH_HFE = cos( q(8));
sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
ht.fr_LH_lowerleg_Xh_fr_trunk(1,1) = (-cos_q_LH_HFE * sin_q_LH_KFE)-(sin_q_LH_HFE * cos_q_LH_KFE);
ht.fr_LH_lowerleg_Xh_fr_trunk(1,2) = (sin_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-(sin_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE);
ht.fr_LH_lowerleg_Xh_fr_trunk(1,3) = (cos_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-(cos_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE);
ht.fr_LH_lowerleg_Xh_fr_trunk(1,4) = ((( consts.tx_LH_HAA * cos_q_LH_HFE)+(( consts.tx_LH_HFE-( consts.ty_LH_HAA * sin_q_LH_HAA)) * sin_q_LH_HFE)) * sin_q_LH_KFE)+((- consts.tx_LH_KFE+((( consts.ty_LH_HAA * sin_q_LH_HAA)- consts.tx_LH_HFE) * cos_q_LH_HFE)+( consts.tx_LH_HAA * sin_q_LH_HFE)) * cos_q_LH_KFE);
ht.fr_LH_lowerleg_Xh_fr_trunk(2,1) = (sin_q_LH_HFE * sin_q_LH_KFE)-(cos_q_LH_HFE * cos_q_LH_KFE);
ht.fr_LH_lowerleg_Xh_fr_trunk(2,2) = (sin_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+(sin_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);
ht.fr_LH_lowerleg_Xh_fr_trunk(2,3) = (cos_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+(cos_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);
ht.fr_LH_lowerleg_Xh_fr_trunk(2,4) = (( consts.tx_LH_KFE+(( consts.tx_LH_HFE-( consts.ty_LH_HAA * sin_q_LH_HAA)) * cos_q_LH_HFE)-( consts.tx_LH_HAA * sin_q_LH_HFE)) * sin_q_LH_KFE)+((( consts.tx_LH_HAA * cos_q_LH_HFE)+(( consts.tx_LH_HFE-( consts.ty_LH_HAA * sin_q_LH_HAA)) * sin_q_LH_HFE)) * cos_q_LH_KFE);
ht.fr_LH_lowerleg_Xh_fr_trunk(3,2) = cos_q_LH_HAA;
ht.fr_LH_lowerleg_Xh_fr_trunk(3,3) = -sin_q_LH_HAA;
ht.fr_LH_lowerleg_Xh_fr_trunk(3,4) = - consts.ty_LH_HAA * cos_q_LH_HAA;

sin_q_RH_KFE = sin( q(12));
cos_q_RH_KFE = cos( q(12));
sin_q_RH_HFE = sin( q(11));
cos_q_RH_HFE = cos( q(11));
sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
ht.fr_RH_lowerleg_Xh_fr_trunk(1,1) = (-cos_q_RH_HFE * sin_q_RH_KFE)-(sin_q_RH_HFE * cos_q_RH_KFE);
ht.fr_RH_lowerleg_Xh_fr_trunk(1,2) = (sin_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)-(sin_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE);
ht.fr_RH_lowerleg_Xh_fr_trunk(1,3) = (cos_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)-(cos_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE);
ht.fr_RH_lowerleg_Xh_fr_trunk(1,4) = ((( consts.tx_RH_HAA * cos_q_RH_HFE)+((( consts.ty_RH_HAA * sin_q_RH_HAA)+ consts.tx_RH_HFE) * sin_q_RH_HFE)) * sin_q_RH_KFE)+((- consts.tx_RH_KFE+(((- consts.ty_RH_HAA * sin_q_RH_HAA)- consts.tx_RH_HFE) * cos_q_RH_HFE)+( consts.tx_RH_HAA * sin_q_RH_HFE)) * cos_q_RH_KFE);
ht.fr_RH_lowerleg_Xh_fr_trunk(2,1) = (sin_q_RH_HFE * sin_q_RH_KFE)-(cos_q_RH_HFE * cos_q_RH_KFE);
ht.fr_RH_lowerleg_Xh_fr_trunk(2,2) = (-sin_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)-(sin_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);
ht.fr_RH_lowerleg_Xh_fr_trunk(2,3) = (cos_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)+(cos_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);
ht.fr_RH_lowerleg_Xh_fr_trunk(2,4) = (( consts.tx_RH_KFE+((( consts.ty_RH_HAA * sin_q_RH_HAA)+ consts.tx_RH_HFE) * cos_q_RH_HFE)-( consts.tx_RH_HAA * sin_q_RH_HFE)) * sin_q_RH_KFE)+((( consts.tx_RH_HAA * cos_q_RH_HFE)+((( consts.ty_RH_HAA * sin_q_RH_HAA)+ consts.tx_RH_HFE) * sin_q_RH_HFE)) * cos_q_RH_KFE);
ht.fr_RH_lowerleg_Xh_fr_trunk(3,2) = cos_q_RH_HAA;
ht.fr_RH_lowerleg_Xh_fr_trunk(3,3) = sin_q_RH_HAA;
ht.fr_RH_lowerleg_Xh_fr_trunk(3,4) = - consts.ty_RH_HAA * cos_q_RH_HAA;

sin_q_LF_KFE = sin( q(3));
cos_q_LF_KFE = cos( q(3));
sin_q_LF_HFE = sin( q(2));
cos_q_LF_HFE = cos( q(2));
sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
ht.LF_foot_Xh_fr_trunk(1,1) = (cos_q_LF_HFE * cos_q_LF_KFE)-(sin_q_LF_HFE * sin_q_LF_KFE);
ht.LF_foot_Xh_fr_trunk(1,2) = (-sin_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)-(sin_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);
ht.LF_foot_Xh_fr_trunk(1,3) = (-cos_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)-(cos_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);
ht.LF_foot_Xh_fr_trunk(1,4) = ((- consts.tx_LF_KFE+((( consts.ty_LF_HAA * sin_q_LF_HAA)- consts.tx_LF_HFE) * cos_q_LF_HFE)+( consts.tx_LF_HAA * sin_q_LF_HFE)) * sin_q_LF_KFE)+((((( consts.ty_LF_HAA * sin_q_LF_HAA)- consts.tx_LF_HFE) * sin_q_LF_HFE)-( consts.tx_LF_HAA * cos_q_LF_HFE)) * cos_q_LF_KFE);
ht.LF_foot_Xh_fr_trunk(2,2) = cos_q_LF_HAA;
ht.LF_foot_Xh_fr_trunk(2,3) = -sin_q_LF_HAA;
ht.LF_foot_Xh_fr_trunk(2,4) = - consts.ty_LF_HAA * cos_q_LF_HAA;
ht.LF_foot_Xh_fr_trunk(3,1) = (cos_q_LF_HFE * sin_q_LF_KFE)+(sin_q_LF_HFE * cos_q_LF_KFE);
ht.LF_foot_Xh_fr_trunk(3,2) = (sin_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)-(sin_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE);
ht.LF_foot_Xh_fr_trunk(3,3) = (cos_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)-(cos_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE);
ht.LF_foot_Xh_fr_trunk(3,4) = ((((( consts.ty_LF_HAA * sin_q_LF_HAA)- consts.tx_LF_HFE) * sin_q_LF_HFE)-( consts.tx_LF_HAA * cos_q_LF_HFE)) * sin_q_LF_KFE)+(( consts.tx_LF_KFE+(( consts.tx_LF_HFE-( consts.ty_LF_HAA * sin_q_LF_HAA)) * cos_q_LF_HFE)-( consts.tx_LF_HAA * sin_q_LF_HFE)) * cos_q_LF_KFE)+ params.foot_x;

sin_q_RF_KFE = sin( q(6));
cos_q_RF_KFE = cos( q(6));
sin_q_RF_HFE = sin( q(5));
cos_q_RF_HFE = cos( q(5));
sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
ht.RF_foot_Xh_fr_trunk(1,1) = (cos_q_RF_HFE * cos_q_RF_KFE)-(sin_q_RF_HFE * sin_q_RF_KFE);
ht.RF_foot_Xh_fr_trunk(1,2) = (sin_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)+(sin_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);
ht.RF_foot_Xh_fr_trunk(1,3) = (-cos_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)-(cos_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);
ht.RF_foot_Xh_fr_trunk(1,4) = ((- consts.tx_RF_KFE+(((- consts.ty_RF_HAA * sin_q_RF_HAA)- consts.tx_RF_HFE) * cos_q_RF_HFE)+( consts.tx_RF_HAA * sin_q_RF_HFE)) * sin_q_RF_KFE)+(((((- consts.ty_RF_HAA * sin_q_RF_HAA)- consts.tx_RF_HFE) * sin_q_RF_HFE)-( consts.tx_RF_HAA * cos_q_RF_HFE)) * cos_q_RF_KFE);
ht.RF_foot_Xh_fr_trunk(2,2) = cos_q_RF_HAA;
ht.RF_foot_Xh_fr_trunk(2,3) = sin_q_RF_HAA;
ht.RF_foot_Xh_fr_trunk(2,4) = - consts.ty_RF_HAA * cos_q_RF_HAA;
ht.RF_foot_Xh_fr_trunk(3,1) = (cos_q_RF_HFE * sin_q_RF_KFE)+(sin_q_RF_HFE * cos_q_RF_KFE);
ht.RF_foot_Xh_fr_trunk(3,2) = (sin_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)-(sin_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE);
ht.RF_foot_Xh_fr_trunk(3,3) = (cos_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)-(cos_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE);
ht.RF_foot_Xh_fr_trunk(3,4) = (((((- consts.ty_RF_HAA * sin_q_RF_HAA)- consts.tx_RF_HFE) * sin_q_RF_HFE)-( consts.tx_RF_HAA * cos_q_RF_HFE)) * sin_q_RF_KFE)+(( consts.tx_RF_KFE+((( consts.ty_RF_HAA * sin_q_RF_HAA)+ consts.tx_RF_HFE) * cos_q_RF_HFE)-( consts.tx_RF_HAA * sin_q_RF_HFE)) * cos_q_RF_KFE)+ params.foot_x;

sin_q_LH_KFE = sin( q(9));
cos_q_LH_KFE = cos( q(9));
sin_q_LH_HFE = sin( q(8));
cos_q_LH_HFE = cos( q(8));
sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
ht.LH_foot_Xh_fr_trunk(1,1) = (cos_q_LH_HFE * cos_q_LH_KFE)-(sin_q_LH_HFE * sin_q_LH_KFE);
ht.LH_foot_Xh_fr_trunk(1,2) = (-sin_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)-(sin_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);
ht.LH_foot_Xh_fr_trunk(1,3) = (-cos_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)-(cos_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);
ht.LH_foot_Xh_fr_trunk(1,4) = ((- consts.tx_LH_KFE+((( consts.ty_LH_HAA * sin_q_LH_HAA)- consts.tx_LH_HFE) * cos_q_LH_HFE)+( consts.tx_LH_HAA * sin_q_LH_HFE)) * sin_q_LH_KFE)+((((( consts.ty_LH_HAA * sin_q_LH_HAA)- consts.tx_LH_HFE) * sin_q_LH_HFE)-( consts.tx_LH_HAA * cos_q_LH_HFE)) * cos_q_LH_KFE);
ht.LH_foot_Xh_fr_trunk(2,2) = cos_q_LH_HAA;
ht.LH_foot_Xh_fr_trunk(2,3) = -sin_q_LH_HAA;
ht.LH_foot_Xh_fr_trunk(2,4) = - consts.ty_LH_HAA * cos_q_LH_HAA;
ht.LH_foot_Xh_fr_trunk(3,1) = (cos_q_LH_HFE * sin_q_LH_KFE)+(sin_q_LH_HFE * cos_q_LH_KFE);
ht.LH_foot_Xh_fr_trunk(3,2) = (sin_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)-(sin_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE);
ht.LH_foot_Xh_fr_trunk(3,3) = (cos_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)-(cos_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE);
ht.LH_foot_Xh_fr_trunk(3,4) = ((((( consts.ty_LH_HAA * sin_q_LH_HAA)- consts.tx_LH_HFE) * sin_q_LH_HFE)-( consts.tx_LH_HAA * cos_q_LH_HFE)) * sin_q_LH_KFE)+(( consts.tx_LH_KFE+(( consts.tx_LH_HFE-( consts.ty_LH_HAA * sin_q_LH_HAA)) * cos_q_LH_HFE)-( consts.tx_LH_HAA * sin_q_LH_HFE)) * cos_q_LH_KFE)+ params.foot_x;

sin_q_RH_KFE = sin( q(12));
cos_q_RH_KFE = cos( q(12));
sin_q_RH_HFE = sin( q(11));
cos_q_RH_HFE = cos( q(11));
sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
ht.RH_foot_Xh_fr_trunk(1,1) = (cos_q_RH_HFE * cos_q_RH_KFE)-(sin_q_RH_HFE * sin_q_RH_KFE);
ht.RH_foot_Xh_fr_trunk(1,2) = (sin_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)+(sin_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);
ht.RH_foot_Xh_fr_trunk(1,3) = (-cos_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)-(cos_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);
ht.RH_foot_Xh_fr_trunk(1,4) = ((- consts.tx_RH_KFE+(((- consts.ty_RH_HAA * sin_q_RH_HAA)- consts.tx_RH_HFE) * cos_q_RH_HFE)+( consts.tx_RH_HAA * sin_q_RH_HFE)) * sin_q_RH_KFE)+(((((- consts.ty_RH_HAA * sin_q_RH_HAA)- consts.tx_RH_HFE) * sin_q_RH_HFE)-( consts.tx_RH_HAA * cos_q_RH_HFE)) * cos_q_RH_KFE);
ht.RH_foot_Xh_fr_trunk(2,2) = cos_q_RH_HAA;
ht.RH_foot_Xh_fr_trunk(2,3) = sin_q_RH_HAA;
ht.RH_foot_Xh_fr_trunk(2,4) = - consts.ty_RH_HAA * cos_q_RH_HAA;
ht.RH_foot_Xh_fr_trunk(3,1) = (cos_q_RH_HFE * sin_q_RH_KFE)+(sin_q_RH_HFE * cos_q_RH_KFE);
ht.RH_foot_Xh_fr_trunk(3,2) = (sin_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)-(sin_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE);
ht.RH_foot_Xh_fr_trunk(3,3) = (cos_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)-(cos_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE);
ht.RH_foot_Xh_fr_trunk(3,4) = (((((- consts.ty_RH_HAA * sin_q_RH_HAA)- consts.tx_RH_HFE) * sin_q_RH_HFE)-( consts.tx_RH_HAA * cos_q_RH_HFE)) * sin_q_RH_KFE)+(( consts.tx_RH_KFE+((( consts.ty_RH_HAA * sin_q_RH_HAA)+ consts.tx_RH_HFE) * cos_q_RH_HFE)-( consts.tx_RH_HAA * sin_q_RH_HFE)) * cos_q_RH_KFE)+ params.foot_x;

sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
sin_q_LF_HFE = sin( q(2));
cos_q_LF_HFE = cos( q(2));
sin_q_LF_KFE = sin( q(3));
cos_q_LF_KFE = cos( q(3));
ht.fr_trunk_Xh_LF_shin(1,1) = (-cos_q_LF_HFE * sin_q_LF_KFE)-(sin_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_shin(1,2) = (sin_q_LF_HFE * sin_q_LF_KFE)-(cos_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_shin(1,4) = (- params.LF_shin * cos_q_LF_HFE * sin_q_LF_KFE)-( params.LF_shin * sin_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * sin_q_LF_HFE)+ consts.tx_LF_HAA;
ht.fr_trunk_Xh_LF_shin(2,1) = (sin_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-(sin_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_shin(2,2) = (sin_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+(sin_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_shin(2,3) = cos_q_LF_HAA;
ht.fr_trunk_Xh_LF_shin(2,4) = ( params.LF_shin * sin_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-( params.LF_shin * sin_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * sin_q_LF_HAA * cos_q_LF_HFE)-( consts.tx_LF_HFE * sin_q_LF_HAA)+ consts.ty_LF_HAA;
ht.fr_trunk_Xh_LF_shin(3,1) = (cos_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-(cos_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_shin(3,2) = (cos_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+(cos_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);
ht.fr_trunk_Xh_LF_shin(3,3) = -sin_q_LF_HAA;
ht.fr_trunk_Xh_LF_shin(3,4) = ( params.LF_shin * cos_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-( params.LF_shin * cos_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * cos_q_LF_HAA * cos_q_LF_HFE)-( consts.tx_LF_HFE * cos_q_LF_HAA);

sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
sin_q_RF_HFE = sin( q(5));
cos_q_RF_HFE = cos( q(5));
sin_q_RF_KFE = sin( q(6));
cos_q_RF_KFE = cos( q(6));
ht.fr_trunk_Xh_RF_shin(1,1) = (-cos_q_RF_HFE * sin_q_RF_KFE)-(sin_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_shin(1,2) = (sin_q_RF_HFE * sin_q_RF_KFE)-(cos_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_shin(1,4) = (- params.RF_shin * cos_q_RF_HFE * sin_q_RF_KFE)-( params.RF_shin * sin_q_RF_HFE * cos_q_RF_KFE)-( consts.tx_RF_KFE * sin_q_RF_HFE)+ consts.tx_RF_HAA;
ht.fr_trunk_Xh_RF_shin(2,1) = (sin_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)-(sin_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE);
ht.fr_trunk_Xh_RF_shin(2,2) = (-sin_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)-(sin_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_shin(2,3) = cos_q_RF_HAA;
ht.fr_trunk_Xh_RF_shin(2,4) = (- params.RF_shin * sin_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)+( params.RF_shin * sin_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)+( consts.tx_RF_KFE * sin_q_RF_HAA * cos_q_RF_HFE)+( consts.tx_RF_HFE * sin_q_RF_HAA)+ consts.ty_RF_HAA;
ht.fr_trunk_Xh_RF_shin(3,1) = (cos_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)-(cos_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_shin(3,2) = (cos_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)+(cos_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);
ht.fr_trunk_Xh_RF_shin(3,3) = sin_q_RF_HAA;
ht.fr_trunk_Xh_RF_shin(3,4) = ( params.RF_shin * cos_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)-( params.RF_shin * cos_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)-( consts.tx_RF_KFE * cos_q_RF_HAA * cos_q_RF_HFE)-( consts.tx_RF_HFE * cos_q_RF_HAA);

sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
sin_q_LH_HFE = sin( q(8));
cos_q_LH_HFE = cos( q(8));
sin_q_LH_KFE = sin( q(9));
cos_q_LH_KFE = cos( q(9));
ht.fr_trunk_Xh_LH_shin(1,1) = (-cos_q_LH_HFE * sin_q_LH_KFE)-(sin_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_shin(1,2) = (sin_q_LH_HFE * sin_q_LH_KFE)-(cos_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_shin(1,4) = (- params.LH_shin * cos_q_LH_HFE * sin_q_LH_KFE)-( params.LH_shin * sin_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * sin_q_LH_HFE)+ consts.tx_LH_HAA;
ht.fr_trunk_Xh_LH_shin(2,1) = (sin_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-(sin_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_shin(2,2) = (sin_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+(sin_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_shin(2,3) = cos_q_LH_HAA;
ht.fr_trunk_Xh_LH_shin(2,4) = ( params.LH_shin * sin_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-( params.LH_shin * sin_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * sin_q_LH_HAA * cos_q_LH_HFE)-( consts.tx_LH_HFE * sin_q_LH_HAA)+ consts.ty_LH_HAA;
ht.fr_trunk_Xh_LH_shin(3,1) = (cos_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-(cos_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_shin(3,2) = (cos_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+(cos_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);
ht.fr_trunk_Xh_LH_shin(3,3) = -sin_q_LH_HAA;
ht.fr_trunk_Xh_LH_shin(3,4) = ( params.LH_shin * cos_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-( params.LH_shin * cos_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * cos_q_LH_HAA * cos_q_LH_HFE)-( consts.tx_LH_HFE * cos_q_LH_HAA);

sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
sin_q_RH_HFE = sin( q(11));
cos_q_RH_HFE = cos( q(11));
sin_q_RH_KFE = sin( q(12));
cos_q_RH_KFE = cos( q(12));
ht.fr_trunk_Xh_RH_shin(1,1) = (-cos_q_RH_HFE * sin_q_RH_KFE)-(sin_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_shin(1,2) = (sin_q_RH_HFE * sin_q_RH_KFE)-(cos_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_shin(1,4) = (- params.RH_shin * cos_q_RH_HFE * sin_q_RH_KFE)-( params.RH_shin * sin_q_RH_HFE * cos_q_RH_KFE)-( consts.tx_RH_KFE * sin_q_RH_HFE)+ consts.tx_RH_HAA;
ht.fr_trunk_Xh_RH_shin(2,1) = (sin_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)-(sin_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE);
ht.fr_trunk_Xh_RH_shin(2,2) = (-sin_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)-(sin_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_shin(2,3) = cos_q_RH_HAA;
ht.fr_trunk_Xh_RH_shin(2,4) = (- params.RH_shin * sin_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)+( params.RH_shin * sin_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)+( consts.tx_RH_KFE * sin_q_RH_HAA * cos_q_RH_HFE)+( consts.tx_RH_HFE * sin_q_RH_HAA)+ consts.ty_RH_HAA;
ht.fr_trunk_Xh_RH_shin(3,1) = (cos_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)-(cos_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_shin(3,2) = (cos_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)+(cos_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);
ht.fr_trunk_Xh_RH_shin(3,3) = sin_q_RH_HAA;
ht.fr_trunk_Xh_RH_shin(3,4) = ( params.RH_shin * cos_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)-( params.RH_shin * cos_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)-( consts.tx_RH_KFE * cos_q_RH_HAA * cos_q_RH_HFE)-( consts.tx_RH_HFE * cos_q_RH_HAA);


sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
ht.fr_trunk_Xh_fr_LF_HFE(2,1) = -sin_q_LF_HAA;
ht.fr_trunk_Xh_fr_LF_HFE(2,3) = cos_q_LF_HAA;
ht.fr_trunk_Xh_fr_LF_HFE(2,4) =  consts.ty_LF_HAA-( consts.tx_LF_HFE * sin_q_LF_HAA);
ht.fr_trunk_Xh_fr_LF_HFE(3,1) = -cos_q_LF_HAA;
ht.fr_trunk_Xh_fr_LF_HFE(3,3) = -sin_q_LF_HAA;
ht.fr_trunk_Xh_fr_LF_HFE(3,4) = - consts.tx_LF_HFE * cos_q_LF_HAA;

sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
sin_q_LF_HFE = sin( q(2));
cos_q_LF_HFE = cos( q(2));
ht.fr_trunk_Xh_fr_LF_KFE(1,1) = -sin_q_LF_HFE;
ht.fr_trunk_Xh_fr_LF_KFE(1,2) = -cos_q_LF_HFE;
ht.fr_trunk_Xh_fr_LF_KFE(1,4) =  consts.tx_LF_HAA-( consts.tx_LF_KFE * sin_q_LF_HFE);
ht.fr_trunk_Xh_fr_LF_KFE(2,1) = -sin_q_LF_HAA * cos_q_LF_HFE;
ht.fr_trunk_Xh_fr_LF_KFE(2,2) = sin_q_LF_HAA * sin_q_LF_HFE;
ht.fr_trunk_Xh_fr_LF_KFE(2,3) = cos_q_LF_HAA;
ht.fr_trunk_Xh_fr_LF_KFE(2,4) = (- consts.tx_LF_KFE * sin_q_LF_HAA * cos_q_LF_HFE)-( consts.tx_LF_HFE * sin_q_LF_HAA)+ consts.ty_LF_HAA;
ht.fr_trunk_Xh_fr_LF_KFE(3,1) = -cos_q_LF_HAA * cos_q_LF_HFE;
ht.fr_trunk_Xh_fr_LF_KFE(3,2) = cos_q_LF_HAA * sin_q_LF_HFE;
ht.fr_trunk_Xh_fr_LF_KFE(3,3) = -sin_q_LF_HAA;
ht.fr_trunk_Xh_fr_LF_KFE(3,4) = (- consts.tx_LF_KFE * cos_q_LF_HAA * cos_q_LF_HFE)-( consts.tx_LF_HFE * cos_q_LF_HAA);


sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
ht.fr_trunk_Xh_fr_RF_HFE(2,1) = sin_q_RF_HAA;
ht.fr_trunk_Xh_fr_RF_HFE(2,3) = cos_q_RF_HAA;
ht.fr_trunk_Xh_fr_RF_HFE(2,4) = ( consts.tx_RF_HFE * sin_q_RF_HAA)+ consts.ty_RF_HAA;
ht.fr_trunk_Xh_fr_RF_HFE(3,1) = -cos_q_RF_HAA;
ht.fr_trunk_Xh_fr_RF_HFE(3,3) = sin_q_RF_HAA;
ht.fr_trunk_Xh_fr_RF_HFE(3,4) = - consts.tx_RF_HFE * cos_q_RF_HAA;

sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
sin_q_RF_HFE = sin( q(5));
cos_q_RF_HFE = cos( q(5));
ht.fr_trunk_Xh_fr_RF_KFE(1,1) = -sin_q_RF_HFE;
ht.fr_trunk_Xh_fr_RF_KFE(1,2) = -cos_q_RF_HFE;
ht.fr_trunk_Xh_fr_RF_KFE(1,4) =  consts.tx_RF_HAA-( consts.tx_RF_KFE * sin_q_RF_HFE);
ht.fr_trunk_Xh_fr_RF_KFE(2,1) = sin_q_RF_HAA * cos_q_RF_HFE;
ht.fr_trunk_Xh_fr_RF_KFE(2,2) = -sin_q_RF_HAA * sin_q_RF_HFE;
ht.fr_trunk_Xh_fr_RF_KFE(2,3) = cos_q_RF_HAA;
ht.fr_trunk_Xh_fr_RF_KFE(2,4) = ( consts.tx_RF_KFE * sin_q_RF_HAA * cos_q_RF_HFE)+( consts.tx_RF_HFE * sin_q_RF_HAA)+ consts.ty_RF_HAA;
ht.fr_trunk_Xh_fr_RF_KFE(3,1) = -cos_q_RF_HAA * cos_q_RF_HFE;
ht.fr_trunk_Xh_fr_RF_KFE(3,2) = cos_q_RF_HAA * sin_q_RF_HFE;
ht.fr_trunk_Xh_fr_RF_KFE(3,3) = sin_q_RF_HAA;
ht.fr_trunk_Xh_fr_RF_KFE(3,4) = (- consts.tx_RF_KFE * cos_q_RF_HAA * cos_q_RF_HFE)-( consts.tx_RF_HFE * cos_q_RF_HAA);


sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
ht.fr_trunk_Xh_fr_LH_HFE(2,1) = -sin_q_LH_HAA;
ht.fr_trunk_Xh_fr_LH_HFE(2,3) = cos_q_LH_HAA;
ht.fr_trunk_Xh_fr_LH_HFE(2,4) =  consts.ty_LH_HAA-( consts.tx_LH_HFE * sin_q_LH_HAA);
ht.fr_trunk_Xh_fr_LH_HFE(3,1) = -cos_q_LH_HAA;
ht.fr_trunk_Xh_fr_LH_HFE(3,3) = -sin_q_LH_HAA;
ht.fr_trunk_Xh_fr_LH_HFE(3,4) = - consts.tx_LH_HFE * cos_q_LH_HAA;

sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
sin_q_LH_HFE = sin( q(8));
cos_q_LH_HFE = cos( q(8));
ht.fr_trunk_Xh_fr_LH_KFE(1,1) = -sin_q_LH_HFE;
ht.fr_trunk_Xh_fr_LH_KFE(1,2) = -cos_q_LH_HFE;
ht.fr_trunk_Xh_fr_LH_KFE(1,4) =  consts.tx_LH_HAA-( consts.tx_LH_KFE * sin_q_LH_HFE);
ht.fr_trunk_Xh_fr_LH_KFE(2,1) = -sin_q_LH_HAA * cos_q_LH_HFE;
ht.fr_trunk_Xh_fr_LH_KFE(2,2) = sin_q_LH_HAA * sin_q_LH_HFE;
ht.fr_trunk_Xh_fr_LH_KFE(2,3) = cos_q_LH_HAA;
ht.fr_trunk_Xh_fr_LH_KFE(2,4) = (- consts.tx_LH_KFE * sin_q_LH_HAA * cos_q_LH_HFE)-( consts.tx_LH_HFE * sin_q_LH_HAA)+ consts.ty_LH_HAA;
ht.fr_trunk_Xh_fr_LH_KFE(3,1) = -cos_q_LH_HAA * cos_q_LH_HFE;
ht.fr_trunk_Xh_fr_LH_KFE(3,2) = cos_q_LH_HAA * sin_q_LH_HFE;
ht.fr_trunk_Xh_fr_LH_KFE(3,3) = -sin_q_LH_HAA;
ht.fr_trunk_Xh_fr_LH_KFE(3,4) = (- consts.tx_LH_KFE * cos_q_LH_HAA * cos_q_LH_HFE)-( consts.tx_LH_HFE * cos_q_LH_HAA);


sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
ht.fr_trunk_Xh_fr_RH_HFE(2,1) = sin_q_RH_HAA;
ht.fr_trunk_Xh_fr_RH_HFE(2,3) = cos_q_RH_HAA;
ht.fr_trunk_Xh_fr_RH_HFE(2,4) = ( consts.tx_RH_HFE * sin_q_RH_HAA)+ consts.ty_RH_HAA;
ht.fr_trunk_Xh_fr_RH_HFE(3,1) = -cos_q_RH_HAA;
ht.fr_trunk_Xh_fr_RH_HFE(3,3) = sin_q_RH_HAA;
ht.fr_trunk_Xh_fr_RH_HFE(3,4) = - consts.tx_RH_HFE * cos_q_RH_HAA;

sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
sin_q_RH_HFE = sin( q(11));
cos_q_RH_HFE = cos( q(11));
ht.fr_trunk_Xh_fr_RH_KFE(1,1) = -sin_q_RH_HFE;
ht.fr_trunk_Xh_fr_RH_KFE(1,2) = -cos_q_RH_HFE;
ht.fr_trunk_Xh_fr_RH_KFE(1,4) =  consts.tx_RH_HAA-( consts.tx_RH_KFE * sin_q_RH_HFE);
ht.fr_trunk_Xh_fr_RH_KFE(2,1) = sin_q_RH_HAA * cos_q_RH_HFE;
ht.fr_trunk_Xh_fr_RH_KFE(2,2) = -sin_q_RH_HAA * sin_q_RH_HFE;
ht.fr_trunk_Xh_fr_RH_KFE(2,3) = cos_q_RH_HAA;
ht.fr_trunk_Xh_fr_RH_KFE(2,4) = ( consts.tx_RH_KFE * sin_q_RH_HAA * cos_q_RH_HFE)+( consts.tx_RH_HFE * sin_q_RH_HAA)+ consts.ty_RH_HAA;
ht.fr_trunk_Xh_fr_RH_KFE(3,1) = -cos_q_RH_HAA * cos_q_RH_HFE;
ht.fr_trunk_Xh_fr_RH_KFE(3,2) = cos_q_RH_HAA * sin_q_RH_HFE;
ht.fr_trunk_Xh_fr_RH_KFE(3,3) = sin_q_RH_HAA;
ht.fr_trunk_Xh_fr_RH_KFE(3,4) = (- consts.tx_RH_KFE * cos_q_RH_HAA * cos_q_RH_HFE)-( consts.tx_RH_HFE * cos_q_RH_HAA);

sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
ht.fr_LF_hipassembly_Xh_fr_trunk(1,2) = -sin_q_LF_HAA;
ht.fr_LF_hipassembly_Xh_fr_trunk(1,3) = -cos_q_LF_HAA;
ht.fr_LF_hipassembly_Xh_fr_trunk(1,4) =  consts.ty_LF_HAA * sin_q_LF_HAA;
ht.fr_LF_hipassembly_Xh_fr_trunk(2,2) = -cos_q_LF_HAA;
ht.fr_LF_hipassembly_Xh_fr_trunk(2,3) = sin_q_LF_HAA;
ht.fr_LF_hipassembly_Xh_fr_trunk(2,4) =  consts.ty_LF_HAA * cos_q_LF_HAA;

sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
ht.fr_trunk_Xh_fr_LF_hipassembly(2,1) = -sin_q_LF_HAA;
ht.fr_trunk_Xh_fr_LF_hipassembly(2,2) = -cos_q_LF_HAA;
ht.fr_trunk_Xh_fr_LF_hipassembly(3,1) = -cos_q_LF_HAA;
ht.fr_trunk_Xh_fr_LF_hipassembly(3,2) = sin_q_LF_HAA;

sin_q_LF_HFE = sin( q(2));
cos_q_LF_HFE = cos( q(2));
ht.fr_LF_upperleg_Xh_fr_LF_hipassembly(1,1) = cos_q_LF_HFE;
ht.fr_LF_upperleg_Xh_fr_LF_hipassembly(1,3) = sin_q_LF_HFE;
ht.fr_LF_upperleg_Xh_fr_LF_hipassembly(1,4) = - consts.tx_LF_HFE * cos_q_LF_HFE;
ht.fr_LF_upperleg_Xh_fr_LF_hipassembly(2,1) = -sin_q_LF_HFE;
ht.fr_LF_upperleg_Xh_fr_LF_hipassembly(2,3) = cos_q_LF_HFE;
ht.fr_LF_upperleg_Xh_fr_LF_hipassembly(2,4) =  consts.tx_LF_HFE * sin_q_LF_HFE;

sin_q_LF_HFE = sin( q(2));
cos_q_LF_HFE = cos( q(2));
ht.fr_LF_hipassembly_Xh_fr_LF_upperleg(1,1) = cos_q_LF_HFE;
ht.fr_LF_hipassembly_Xh_fr_LF_upperleg(1,2) = -sin_q_LF_HFE;
ht.fr_LF_hipassembly_Xh_fr_LF_upperleg(3,1) = sin_q_LF_HFE;
ht.fr_LF_hipassembly_Xh_fr_LF_upperleg(3,2) = cos_q_LF_HFE;

sin_q_LF_KFE = sin( q(3));
cos_q_LF_KFE = cos( q(3));
ht.fr_LF_lowerleg_Xh_fr_LF_upperleg(1,1) = cos_q_LF_KFE;
ht.fr_LF_lowerleg_Xh_fr_LF_upperleg(1,2) = sin_q_LF_KFE;
ht.fr_LF_lowerleg_Xh_fr_LF_upperleg(1,4) = - consts.tx_LF_KFE * cos_q_LF_KFE;
ht.fr_LF_lowerleg_Xh_fr_LF_upperleg(2,1) = -sin_q_LF_KFE;
ht.fr_LF_lowerleg_Xh_fr_LF_upperleg(2,2) = cos_q_LF_KFE;
ht.fr_LF_lowerleg_Xh_fr_LF_upperleg(2,4) =  consts.tx_LF_KFE * sin_q_LF_KFE;

sin_q_LF_KFE = sin( q(3));
cos_q_LF_KFE = cos( q(3));
ht.fr_LF_upperleg_Xh_fr_LF_lowerleg(1,1) = cos_q_LF_KFE;
ht.fr_LF_upperleg_Xh_fr_LF_lowerleg(1,2) = -sin_q_LF_KFE;
ht.fr_LF_upperleg_Xh_fr_LF_lowerleg(2,1) = sin_q_LF_KFE;
ht.fr_LF_upperleg_Xh_fr_LF_lowerleg(2,2) = cos_q_LF_KFE;

sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
ht.fr_RF_hipassembly_Xh_fr_trunk(1,2) = sin_q_RF_HAA;
ht.fr_RF_hipassembly_Xh_fr_trunk(1,3) = -cos_q_RF_HAA;
ht.fr_RF_hipassembly_Xh_fr_trunk(1,4) = - consts.ty_RF_HAA * sin_q_RF_HAA;
ht.fr_RF_hipassembly_Xh_fr_trunk(2,2) = cos_q_RF_HAA;
ht.fr_RF_hipassembly_Xh_fr_trunk(2,3) = sin_q_RF_HAA;
ht.fr_RF_hipassembly_Xh_fr_trunk(2,4) = - consts.ty_RF_HAA * cos_q_RF_HAA;

sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
ht.fr_trunk_Xh_fr_RF_hipassembly(2,1) = sin_q_RF_HAA;
ht.fr_trunk_Xh_fr_RF_hipassembly(2,2) = cos_q_RF_HAA;
ht.fr_trunk_Xh_fr_RF_hipassembly(3,1) = -cos_q_RF_HAA;
ht.fr_trunk_Xh_fr_RF_hipassembly(3,2) = sin_q_RF_HAA;

sin_q_RF_HFE = sin( q(5));
cos_q_RF_HFE = cos( q(5));
ht.fr_RF_upperleg_Xh_fr_RF_hipassembly(1,1) = cos_q_RF_HFE;
ht.fr_RF_upperleg_Xh_fr_RF_hipassembly(1,3) = -sin_q_RF_HFE;
ht.fr_RF_upperleg_Xh_fr_RF_hipassembly(1,4) = - consts.tx_RF_HFE * cos_q_RF_HFE;
ht.fr_RF_upperleg_Xh_fr_RF_hipassembly(2,1) = -sin_q_RF_HFE;
ht.fr_RF_upperleg_Xh_fr_RF_hipassembly(2,3) = -cos_q_RF_HFE;
ht.fr_RF_upperleg_Xh_fr_RF_hipassembly(2,4) =  consts.tx_RF_HFE * sin_q_RF_HFE;

sin_q_RF_HFE = sin( q(5));
cos_q_RF_HFE = cos( q(5));
ht.fr_RF_hipassembly_Xh_fr_RF_upperleg(1,1) = cos_q_RF_HFE;
ht.fr_RF_hipassembly_Xh_fr_RF_upperleg(1,2) = -sin_q_RF_HFE;
ht.fr_RF_hipassembly_Xh_fr_RF_upperleg(3,1) = -sin_q_RF_HFE;
ht.fr_RF_hipassembly_Xh_fr_RF_upperleg(3,2) = -cos_q_RF_HFE;

sin_q_RF_KFE = sin( q(6));
cos_q_RF_KFE = cos( q(6));
ht.fr_RF_lowerleg_Xh_fr_RF_upperleg(1,1) = cos_q_RF_KFE;
ht.fr_RF_lowerleg_Xh_fr_RF_upperleg(1,2) = sin_q_RF_KFE;
ht.fr_RF_lowerleg_Xh_fr_RF_upperleg(1,4) = - consts.tx_RF_KFE * cos_q_RF_KFE;
ht.fr_RF_lowerleg_Xh_fr_RF_upperleg(2,1) = -sin_q_RF_KFE;
ht.fr_RF_lowerleg_Xh_fr_RF_upperleg(2,2) = cos_q_RF_KFE;
ht.fr_RF_lowerleg_Xh_fr_RF_upperleg(2,4) =  consts.tx_RF_KFE * sin_q_RF_KFE;

sin_q_RF_KFE = sin( q(6));
cos_q_RF_KFE = cos( q(6));
ht.fr_RF_upperleg_Xh_fr_RF_lowerleg(1,1) = cos_q_RF_KFE;
ht.fr_RF_upperleg_Xh_fr_RF_lowerleg(1,2) = -sin_q_RF_KFE;
ht.fr_RF_upperleg_Xh_fr_RF_lowerleg(2,1) = sin_q_RF_KFE;
ht.fr_RF_upperleg_Xh_fr_RF_lowerleg(2,2) = cos_q_RF_KFE;

sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
ht.fr_LH_hipassembly_Xh_fr_trunk(1,2) = -sin_q_LH_HAA;
ht.fr_LH_hipassembly_Xh_fr_trunk(1,3) = -cos_q_LH_HAA;
ht.fr_LH_hipassembly_Xh_fr_trunk(1,4) =  consts.ty_LH_HAA * sin_q_LH_HAA;
ht.fr_LH_hipassembly_Xh_fr_trunk(2,2) = -cos_q_LH_HAA;
ht.fr_LH_hipassembly_Xh_fr_trunk(2,3) = sin_q_LH_HAA;
ht.fr_LH_hipassembly_Xh_fr_trunk(2,4) =  consts.ty_LH_HAA * cos_q_LH_HAA;

sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
ht.fr_trunk_Xh_fr_LH_hipassembly(2,1) = -sin_q_LH_HAA;
ht.fr_trunk_Xh_fr_LH_hipassembly(2,2) = -cos_q_LH_HAA;
ht.fr_trunk_Xh_fr_LH_hipassembly(3,1) = -cos_q_LH_HAA;
ht.fr_trunk_Xh_fr_LH_hipassembly(3,2) = sin_q_LH_HAA;

sin_q_LH_HFE = sin( q(8));
cos_q_LH_HFE = cos( q(8));
ht.fr_LH_upperleg_Xh_fr_LH_hipassembly(1,1) = cos_q_LH_HFE;
ht.fr_LH_upperleg_Xh_fr_LH_hipassembly(1,3) = sin_q_LH_HFE;
ht.fr_LH_upperleg_Xh_fr_LH_hipassembly(1,4) = - consts.tx_LH_HFE * cos_q_LH_HFE;
ht.fr_LH_upperleg_Xh_fr_LH_hipassembly(2,1) = -sin_q_LH_HFE;
ht.fr_LH_upperleg_Xh_fr_LH_hipassembly(2,3) = cos_q_LH_HFE;
ht.fr_LH_upperleg_Xh_fr_LH_hipassembly(2,4) =  consts.tx_LH_HFE * sin_q_LH_HFE;

sin_q_LH_HFE = sin( q(8));
cos_q_LH_HFE = cos( q(8));
ht.fr_LH_hipassembly_Xh_fr_LH_upperleg(1,1) = cos_q_LH_HFE;
ht.fr_LH_hipassembly_Xh_fr_LH_upperleg(1,2) = -sin_q_LH_HFE;
ht.fr_LH_hipassembly_Xh_fr_LH_upperleg(3,1) = sin_q_LH_HFE;
ht.fr_LH_hipassembly_Xh_fr_LH_upperleg(3,2) = cos_q_LH_HFE;

sin_q_LH_KFE = sin( q(9));
cos_q_LH_KFE = cos( q(9));
ht.fr_LH_lowerleg_Xh_fr_LH_upperleg(1,1) = cos_q_LH_KFE;
ht.fr_LH_lowerleg_Xh_fr_LH_upperleg(1,2) = sin_q_LH_KFE;
ht.fr_LH_lowerleg_Xh_fr_LH_upperleg(1,4) = - consts.tx_LH_KFE * cos_q_LH_KFE;
ht.fr_LH_lowerleg_Xh_fr_LH_upperleg(2,1) = -sin_q_LH_KFE;
ht.fr_LH_lowerleg_Xh_fr_LH_upperleg(2,2) = cos_q_LH_KFE;
ht.fr_LH_lowerleg_Xh_fr_LH_upperleg(2,4) =  consts.tx_LH_KFE * sin_q_LH_KFE;

sin_q_LH_KFE = sin( q(9));
cos_q_LH_KFE = cos( q(9));
ht.fr_LH_upperleg_Xh_fr_LH_lowerleg(1,1) = cos_q_LH_KFE;
ht.fr_LH_upperleg_Xh_fr_LH_lowerleg(1,2) = -sin_q_LH_KFE;
ht.fr_LH_upperleg_Xh_fr_LH_lowerleg(2,1) = sin_q_LH_KFE;
ht.fr_LH_upperleg_Xh_fr_LH_lowerleg(2,2) = cos_q_LH_KFE;

sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
ht.fr_RH_hipassembly_Xh_fr_trunk(1,2) = sin_q_RH_HAA;
ht.fr_RH_hipassembly_Xh_fr_trunk(1,3) = -cos_q_RH_HAA;
ht.fr_RH_hipassembly_Xh_fr_trunk(1,4) = - consts.ty_RH_HAA * sin_q_RH_HAA;
ht.fr_RH_hipassembly_Xh_fr_trunk(2,2) = cos_q_RH_HAA;
ht.fr_RH_hipassembly_Xh_fr_trunk(2,3) = sin_q_RH_HAA;
ht.fr_RH_hipassembly_Xh_fr_trunk(2,4) = - consts.ty_RH_HAA * cos_q_RH_HAA;

sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
ht.fr_trunk_Xh_fr_RH_hipassembly(2,1) = sin_q_RH_HAA;
ht.fr_trunk_Xh_fr_RH_hipassembly(2,2) = cos_q_RH_HAA;
ht.fr_trunk_Xh_fr_RH_hipassembly(3,1) = -cos_q_RH_HAA;
ht.fr_trunk_Xh_fr_RH_hipassembly(3,2) = sin_q_RH_HAA;

sin_q_RH_HFE = sin( q(11));
cos_q_RH_HFE = cos( q(11));
ht.fr_RH_upperleg_Xh_fr_RH_hipassembly(1,1) = cos_q_RH_HFE;
ht.fr_RH_upperleg_Xh_fr_RH_hipassembly(1,3) = -sin_q_RH_HFE;
ht.fr_RH_upperleg_Xh_fr_RH_hipassembly(1,4) = - consts.tx_RH_HFE * cos_q_RH_HFE;
ht.fr_RH_upperleg_Xh_fr_RH_hipassembly(2,1) = -sin_q_RH_HFE;
ht.fr_RH_upperleg_Xh_fr_RH_hipassembly(2,3) = -cos_q_RH_HFE;
ht.fr_RH_upperleg_Xh_fr_RH_hipassembly(2,4) =  consts.tx_RH_HFE * sin_q_RH_HFE;

sin_q_RH_HFE = sin( q(11));
cos_q_RH_HFE = cos( q(11));
ht.fr_RH_hipassembly_Xh_fr_RH_upperleg(1,1) = cos_q_RH_HFE;
ht.fr_RH_hipassembly_Xh_fr_RH_upperleg(1,2) = -sin_q_RH_HFE;
ht.fr_RH_hipassembly_Xh_fr_RH_upperleg(3,1) = -sin_q_RH_HFE;
ht.fr_RH_hipassembly_Xh_fr_RH_upperleg(3,2) = -cos_q_RH_HFE;

sin_q_RH_KFE = sin( q(12));
cos_q_RH_KFE = cos( q(12));
ht.fr_RH_lowerleg_Xh_fr_RH_upperleg(1,1) = cos_q_RH_KFE;
ht.fr_RH_lowerleg_Xh_fr_RH_upperleg(1,2) = sin_q_RH_KFE;
ht.fr_RH_lowerleg_Xh_fr_RH_upperleg(1,4) = - consts.tx_RH_KFE * cos_q_RH_KFE;
ht.fr_RH_lowerleg_Xh_fr_RH_upperleg(2,1) = -sin_q_RH_KFE;
ht.fr_RH_lowerleg_Xh_fr_RH_upperleg(2,2) = cos_q_RH_KFE;
ht.fr_RH_lowerleg_Xh_fr_RH_upperleg(2,4) =  consts.tx_RH_KFE * sin_q_RH_KFE;

sin_q_RH_KFE = sin( q(12));
cos_q_RH_KFE = cos( q(12));
ht.fr_RH_upperleg_Xh_fr_RH_lowerleg(1,1) = cos_q_RH_KFE;
ht.fr_RH_upperleg_Xh_fr_RH_lowerleg(1,2) = -sin_q_RH_KFE;
ht.fr_RH_upperleg_Xh_fr_RH_lowerleg(2,1) = sin_q_RH_KFE;
ht.fr_RH_upperleg_Xh_fr_RH_lowerleg(2,2) = cos_q_RH_KFE;




assignin('base', 'ht',ht)



out = ht;