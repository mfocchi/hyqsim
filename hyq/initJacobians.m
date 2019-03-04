function jacs = initJacobians()

consts = evalin('base', 'consts');
jacs.fr_trunk_J_LF_foot = zeros(6,3);
jacs.fr_trunk_J_LF_foot(1,1) = -1.0;
jacs.fr_trunk_J_LF_foot(1,2) = 0.0;
jacs.fr_trunk_J_LF_foot(1,3) = 0.0;
jacs.fr_trunk_J_LF_foot(2,1) = 0.0;
jacs.fr_trunk_J_LF_foot(3,1) = 0.0;
jacs.fr_trunk_J_LF_foot(4,1) = 0.0;

jacs.fr_trunk_J_RF_foot = zeros(6,3);
jacs.fr_trunk_J_RF_foot(1,1) = 1.0;
jacs.fr_trunk_J_RF_foot(1,2) = 0.0;
jacs.fr_trunk_J_RF_foot(1,3) = 0.0;
jacs.fr_trunk_J_RF_foot(2,1) = 0.0;
jacs.fr_trunk_J_RF_foot(3,1) = 0.0;
jacs.fr_trunk_J_RF_foot(4,1) = 0.0;

jacs.fr_trunk_J_LH_foot = zeros(6,3);
jacs.fr_trunk_J_LH_foot(1,1) = -1.0;
jacs.fr_trunk_J_LH_foot(1,2) = 0.0;
jacs.fr_trunk_J_LH_foot(1,3) = 0.0;
jacs.fr_trunk_J_LH_foot(2,1) = 0.0;
jacs.fr_trunk_J_LH_foot(3,1) = 0.0;
jacs.fr_trunk_J_LH_foot(4,1) = 0.0;

jacs.fr_trunk_J_RH_foot = zeros(6,3);
jacs.fr_trunk_J_RH_foot(1,1) = 1.0;
jacs.fr_trunk_J_RH_foot(1,2) = 0.0;
jacs.fr_trunk_J_RH_foot(1,3) = 0.0;
jacs.fr_trunk_J_RH_foot(2,1) = 0.0;
jacs.fr_trunk_J_RH_foot(3,1) = 0.0;
jacs.fr_trunk_J_RH_foot(4,1) = 0.0;


jacs.fr_trunk_J_RF_shin = zeros(6,3);
jacs.fr_trunk_J_RF_shin(1,1) = 1.0;
jacs.fr_trunk_J_RF_shin(1,2) = 0.0;
jacs.fr_trunk_J_RF_shin(1,3) = 0.0;
jacs.fr_trunk_J_RF_shin(2,1) = 0.0;
jacs.fr_trunk_J_RF_shin(3,1) = 0.0;
jacs.fr_trunk_J_RF_shin(4,1) = 0.0;

jacs.fr_trunk_J_LH_shin = zeros(6,3);
jacs.fr_trunk_J_LH_shin(1,1) = -1.0;
jacs.fr_trunk_J_LH_shin(1,2) = 0.0;
jacs.fr_trunk_J_LH_shin(1,3) = 0.0;
jacs.fr_trunk_J_LH_shin(2,1) = 0.0;
jacs.fr_trunk_J_LH_shin(3,1) = 0.0;
jacs.fr_trunk_J_LH_shin(4,1) = 0.0;

jacs.fr_trunk_J_RH_shin = zeros(6,3);
jacs.fr_trunk_J_RH_shin(1,1) = 1.0;
jacs.fr_trunk_J_RH_shin(1,2) = 0.0;
jacs.fr_trunk_J_RH_shin(1,3) = 0.0;
jacs.fr_trunk_J_RH_shin(2,1) = 0.0;
jacs.fr_trunk_J_RH_shin(3,1) = 0.0;
jacs.fr_trunk_J_RH_shin(4,1) = 0.0;


assignin('base', 'jacs',jacs)
end
