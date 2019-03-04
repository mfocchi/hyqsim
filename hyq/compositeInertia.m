function ci = compositeInertia(ip, xf, transformsType)

% Computes the spatial composite inertia of each link of the robot.
% Arguments:
% - ip : the structure with the inertia properties
% - xf : the structure with the spatial coordinate transformation matrices
% - transformsType : a string specifying which is the type of the given
%      coordinate transforms, either velocity ('motion') or force ('force').
%      Optional argument, default is 'force'.

if nargin < 3
    transformsType = 'force';
end

%
% Initialization of the composite-inertia matrices
%
ci.LF_hipassembly_Ic = ip.lf_LF_hipassembly.tensor6D;
ci.LF_upperleg_Ic = ip.lf_LF_upperleg.tensor6D;
ci.LF_lowerleg_Ic = ip.lf_LF_lowerleg.tensor6D;
ci.RF_hipassembly_Ic = ip.lf_RF_hipassembly.tensor6D;
ci.RF_upperleg_Ic = ip.lf_RF_upperleg.tensor6D;
ci.RF_lowerleg_Ic = ip.lf_RF_lowerleg.tensor6D;
ci.LH_hipassembly_Ic = ip.lf_LH_hipassembly.tensor6D;
ci.LH_upperleg_Ic = ip.lf_LH_upperleg.tensor6D;
ci.LH_lowerleg_Ic = ip.lf_LH_lowerleg.tensor6D;
ci.RH_hipassembly_Ic = ip.lf_RH_hipassembly.tensor6D;
ci.RH_upperleg_Ic = ip.lf_RH_upperleg.tensor6D;
ci.RH_lowerleg_Ic = ip.lf_RH_lowerleg.tensor6D;
ci.trunk_Ic = ip.lf_trunk.tensor6D;

%
% Leafs-to-root pass to update the composite inertia of
%     each link, for the current configuration:
%

if strcmp(transformsType, 'motion')  % we have transforms for motion vectors

% Contribution of link RH_lowerleg
ci.RH_upperleg_Ic = ci.RH_upperleg_Ic + xf.fr_RH_lowerleg_XM_fr_RH_upperleg' * ci.RH_lowerleg_Ic * xf.fr_RH_lowerleg_XM_fr_RH_upperleg;


% Contribution of link RH_upperleg
ci.RH_hipassembly_Ic = ci.RH_hipassembly_Ic + xf.fr_RH_upperleg_XM_fr_RH_hipassembly' * ci.RH_upperleg_Ic * xf.fr_RH_upperleg_XM_fr_RH_hipassembly;


% Contribution of link RH_hipassembly
ci.trunk_Ic = ci.trunk_Ic + xf.fr_RH_hipassembly_XM_fr_trunk' * ci.RH_hipassembly_Ic * xf.fr_RH_hipassembly_XM_fr_trunk;


% Contribution of link LH_lowerleg
ci.LH_upperleg_Ic = ci.LH_upperleg_Ic + xf.fr_LH_lowerleg_XM_fr_LH_upperleg' * ci.LH_lowerleg_Ic * xf.fr_LH_lowerleg_XM_fr_LH_upperleg;


% Contribution of link LH_upperleg
ci.LH_hipassembly_Ic = ci.LH_hipassembly_Ic + xf.fr_LH_upperleg_XM_fr_LH_hipassembly' * ci.LH_upperleg_Ic * xf.fr_LH_upperleg_XM_fr_LH_hipassembly;


% Contribution of link LH_hipassembly
ci.trunk_Ic = ci.trunk_Ic + xf.fr_LH_hipassembly_XM_fr_trunk' * ci.LH_hipassembly_Ic * xf.fr_LH_hipassembly_XM_fr_trunk;


% Contribution of link RF_lowerleg
ci.RF_upperleg_Ic = ci.RF_upperleg_Ic + xf.fr_RF_lowerleg_XM_fr_RF_upperleg' * ci.RF_lowerleg_Ic * xf.fr_RF_lowerleg_XM_fr_RF_upperleg;


% Contribution of link RF_upperleg
ci.RF_hipassembly_Ic = ci.RF_hipassembly_Ic + xf.fr_RF_upperleg_XM_fr_RF_hipassembly' * ci.RF_upperleg_Ic * xf.fr_RF_upperleg_XM_fr_RF_hipassembly;


% Contribution of link RF_hipassembly
ci.trunk_Ic = ci.trunk_Ic + xf.fr_RF_hipassembly_XM_fr_trunk' * ci.RF_hipassembly_Ic * xf.fr_RF_hipassembly_XM_fr_trunk;


