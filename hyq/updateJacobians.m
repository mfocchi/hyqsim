function out = updateJacobians(q)

jacs = evalin('base', 'jacs');
consts = evalin('base', 'consts');
params = evalin('base', 'params');

sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
sin_q_LF_HFE = sin( q(2));
cos_q_LF_HFE = cos( q(2));
sin_q_LF_KFE = sin( q(3));
cos_q_LF_KFE = cos( q(3));
jacs.fr_trunk_J_LF_foot(2,2) = cos_q_LF_HAA;
jacs.fr_trunk_J_LF_foot(2,3) = cos_q_LF_HAA;
jacs.fr_trunk_J_LF_foot(3,2) = -sin_q_LF_HAA;
jacs.fr_trunk_J_LF_foot(3,3) = -sin_q_LF_HAA;
jacs.fr_trunk_J_LF_foot(4,2) = ( params.foot_x * sin_q_LF_HFE * sin_q_LF_KFE)-( params.foot_x * cos_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * cos_q_LF_HFE);
jacs.fr_trunk_J_LF_foot(4,3) = ( params.foot_x * sin_q_LF_HFE * sin_q_LF_KFE)-( params.foot_x * cos_q_LF_HFE * cos_q_LF_KFE);
jacs.fr_trunk_J_LF_foot(5,1) = ( params.foot_x * cos_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-( params.foot_x * cos_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * cos_q_LF_HAA * cos_q_LF_HFE)-( consts.tx_LF_HFE * cos_q_LF_HAA);
jacs.fr_trunk_J_LF_foot(5,2) = ( params.foot_x * sin_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+( params.foot_x * sin_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE)+( consts.tx_LF_KFE * sin_q_LF_HAA * sin_q_LF_HFE);
jacs.fr_trunk_J_LF_foot(5,3) = ( params.foot_x * sin_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+( params.foot_x * sin_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);
jacs.fr_trunk_J_LF_foot(6,1) = (- params.foot_x * sin_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)+( params.foot_x * sin_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)+( consts.tx_LF_KFE * sin_q_LF_HAA * cos_q_LF_HFE)+( consts.tx_LF_HFE * sin_q_LF_HAA);
jacs.fr_trunk_J_LF_foot(6,2) = ( params.foot_x * cos_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+( params.foot_x * cos_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE)+( consts.tx_LF_KFE * cos_q_LF_HAA * sin_q_LF_HFE);
jacs.fr_trunk_J_LF_foot(6,3) = ( params.foot_x * cos_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+( params.foot_x * cos_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);

sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
sin_q_RF_HFE = sin( q(5));
cos_q_RF_HFE = cos( q(5));
sin_q_RF_KFE = sin( q(6));
cos_q_RF_KFE = cos( q(6));
jacs.fr_trunk_J_RF_foot(2,2) = cos_q_RF_HAA;
jacs.fr_trunk_J_RF_foot(2,3) = cos_q_RF_HAA;
jacs.fr_trunk_J_RF_foot(3,2) = sin_q_RF_HAA;
jacs.fr_trunk_J_RF_foot(3,3) = sin_q_RF_HAA;
jacs.fr_trunk_J_RF_foot(4,2) = ( params.foot_x * sin_q_RF_HFE * sin_q_RF_KFE)-( params.foot_x * cos_q_RF_HFE * cos_q_RF_KFE)-( consts.tx_RF_KFE * cos_q_RF_HFE);
jacs.fr_trunk_J_RF_foot(4,3) = ( params.foot_x * sin_q_RF_HFE * sin_q_RF_KFE)-( params.foot_x * cos_q_RF_HFE * cos_q_RF_KFE);
jacs.fr_trunk_J_RF_foot(5,1) = (- params.foot_x * cos_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)+( params.foot_x * cos_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)+( consts.tx_RF_KFE * cos_q_RF_HAA * cos_q_RF_HFE)+( consts.tx_RF_HFE * cos_q_RF_HAA);
jacs.fr_trunk_J_RF_foot(5,2) = (- params.foot_x * sin_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)-( params.foot_x * sin_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE)-( consts.tx_RF_KFE * sin_q_RF_HAA * sin_q_RF_HFE);
jacs.fr_trunk_J_RF_foot(5,3) = (- params.foot_x * sin_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)-( params.foot_x * sin_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);
jacs.fr_trunk_J_RF_foot(6,1) = (- params.foot_x * sin_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)+( params.foot_x * sin_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)+( consts.tx_RF_KFE * sin_q_RF_HAA * cos_q_RF_HFE)+( consts.tx_RF_HFE * sin_q_RF_HAA);
jacs.fr_trunk_J_RF_foot(6,2) = ( params.foot_x * cos_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)+( params.foot_x * cos_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE)+( consts.tx_RF_KFE * cos_q_RF_HAA * sin_q_RF_HFE);
jacs.fr_trunk_J_RF_foot(6,3) = ( params.foot_x * cos_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)+( params.foot_x * cos_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);

sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
sin_q_LH_HFE = sin( q(8));
cos_q_LH_HFE = cos( q(8));
sin_q_LH_KFE = sin( q(9));
cos_q_LH_KFE = cos( q(9));
jacs.fr_trunk_J_LH_foot(2,2) = cos_q_LH_HAA;
jacs.fr_trunk_J_LH_foot(2,3) = cos_q_LH_HAA;
jacs.fr_trunk_J_LH_foot(3,2) = -sin_q_LH_HAA;
jacs.fr_trunk_J_LH_foot(3,3) = -sin_q_LH_HAA;
jacs.fr_trunk_J_LH_foot(4,2) = ( params.foot_x * sin_q_LH_HFE * sin_q_LH_KFE)-( params.foot_x * cos_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * cos_q_LH_HFE);
jacs.fr_trunk_J_LH_foot(4,3) = ( params.foot_x * sin_q_LH_HFE * sin_q_LH_KFE)-( params.foot_x * cos_q_LH_HFE * cos_q_LH_KFE);
jacs.fr_trunk_J_LH_foot(5,1) = ( params.foot_x * cos_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-( params.foot_x * cos_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * cos_q_LH_HAA * cos_q_LH_HFE)-( consts.tx_LH_HFE * cos_q_LH_HAA);
jacs.fr_trunk_J_LH_foot(5,2) = ( params.foot_x * sin_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+( params.foot_x * sin_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE)+( consts.tx_LH_KFE * sin_q_LH_HAA * sin_q_LH_HFE);
jacs.fr_trunk_J_LH_foot(5,3) = ( params.foot_x * sin_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+( params.foot_x * sin_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);
jacs.fr_trunk_J_LH_foot(6,1) = (- params.foot_x * sin_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)+( params.foot_x * sin_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)+( consts.tx_LH_KFE * sin_q_LH_HAA * cos_q_LH_HFE)+( consts.tx_LH_HFE * sin_q_LH_HAA);
jacs.fr_trunk_J_LH_foot(6,2) = ( params.foot_x * cos_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+( params.foot_x * cos_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE)+( consts.tx_LH_KFE * cos_q_LH_HAA * sin_q_LH_HFE);
jacs.fr_trunk_J_LH_foot(6,3) = ( params.foot_x * cos_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+( params.foot_x * cos_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);

sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
sin_q_RH_HFE = sin( q(11));
cos_q_RH_HFE = cos( q(11));
sin_q_RH_KFE = sin( q(12));
cos_q_RH_KFE = cos( q(12));
jacs.fr_trunk_J_RH_foot(2,2) = cos_q_RH_HAA;
jacs.fr_trunk_J_RH_foot(2,3) = cos_q_RH_HAA;
jacs.fr_trunk_J_RH_foot(3,2) = sin_q_RH_HAA;
jacs.fr_trunk_J_RH_foot(3,3) = sin_q_RH_HAA;
jacs.fr_trunk_J_RH_foot(4,2) = ( params.foot_x * sin_q_RH_HFE * sin_q_RH_KFE)-( params.foot_x * cos_q_RH_HFE * cos_q_RH_KFE)-( consts.tx_RH_KFE * cos_q_RH_HFE);
jacs.fr_trunk_J_RH_foot(4,3) = ( params.foot_x * sin_q_RH_HFE * sin_q_RH_KFE)-( params.foot_x * cos_q_RH_HFE * cos_q_RH_KFE);
jacs.fr_trunk_J_RH_foot(5,1) = (- params.foot_x * cos_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)+( params.foot_x * cos_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)+( consts.tx_RH_KFE * cos_q_RH_HAA * cos_q_RH_HFE)+( consts.tx_RH_HFE * cos_q_RH_HAA);
jacs.fr_trunk_J_RH_foot(5,2) = (- params.foot_x * sin_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)-( params.foot_x * sin_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE)-( consts.tx_RH_KFE * sin_q_RH_HAA * sin_q_RH_HFE);
jacs.fr_trunk_J_RH_foot(5,3) = (- params.foot_x * sin_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)-( params.foot_x * sin_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);
jacs.fr_trunk_J_RH_foot(6,1) = (- params.foot_x * sin_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)+( params.foot_x * sin_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)+( consts.tx_RH_KFE * sin_q_RH_HAA * cos_q_RH_HFE)+( consts.tx_RH_HFE * sin_q_RH_HAA);
jacs.fr_trunk_J_RH_foot(6,2) = ( params.foot_x * cos_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)+( params.foot_x * cos_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE)+( consts.tx_RH_KFE * cos_q_RH_HAA * sin_q_RH_HFE);
jacs.fr_trunk_J_RH_foot(6,3) = ( params.foot_x * cos_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)+( params.foot_x * cos_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);

sin_q_LF_HAA = sin( q(1));
cos_q_LF_HAA = cos( q(1));
sin_q_LF_HFE = sin( q(2));
cos_q_LF_HFE = cos( q(2));
sin_q_LF_KFE = sin( q(3));
cos_q_LF_KFE = cos( q(3));
jacs.fr_trunk_J_LF_shin(2,2) = cos_q_LF_HAA;
jacs.fr_trunk_J_LF_shin(2,3) = cos_q_LF_HAA;
jacs.fr_trunk_J_LF_shin(3,2) = -sin_q_LF_HAA;
jacs.fr_trunk_J_LF_shin(3,3) = -sin_q_LF_HAA;
jacs.fr_trunk_J_LF_shin(4,2) = ( params.LF_shin * sin_q_LF_HFE * sin_q_LF_KFE)-( params.LF_shin * cos_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * cos_q_LF_HFE);
jacs.fr_trunk_J_LF_shin(4,3) = ( params.LF_shin * sin_q_LF_HFE * sin_q_LF_KFE)-( params.LF_shin * cos_q_LF_HFE * cos_q_LF_KFE);
jacs.fr_trunk_J_LF_shin(5,1) = ( params.LF_shin * cos_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)-( params.LF_shin * cos_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)-( consts.tx_LF_KFE * cos_q_LF_HAA * cos_q_LF_HFE)-( consts.tx_LF_HFE * cos_q_LF_HAA);
jacs.fr_trunk_J_LF_shin(5,2) = ( params.LF_shin * sin_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+( params.LF_shin * sin_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE)+( consts.tx_LF_KFE * sin_q_LF_HAA * sin_q_LF_HFE);
jacs.fr_trunk_J_LF_shin(5,3) = ( params.LF_shin * sin_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+( params.LF_shin * sin_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);
jacs.fr_trunk_J_LF_shin(6,1) = (- params.LF_shin * sin_q_LF_HAA * sin_q_LF_HFE * sin_q_LF_KFE)+( params.LF_shin * sin_q_LF_HAA * cos_q_LF_HFE * cos_q_LF_KFE)+( consts.tx_LF_KFE * sin_q_LF_HAA * cos_q_LF_HFE)+( consts.tx_LF_HFE * sin_q_LF_HAA);
jacs.fr_trunk_J_LF_shin(6,2) = ( params.LF_shin * cos_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+( params.LF_shin * cos_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE)+( consts.tx_LF_KFE * cos_q_LF_HAA * sin_q_LF_HFE);
jacs.fr_trunk_J_LF_shin(6,3) = ( params.LF_shin * cos_q_LF_HAA * cos_q_LF_HFE * sin_q_LF_KFE)+( params.LF_shin * cos_q_LF_HAA * sin_q_LF_HFE * cos_q_LF_KFE);

sin_q_RF_HAA = sin( q(4));
cos_q_RF_HAA = cos( q(4));
sin_q_RF_HFE = sin( q(5));
cos_q_RF_HFE = cos( q(5));
sin_q_RF_KFE = sin( q(6));
cos_q_RF_KFE = cos( q(6));
jacs.fr_trunk_J_RF_shin(2,2) = cos_q_RF_HAA;
jacs.fr_trunk_J_RF_shin(2,3) = cos_q_RF_HAA;
jacs.fr_trunk_J_RF_shin(3,2) = sin_q_RF_HAA;
jacs.fr_trunk_J_RF_shin(3,3) = sin_q_RF_HAA;
jacs.fr_trunk_J_RF_shin(4,2) = ( params.RF_shin * sin_q_RF_HFE * sin_q_RF_KFE)-( params.RF_shin * cos_q_RF_HFE * cos_q_RF_KFE)-( consts.tx_RF_KFE * cos_q_RF_HFE);
jacs.fr_trunk_J_RF_shin(4,3) = ( params.RF_shin * sin_q_RF_HFE * sin_q_RF_KFE)-( params.RF_shin * cos_q_RF_HFE * cos_q_RF_KFE);
jacs.fr_trunk_J_RF_shin(5,1) = (- params.RF_shin * cos_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)+( params.RF_shin * cos_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)+( consts.tx_RF_KFE * cos_q_RF_HAA * cos_q_RF_HFE)+( consts.tx_RF_HFE * cos_q_RF_HAA);
jacs.fr_trunk_J_RF_shin(5,2) = (- params.RF_shin * sin_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)-( params.RF_shin * sin_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE)-( consts.tx_RF_KFE * sin_q_RF_HAA * sin_q_RF_HFE);
jacs.fr_trunk_J_RF_shin(5,3) = (- params.RF_shin * sin_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)-( params.RF_shin * sin_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);
jacs.fr_trunk_J_RF_shin(6,1) = (- params.RF_shin * sin_q_RF_HAA * sin_q_RF_HFE * sin_q_RF_KFE)+( params.RF_shin * sin_q_RF_HAA * cos_q_RF_HFE * cos_q_RF_KFE)+( consts.tx_RF_KFE * sin_q_RF_HAA * cos_q_RF_HFE)+( consts.tx_RF_HFE * sin_q_RF_HAA);
jacs.fr_trunk_J_RF_shin(6,2) = ( params.RF_shin * cos_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)+( params.RF_shin * cos_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE)+( consts.tx_RF_KFE * cos_q_RF_HAA * sin_q_RF_HFE);
jacs.fr_trunk_J_RF_shin(6,3) = ( params.RF_shin * cos_q_RF_HAA * cos_q_RF_HFE * sin_q_RF_KFE)+( params.RF_shin * cos_q_RF_HAA * sin_q_RF_HFE * cos_q_RF_KFE);

sin_q_LH_HAA = sin( q(7));
cos_q_LH_HAA = cos( q(7));
sin_q_LH_HFE = sin( q(8));
cos_q_LH_HFE = cos( q(8));
sin_q_LH_KFE = sin( q(9));
cos_q_LH_KFE = cos( q(9));
jacs.fr_trunk_J_LH_shin(2,2) = cos_q_LH_HAA;
jacs.fr_trunk_J_LH_shin(2,3) = cos_q_LH_HAA;
jacs.fr_trunk_J_LH_shin(3,2) = -sin_q_LH_HAA;
jacs.fr_trunk_J_LH_shin(3,3) = -sin_q_LH_HAA;
jacs.fr_trunk_J_LH_shin(4,2) = ( params.LH_shin * sin_q_LH_HFE * sin_q_LH_KFE)-( params.LH_shin * cos_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * cos_q_LH_HFE);
jacs.fr_trunk_J_LH_shin(4,3) = ( params.LH_shin * sin_q_LH_HFE * sin_q_LH_KFE)-( params.LH_shin * cos_q_LH_HFE * cos_q_LH_KFE);
jacs.fr_trunk_J_LH_shin(5,1) = ( params.LH_shin * cos_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)-( params.LH_shin * cos_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)-( consts.tx_LH_KFE * cos_q_LH_HAA * cos_q_LH_HFE)-( consts.tx_LH_HFE * cos_q_LH_HAA);
jacs.fr_trunk_J_LH_shin(5,2) = ( params.LH_shin * sin_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+( params.LH_shin * sin_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE)+( consts.tx_LH_KFE * sin_q_LH_HAA * sin_q_LH_HFE);
jacs.fr_trunk_J_LH_shin(5,3) = ( params.LH_shin * sin_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+( params.LH_shin * sin_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);
jacs.fr_trunk_J_LH_shin(6,1) = (- params.LH_shin * sin_q_LH_HAA * sin_q_LH_HFE * sin_q_LH_KFE)+( params.LH_shin * sin_q_LH_HAA * cos_q_LH_HFE * cos_q_LH_KFE)+( consts.tx_LH_KFE * sin_q_LH_HAA * cos_q_LH_HFE)+( consts.tx_LH_HFE * sin_q_LH_HAA);
jacs.fr_trunk_J_LH_shin(6,2) = ( params.LH_shin * cos_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+( params.LH_shin * cos_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE)+( consts.tx_LH_KFE * cos_q_LH_HAA * sin_q_LH_HFE);
jacs.fr_trunk_J_LH_shin(6,3) = ( params.LH_shin * cos_q_LH_HAA * cos_q_LH_HFE * sin_q_LH_KFE)+( params.LH_shin * cos_q_LH_HAA * sin_q_LH_HFE * cos_q_LH_KFE);

sin_q_RH_HAA = sin( q(10));
cos_q_RH_HAA = cos( q(10));
sin_q_RH_HFE = sin( q(11));
cos_q_RH_HFE = cos( q(11));
sin_q_RH_KFE = sin( q(12));
cos_q_RH_KFE = cos( q(12));
jacs.fr_trunk_J_RH_shin(2,2) = cos_q_RH_HAA;
jacs.fr_trunk_J_RH_shin(2,3) = cos_q_RH_HAA;
jacs.fr_trunk_J_RH_shin(3,2) = sin_q_RH_HAA;
jacs.fr_trunk_J_RH_shin(3,3) = sin_q_RH_HAA;
jacs.fr_trunk_J_RH_shin(4,2) = ( params.RH_shin * sin_q_RH_HFE * sin_q_RH_KFE)-( params.RH_shin * cos_q_RH_HFE * cos_q_RH_KFE)-( consts.tx_RH_KFE * cos_q_RH_HFE);
jacs.fr_trunk_J_RH_shin(4,3) = ( params.RH_shin * sin_q_RH_HFE * sin_q_RH_KFE)-( params.RH_shin * cos_q_RH_HFE * cos_q_RH_KFE);
jacs.fr_trunk_J_RH_shin(5,1) = (- params.RH_shin * cos_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)+( params.RH_shin * cos_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)+( consts.tx_RH_KFE * cos_q_RH_HAA * cos_q_RH_HFE)+( consts.tx_RH_HFE * cos_q_RH_HAA);
jacs.fr_trunk_J_RH_shin(5,2) = (- params.RH_shin * sin_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)-( params.RH_shin * sin_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE)-( consts.tx_RH_KFE * sin_q_RH_HAA * sin_q_RH_HFE);
jacs.fr_trunk_J_RH_shin(5,3) = (- params.RH_shin * sin_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)-( params.RH_shin * sin_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);
jacs.fr_trunk_J_RH_shin(6,1) = (- params.RH_shin * sin_q_RH_HAA * sin_q_RH_HFE * sin_q_RH_KFE)+( params.RH_shin * sin_q_RH_HAA * cos_q_RH_HFE * cos_q_RH_KFE)+( consts.tx_RH_KFE * sin_q_RH_HAA * cos_q_RH_HFE)+( consts.tx_RH_HFE * sin_q_RH_HAA);
jacs.fr_trunk_J_RH_shin(6,2) = ( params.RH_shin * cos_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)+( params.RH_shin * cos_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE)+( consts.tx_RH_KFE * cos_q_RH_HAA * sin_q_RH_HFE);
jacs.fr_trunk_J_RH_shin(6,3) = ( params.RH_shin * cos_q_RH_HAA * cos_q_RH_HFE * sin_q_RH_KFE)+( params.RH_shin * cos_q_RH_HAA * sin_q_RH_HFE * cos_q_RH_KFE);


assignin('base', 'jacs',jacs)



out = jacs;