% Contribution of link LF_lowerleg
ci.LF_upperleg_Ic = ci.LF_upperleg_Ic + xf.fr_LF_lowerleg_XM_fr_LF_upperleg' * ci.LF_lowerleg_Ic * xf.fr_LF_lowerleg_XM_fr_LF_upperleg;


% Contribution of link LF_upperleg
ci.LF_hipassembly_Ic = ci.LF_hipassembly_Ic + xf.fr_LF_upperleg_XM_fr_LF_hipassembly' * ci.LF_upperleg_Ic * xf.fr_LF_upperleg_XM_fr_LF_hipassembly;


% Contribution of link LF_hipassembly
ci.trunk_Ic = ci.trunk_Ic + xf.fr_LF_hipassembly_XM_fr_trunk' * ci.LF_hipassembly_Ic * xf.fr_LF_hipassembly_XM_fr_trunk;


else % we have transforms for force vectors

% Contribution of link RH_lowerleg
ci.RH_upperleg_Ic = ci.RH_upperleg_Ic + xf.fr_RH_upperleg_XF_fr_RH_lowerleg * ci.RH_lowerleg_Ic * xf.fr_RH_upperleg_XF_fr_RH_lowerleg';


% Contribution of link RH_upperleg
ci.RH_hipassembly_Ic = ci.RH_hipassembly_Ic + xf.fr_RH_hipassembly_XF_fr_RH_upperleg * ci.RH_upperleg_Ic * xf.fr_RH_hipassembly_XF_fr_RH_upperleg';


% Contribution of link RH_hipassembly
ci.trunk_Ic = ci.trunk_Ic + xf.fr_trunk_XF_fr_RH_hipassembly * ci.RH_hipassembly_Ic * xf.fr_trunk_XF_fr_RH_hipassembly';


% Contribution of link LH_lowerleg
ci.LH_upperleg_Ic = ci.LH_upperleg_Ic + xf.fr_LH_upperleg_XF_fr_LH_lowerleg * ci.LH_lowerleg_Ic * xf.fr_LH_upperleg_XF_fr_LH_lowerleg';


% Contribution of link LH_upperleg
ci.LH_hipassembly_Ic = ci.LH_hipassembly_Ic + xf.fr_LH_hipassembly_XF_fr_LH_upperleg * ci.LH_upperleg_Ic * xf.fr_LH_hipassembly_XF_fr_LH_upperleg';


% Contribution of link LH_hipassembly
ci.trunk_Ic = ci.trunk_Ic + xf.fr_trunk_XF_fr_LH_hipassembly * ci.LH_hipassembly_Ic * xf.fr_trunk_XF_fr_LH_hipassembly';


% Contribution of link RF_lowerleg
ci.RF_upperleg_Ic = ci.RF_upperleg_Ic + xf.fr_RF_upperleg_XF_fr_RF_lowerleg * ci.RF_lowerleg_Ic * xf.fr_RF_upperleg_XF_fr_RF_lowerleg';


% Contribution of link RF_upperleg
ci.RF_hipassembly_Ic = ci.RF_hipassembly_Ic + xf.fr_RF_hipassembly_XF_fr_RF_upperleg * ci.RF_upperleg_Ic * xf.fr_RF_hipassembly_XF_fr_RF_upperleg';


% Contribution of link RF_hipassembly
ci.trunk_Ic = ci.trunk_Ic + xf.fr_trunk_XF_fr_RF_hipassembly * ci.RF_hipassembly_Ic * xf.fr_trunk_XF_fr_RF_hipassembly';


% Contribution of link LF_lowerleg
ci.LF_upperleg_Ic = ci.LF_upperleg_Ic + xf.fr_LF_upperleg_XF_fr_LF_lowerleg * ci.LF_lowerleg_Ic * xf.fr_LF_upperleg_XF_fr_LF_lowerleg';


% Contribution of link LF_upperleg
ci.LF_hipassembly_Ic = ci.LF_hipassembly_Ic + xf.fr_LF_hipassembly_XF_fr_LF_upperleg * ci.LF_upperleg_Ic * xf.fr_LF_hipassembly_XF_fr_LF_upperleg';


% Contribution of link LF_hipassembly
ci.trunk_Ic = ci.trunk_Ic + xf.fr_trunk_XF_fr_LF_hipassembly * ci.LF_hipassembly_Ic * xf.fr_trunk_XF_fr_LF_hipassembly';

assignin('base', 'ci',ci)
end
