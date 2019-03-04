function [qdd trunk_a] = forwardDynamics(trunk_v, gravity, qd, tau, grForcesB, fixedbase)

utility = evalin('base', 'utility');

ht = evalin('base', 'ht');

ft = evalin('base', 'ft');

xm = evalin('base', 'mt');

ip = evalin('base', 'ip');
%check the inputs are column vectors 
trunk_v = trunk_v(:);
gravity = gravity(:);

%init to zero
fext{1} = zeros(6,1);
fext{2} = zeros(6,1);
fext{3} = zeros(6,1);
fext{4} = zeros(6,1);
fext{5} = zeros(6,1);
fext{6} = zeros(6,1);
fext{7} = zeros(6,1);
fext{8} = zeros(6,1);
fext{9} = zeros(6,1);
fext{10} = zeros(6,1);
fext{11} = zeros(6,1);
fext{12} = zeros(6,1);
fext{13} = zeros(6,1);

%alternative way
%lowerleg LF
%compute wrench at trunk frame due to grforces
% grf_wrench(1:3,1) =  cross_mx(utility.getPosition( ht.LF_foot_Xh_fr_trunk)) * getLegData('LF',grForcesB);
% grf_wrench(4:6,1) =  getLegData('LF',grForcesB);
% %apply shifting law to get the wrench in the lowerleg frame
% fext{4} = ft.fr_LF_lowerleg_XF_fr_trunk*grf_wrench;
%            
% %lowerleg RF
% %compute wrench at trunk frame due to grforces
% grf_wrench(1:3,1) =  cross_mx(utility.getPosition( ht.RF_foot_Xh_fr_trunk)) * getLegData('RF',grForcesB);
% grf_wrench(4:6,1) =  getLegData('RF',grForcesB);
% %apply shifting law to get the wrench in the lowerleg frame
% fext{7} = ft.fr_RF_lowerleg_XF_fr_trunk*grf_wrench;
% 
% %lowerleg RF
% %compute wrench at trunk frame due to grforces
% grf_wrench(1:3,1) =  cross_mx(utility.getPosition( ht.LH_foot_Xh_fr_trunk)) * getLegData('LH',grForcesB);
% grf_wrench(4:6,1) =  getLegData('LH',grForcesB);
% %apply shifting law to get the wrench in the lowerleg frame
% fext{10} = ft.fr_LH_lowerleg_XF_fr_trunk*grf_wrench;
% 
% %lowerleg RH
% %compute wrench at trunk frame due to grforces
% grf_wrench(1:3,1) =  cross_mx(utility.getPosition( ht.RH_foot_Xh_fr_trunk)) * getLegData('RH',grForcesB);
% grf_wrench(4:6,1) =  getLegData('RH',grForcesB);
% %apply shifting law to get the wrench in the lowerleg frame
% fext{13} = ft.fr_RH_lowerleg_XF_fr_trunk*grf_wrench;

%way suggested by Marco Frigerio
%lowerleg LF
%express contact wrench in foot frame
grf_wrench(1:3,1) =  zeros(3,1); %no moment at the foot
grf_wrench(4:6,1) =  utility.getRotation(ht.LF_foot_Xh_fr_trunk)*getLegData('LF',grForcesB); %rotate force in foot frame
%apply shifting law to get the wrench in the lowerleg frame
fext{4} = ft.fr_LF_lowerleg_XF_LF_foot*grf_wrench;
           
%lowerleg RF
%compute wrench at trunk frame due to grforces
grf_wrench(1:3,1) =  zeros(3,1); %no moment at the foot
grf_wrench(4:6,1) =  utility.getRotation(ht.RF_foot_Xh_fr_trunk)*getLegData('RF',grForcesB); %rotate force in foot frame
%apply shifting law to get the wrench in the lowerleg frame
fext{7} = ft.fr_RF_lowerleg_XF_RF_foot*grf_wrench;

%lowerleg LH
%compute wrench at trunk frame due to grforces
grf_wrench(1:3,1) =  zeros(3,1); %no moment at the foot
grf_wrench(4:6,1) =  utility.getRotation(ht.LH_foot_Xh_fr_trunk)*getLegData('LH',grForcesB); %rotate force in foot frame
%apply shifting law to get the wrench in the lowerleg frame
fext{10} = ft.fr_LH_lowerleg_XF_LH_foot*grf_wrench;

%lowerleg RH
grf_wrench(1:3,1) =  zeros(3,1); %no moment at the foot
grf_wrench(4:6,1) =  utility.getRotation(ht.RH_foot_Xh_fr_trunk)*getLegData('RH',grForcesB); %rotate force in foot frame
%apply shifting law to get the wrench in the lowerleg frame
fext{13} = ft.fr_RH_lowerleg_XF_RH_foot*grf_wrench;

%debug should be static
if (fixedbase)
 Ic_trunk = evalin('base', 'Ic_trunk');
 fext{1} = -Ic_trunk*gravity;
end
 
qdd = zeros(12,1);
trunk_AI = ip.lf_trunk.tensor6D;
LF_hipassembly_AI = ip.lf_LF_hipassembly.tensor6D;
LF_upperleg_AI = ip.lf_LF_upperleg.tensor6D;
LF_lowerleg_AI = ip.lf_LF_lowerleg.tensor6D;
RF_hipassembly_AI = ip.lf_RF_hipassembly.tensor6D;
RF_upperleg_AI = ip.lf_RF_upperleg.tensor6D;
RF_lowerleg_AI = ip.lf_RF_lowerleg.tensor6D;
LH_hipassembly_AI = ip.lf_LH_hipassembly.tensor6D;
LH_upperleg_AI = ip.lf_LH_upperleg.tensor6D;
LH_lowerleg_AI = ip.lf_LH_lowerleg.tensor6D;
RH_hipassembly_AI = ip.lf_RH_hipassembly.tensor6D;
RH_upperleg_AI = ip.lf_RH_upperleg.tensor6D;
RH_lowerleg_AI = ip.lf_RH_lowerleg.tensor6D;
if nargin > 4
    trunk_p = - fext{1};
    LF_hipassembly_p = - fext{2};
    LF_upperleg_p = - fext{3};
    LF_lowerleg_p = - fext{4};
    RF_hipassembly_p = - fext{5};
    RF_upperleg_p = - fext{6};
    RF_lowerleg_p = - fext{7};
    LH_hipassembly_p = - fext{8};
    LH_upperleg_p = - fext{9};
    LH_lowerleg_p = - fext{10};
    RH_hipassembly_p = - fext{11};
    RH_upperleg_p = - fext{12};
    RH_lowerleg_p = - fext{13};
else
    trunk_p = zeros(6,1);
    LF_hipassembly_p = zeros(6,1);
    LF_upperleg_p = zeros(6,1);
    LF_lowerleg_p = zeros(6,1);
    RF_hipassembly_p = zeros(6,1);
    RF_upperleg_p = zeros(6,1);
    RF_lowerleg_p = zeros(6,1);
    LH_hipassembly_p = zeros(6,1);
    LH_upperleg_p = zeros(6,1);
    LH_lowerleg_p = zeros(6,1);
    RH_hipassembly_p = zeros(6,1);
    RH_upperleg_p = zeros(6,1);
    RH_lowerleg_p = zeros(6,1);
end


%celldisp(fext) 
%% ---------------------- FIRST PASS ----------------------
%% Note that, during the first pass, the articulated inertias are really
%% just the spatial inertia of the links (see assignments above).
%%  Afterwards things change, and articulated inertias shall not be used
%%  in functions which work specifically with spatial inertias.

LF_hipassembly_v = (xm.fr_LF_hipassembly_XM_fr_trunk) * trunk_v;
LF_hipassembly_v(3) = LF_hipassembly_v(3) + qd(1);

vcross = vcross_mx(LF_hipassembly_v);
LF_hipassembly_c = vcross(:,3) * qd(1);
LF_hipassembly_p = LF_hipassembly_p + -vcross' * LF_hipassembly_AI * LF_hipassembly_v; %%% vxIv(LF_hipassembly_v, LF_hipassembly_AI);

LF_upperleg_v = (xm.fr_LF_upperleg_XM_fr_LF_hipassembly) * LF_hipassembly_v;
LF_upperleg_v(3) = LF_upperleg_v(3) + qd(2);

vcross = vcross_mx(LF_upperleg_v);
LF_upperleg_c = vcross(:,3) * qd(2);
LF_upperleg_p = LF_upperleg_p + -vcross' * LF_upperleg_AI * LF_upperleg_v; %%% vxIv(LF_upperleg_v, LF_upperleg_AI);

LF_lowerleg_v = (xm.fr_LF_lowerleg_XM_fr_LF_upperleg) * LF_upperleg_v;
LF_lowerleg_v(3) = LF_lowerleg_v(3) + qd(3);

vcross = vcross_mx(LF_lowerleg_v);
LF_lowerleg_c = vcross(:,3) * qd(3);
LF_lowerleg_p = LF_lowerleg_p + -vcross' * LF_lowerleg_AI * LF_lowerleg_v; %%% vxIv(LF_lowerleg_v, LF_lowerleg_AI);

RF_hipassembly_v = (xm.fr_RF_hipassembly_XM_fr_trunk) * trunk_v;
RF_hipassembly_v(3) = RF_hipassembly_v(3) + qd(4);

vcross = vcross_mx(RF_hipassembly_v);
RF_hipassembly_c = vcross(:,3) * qd(4);
RF_hipassembly_p = RF_hipassembly_p + -vcross' * RF_hipassembly_AI * RF_hipassembly_v; %%% vxIv(RF_hipassembly_v, RF_hipassembly_AI);

RF_upperleg_v = (xm.fr_RF_upperleg_XM_fr_RF_hipassembly) * RF_hipassembly_v;
RF_upperleg_v(3) = RF_upperleg_v(3) + qd(5);

vcross = vcross_mx(RF_upperleg_v);
RF_upperleg_c = vcross(:,3) * qd(5);
RF_upperleg_p = RF_upperleg_p + -vcross' * RF_upperleg_AI * RF_upperleg_v; %%% vxIv(RF_upperleg_v, RF_upperleg_AI);

RF_lowerleg_v = (xm.fr_RF_lowerleg_XM_fr_RF_upperleg) * RF_upperleg_v;
RF_lowerleg_v(3) = RF_lowerleg_v(3) + qd(6);

vcross = vcross_mx(RF_lowerleg_v);
RF_lowerleg_c = vcross(:,3) * qd(6);
RF_lowerleg_p = RF_lowerleg_p + -vcross' * RF_lowerleg_AI * RF_lowerleg_v; %%% vxIv(RF_lowerleg_v, RF_lowerleg_AI);

LH_hipassembly_v = (xm.fr_LH_hipassembly_XM_fr_trunk) * trunk_v;
LH_hipassembly_v(3) = LH_hipassembly_v(3) + qd(7);

vcross = vcross_mx(LH_hipassembly_v);
LH_hipassembly_c = vcross(:,3) * qd(7);
LH_hipassembly_p = LH_hipassembly_p + -vcross' * LH_hipassembly_AI * LH_hipassembly_v; %%% vxIv(LH_hipassembly_v, LH_hipassembly_AI);

LH_upperleg_v = (xm.fr_LH_upperleg_XM_fr_LH_hipassembly) * LH_hipassembly_v;
LH_upperleg_v(3) = LH_upperleg_v(3) + qd(8);

vcross = vcross_mx(LH_upperleg_v);
LH_upperleg_c = vcross(:,3) * qd(8);
LH_upperleg_p = LH_upperleg_p + -vcross' * LH_upperleg_AI * LH_upperleg_v; %%% vxIv(LH_upperleg_v, LH_upperleg_AI);

LH_lowerleg_v = (xm.fr_LH_lowerleg_XM_fr_LH_upperleg) * LH_upperleg_v;
LH_lowerleg_v(3) = LH_lowerleg_v(3) + qd(9);

vcross = vcross_mx(LH_lowerleg_v);
LH_lowerleg_c = vcross(:,3) * qd(9);
LH_lowerleg_p = LH_lowerleg_p + -vcross' * LH_lowerleg_AI * LH_lowerleg_v; %%% vxIv(LH_lowerleg_v, LH_lowerleg_AI);

RH_hipassembly_v = (xm.fr_RH_hipassembly_XM_fr_trunk) * trunk_v;
RH_hipassembly_v(3) = RH_hipassembly_v(3) + qd(10);

vcross = vcross_mx(RH_hipassembly_v);
RH_hipassembly_c = vcross(:,3) * qd(10);
RH_hipassembly_p = RH_hipassembly_p + -vcross' * RH_hipassembly_AI * RH_hipassembly_v; %%% vxIv(RH_hipassembly_v, RH_hipassembly_AI);

RH_upperleg_v = (xm.fr_RH_upperleg_XM_fr_RH_hipassembly) * RH_hipassembly_v;
RH_upperleg_v(3) = RH_upperleg_v(3) + qd(11);

vcross = vcross_mx(RH_upperleg_v);
RH_upperleg_c = vcross(:,3) * qd(11);
RH_upperleg_p = RH_upperleg_p + -vcross' * RH_upperleg_AI * RH_upperleg_v; %%% vxIv(RH_upperleg_v, RH_upperleg_AI);

RH_lowerleg_v = (xm.fr_RH_lowerleg_XM_fr_RH_upperleg) * RH_upperleg_v;
RH_lowerleg_v(3) = RH_lowerleg_v(3) + qd(12);

vcross = vcross_mx(RH_lowerleg_v);
RH_lowerleg_c = vcross(:,3) * qd(12);
RH_lowerleg_p = RH_lowerleg_p + -vcross' * RH_lowerleg_AI * RH_lowerleg_v; %%% vxIv(RH_lowerleg_v, RH_lowerleg_AI);

vcross = vcross_mx(trunk_v);
trunk_p = trunk_p + -vcross' * trunk_AI * trunk_v;

%% ---------------------- SECOND PASS ----------------------
IaB = zeros(6,6);
pa  = zeros(6,1);

RH_lowerleg_u = tau(12) - RH_lowerleg_p(3);
RH_lowerleg_U = RH_lowerleg_AI(:,3);
RH_lowerleg_D = RH_lowerleg_U(3);

Ia_r = RH_lowerleg_AI - RH_lowerleg_U/RH_lowerleg_D * RH_lowerleg_U';
pa = RH_lowerleg_p + Ia_r * RH_lowerleg_c + RH_lowerleg_U * RH_lowerleg_u/RH_lowerleg_D;
IaB = xm.fr_RH_lowerleg_XM_fr_RH_upperleg' * Ia_r * xm.fr_RH_lowerleg_XM_fr_RH_upperleg;          %%ctransform_Ia_revolute(Ia_r, xm.fr_RH_lowerleg_XM_fr_RH_upperleg, IaB);
RH_upperleg_AI = RH_upperleg_AI + IaB;
RH_upperleg_p = RH_upperleg_p + (xm.fr_RH_lowerleg_XM_fr_RH_upperleg)' * pa;

RH_upperleg_u = tau(11) - RH_upperleg_p(3);
RH_upperleg_U = RH_upperleg_AI(:,3);
RH_upperleg_D = RH_upperleg_U(3);

Ia_r = RH_upperleg_AI - RH_upperleg_U/RH_upperleg_D * RH_upperleg_U';
pa = RH_upperleg_p + Ia_r * RH_upperleg_c + RH_upperleg_U * RH_upperleg_u/RH_upperleg_D;
IaB = xm.fr_RH_upperleg_XM_fr_RH_hipassembly' * Ia_r * xm.fr_RH_upperleg_XM_fr_RH_hipassembly;          %%ctransform_Ia_revolute(Ia_r, xm.fr_RH_upperleg_XM_fr_RH_hipassembly, IaB);
RH_hipassembly_AI = RH_hipassembly_AI + IaB;
RH_hipassembly_p = RH_hipassembly_p + (xm.fr_RH_upperleg_XM_fr_RH_hipassembly)' * pa;

RH_hipassembly_u = tau(10) - RH_hipassembly_p(3);
RH_hipassembly_U = RH_hipassembly_AI(:,3);
RH_hipassembly_D = RH_hipassembly_U(3);

Ia_r = RH_hipassembly_AI - RH_hipassembly_U/RH_hipassembly_D * RH_hipassembly_U';
pa = RH_hipassembly_p + Ia_r * RH_hipassembly_c + RH_hipassembly_U * RH_hipassembly_u/RH_hipassembly_D;
IaB = xm.fr_RH_hipassembly_XM_fr_trunk' * Ia_r * xm.fr_RH_hipassembly_XM_fr_trunk;          %%ctransform_Ia_revolute(Ia_r, xm.fr_RH_hipassembly_XM_fr_trunk, IaB);
trunk_AI = trunk_AI + IaB;
trunk_p = trunk_p + (xm.fr_RH_hipassembly_XM_fr_trunk)' * pa;

LH_lowerleg_u = tau(9) - LH_lowerleg_p(3);
LH_lowerleg_U = LH_lowerleg_AI(:,3);
LH_lowerleg_D = LH_lowerleg_U(3);

Ia_r = LH_lowerleg_AI - LH_lowerleg_U/LH_lowerleg_D * LH_lowerleg_U';
pa = LH_lowerleg_p + Ia_r * LH_lowerleg_c + LH_lowerleg_U * LH_lowerleg_u/LH_lowerleg_D;
IaB = xm.fr_LH_lowerleg_XM_fr_LH_upperleg' * Ia_r * xm.fr_LH_lowerleg_XM_fr_LH_upperleg;          %%ctransform_Ia_revolute(Ia_r, xm.fr_LH_lowerleg_XM_fr_LH_upperleg, IaB);
LH_upperleg_AI = LH_upperleg_AI + IaB;
LH_upperleg_p = LH_upperleg_p + (xm.fr_LH_lowerleg_XM_fr_LH_upperleg)' * pa;

LH_upperleg_u = tau(8) - LH_upperleg_p(3);
LH_upperleg_U = LH_upperleg_AI(:,3);
LH_upperleg_D = LH_upperleg_U(3);

Ia_r = LH_upperleg_AI - LH_upperleg_U/LH_upperleg_D * LH_upperleg_U';
pa = LH_upperleg_p + Ia_r * LH_upperleg_c + LH_upperleg_U * LH_upperleg_u/LH_upperleg_D;
IaB = xm.fr_LH_upperleg_XM_fr_LH_hipassembly' * Ia_r * xm.fr_LH_upperleg_XM_fr_LH_hipassembly;          %%ctransform_Ia_revolute(Ia_r, xm.fr_LH_upperleg_XM_fr_LH_hipassembly, IaB);
LH_hipassembly_AI = LH_hipassembly_AI + IaB;
LH_hipassembly_p = LH_hipassembly_p + (xm.fr_LH_upperleg_XM_fr_LH_hipassembly)' * pa;

LH_hipassembly_u = tau(7) - LH_hipassembly_p(3);
LH_hipassembly_U = LH_hipassembly_AI(:,3);
LH_hipassembly_D = LH_hipassembly_U(3);

Ia_r = LH_hipassembly_AI - LH_hipassembly_U/LH_hipassembly_D * LH_hipassembly_U';
pa = LH_hipassembly_p + Ia_r * LH_hipassembly_c + LH_hipassembly_U * LH_hipassembly_u/LH_hipassembly_D;
IaB = xm.fr_LH_hipassembly_XM_fr_trunk' * Ia_r * xm.fr_LH_hipassembly_XM_fr_trunk;          %%ctransform_Ia_revolute(Ia_r, xm.fr_LH_hipassembly_XM_fr_trunk, IaB);
trunk_AI = trunk_AI + IaB;
trunk_p = trunk_p + (xm.fr_LH_hipassembly_XM_fr_trunk)' * pa;

RF_lowerleg_u = tau(6) - RF_lowerleg_p(3);
RF_lowerleg_U = RF_lowerleg_AI(:,3);
RF_lowerleg_D = RF_lowerleg_U(3);

Ia_r = RF_lowerleg_AI - RF_lowerleg_U/RF_lowerleg_D * RF_lowerleg_U';
pa = RF_lowerleg_p + Ia_r * RF_lowerleg_c + RF_lowerleg_U * RF_lowerleg_u/RF_lowerleg_D;
IaB = xm.fr_RF_lowerleg_XM_fr_RF_upperleg' * Ia_r * xm.fr_RF_lowerleg_XM_fr_RF_upperleg;          %%ctransform_Ia_revolute(Ia_r, xm.fr_RF_lowerleg_XM_fr_RF_upperleg, IaB);
RF_upperleg_AI = RF_upperleg_AI + IaB;
RF_upperleg_p = RF_upperleg_p + (xm.fr_RF_lowerleg_XM_fr_RF_upperleg)' * pa;

RF_upperleg_u = tau(5) - RF_upperleg_p(3);
RF_upperleg_U = RF_upperleg_AI(:,3);
RF_upperleg_D = RF_upperleg_U(3);

Ia_r = RF_upperleg_AI - RF_upperleg_U/RF_upperleg_D * RF_upperleg_U';
pa = RF_upperleg_p + Ia_r * RF_upperleg_c + RF_upperleg_U * RF_upperleg_u/RF_upperleg_D;
IaB = xm.fr_RF_upperleg_XM_fr_RF_hipassembly' * Ia_r * xm.fr_RF_upperleg_XM_fr_RF_hipassembly;          %%ctransform_Ia_revolute(Ia_r, xm.fr_RF_upperleg_XM_fr_RF_hipassembly, IaB);
RF_hipassembly_AI = RF_hipassembly_AI + IaB;
RF_hipassembly_p = RF_hipassembly_p + (xm.fr_RF_upperleg_XM_fr_RF_hipassembly)' * pa;

RF_hipassembly_u = tau(4) - RF_hipassembly_p(3);
RF_hipassembly_U = RF_hipassembly_AI(:,3);
RF_hipassembly_D = RF_hipassembly_U(3);

Ia_r = RF_hipassembly_AI - RF_hipassembly_U/RF_hipassembly_D * RF_hipassembly_U';
pa = RF_hipassembly_p + Ia_r * RF_hipassembly_c + RF_hipassembly_U * RF_hipassembly_u/RF_hipassembly_D;
IaB = xm.fr_RF_hipassembly_XM_fr_trunk' * Ia_r * xm.fr_RF_hipassembly_XM_fr_trunk;          %%ctransform_Ia_revolute(Ia_r, xm.fr_RF_hipassembly_XM_fr_trunk, IaB);
trunk_AI = trunk_AI + IaB;
trunk_p = trunk_p + (xm.fr_RF_hipassembly_XM_fr_trunk)' * pa;

LF_lowerleg_u = tau(3) - LF_lowerleg_p(3);
LF_lowerleg_U = LF_lowerleg_AI(:,3);
LF_lowerleg_D = LF_lowerleg_U(3);

Ia_r = LF_lowerleg_AI - LF_lowerleg_U/LF_lowerleg_D * LF_lowerleg_U';
pa = LF_lowerleg_p + Ia_r * LF_lowerleg_c + LF_lowerleg_U * LF_lowerleg_u/LF_lowerleg_D;
IaB = xm.fr_LF_lowerleg_XM_fr_LF_upperleg' * Ia_r * xm.fr_LF_lowerleg_XM_fr_LF_upperleg;          %%ctransform_Ia_revolute(Ia_r, xm.fr_LF_lowerleg_XM_fr_LF_upperleg, IaB);
LF_upperleg_AI = LF_upperleg_AI + IaB;
LF_upperleg_p = LF_upperleg_p + (xm.fr_LF_lowerleg_XM_fr_LF_upperleg)' * pa;

LF_upperleg_u = tau(2) - LF_upperleg_p(3);
LF_upperleg_U = LF_upperleg_AI(:,3);
LF_upperleg_D = LF_upperleg_U(3);

Ia_r = LF_upperleg_AI - LF_upperleg_U/LF_upperleg_D * LF_upperleg_U';
pa = LF_upperleg_p + Ia_r * LF_upperleg_c + LF_upperleg_U * LF_upperleg_u/LF_upperleg_D;
IaB = xm.fr_LF_upperleg_XM_fr_LF_hipassembly' * Ia_r * xm.fr_LF_upperleg_XM_fr_LF_hipassembly;          %%ctransform_Ia_revolute(Ia_r, xm.fr_LF_upperleg_XM_fr_LF_hipassembly, IaB);
LF_hipassembly_AI = LF_hipassembly_AI + IaB;
LF_hipassembly_p = LF_hipassembly_p + (xm.fr_LF_upperleg_XM_fr_LF_hipassembly)' * pa;

LF_hipassembly_u = tau(1) - LF_hipassembly_p(3);
LF_hipassembly_U = LF_hipassembly_AI(:,3);
LF_hipassembly_D = LF_hipassembly_U(3);

Ia_r = LF_hipassembly_AI - LF_hipassembly_U/LF_hipassembly_D * LF_hipassembly_U';
pa = LF_hipassembly_p + Ia_r * LF_hipassembly_c + LF_hipassembly_U * LF_hipassembly_u/LF_hipassembly_D;
IaB = xm.fr_LF_hipassembly_XM_fr_trunk' * Ia_r * xm.fr_LF_hipassembly_XM_fr_trunk;          %%ctransform_Ia_revolute(Ia_r, xm.fr_LF_hipassembly_XM_fr_trunk, IaB);
trunk_AI = trunk_AI + IaB;
trunk_p = trunk_p + (xm.fr_LF_hipassembly_XM_fr_trunk)' * pa;

% + The acceleration of the floating base trunk, without gravity
trunk_a = - trunk_AI \ trunk_p;

% ---------------------- THIRD PASS ----------------------
LF_hipassembly_a = (xm.fr_LF_hipassembly_XM_fr_trunk) * trunk_a + LF_hipassembly_c;
qdd(1) = (LF_hipassembly_u - dot(LF_hipassembly_U,LF_hipassembly_a)) / LF_hipassembly_D;
LF_hipassembly_a(3) = LF_hipassembly_a(3) + qdd(1);
LF_upperleg_a = (xm.fr_LF_upperleg_XM_fr_LF_hipassembly) * LF_hipassembly_a + LF_upperleg_c;
qdd(2) = (LF_upperleg_u - dot(LF_upperleg_U,LF_upperleg_a)) / LF_upperleg_D;
LF_upperleg_a(3) = LF_upperleg_a(3) + qdd(2);
LF_lowerleg_a = (xm.fr_LF_lowerleg_XM_fr_LF_upperleg) * LF_upperleg_a + LF_lowerleg_c;
qdd(3) = (LF_lowerleg_u - dot(LF_lowerleg_U,LF_lowerleg_a)) / LF_lowerleg_D;
LF_lowerleg_a(3) = LF_lowerleg_a(3) + qdd(3);
RF_hipassembly_a = (xm.fr_RF_hipassembly_XM_fr_trunk) * trunk_a + RF_hipassembly_c;
qdd(4) = (RF_hipassembly_u - dot(RF_hipassembly_U,RF_hipassembly_a)) / RF_hipassembly_D;
RF_hipassembly_a(3) = RF_hipassembly_a(3) + qdd(4);
RF_upperleg_a = (xm.fr_RF_upperleg_XM_fr_RF_hipassembly) * RF_hipassembly_a + RF_upperleg_c;
qdd(5) = (RF_upperleg_u - dot(RF_upperleg_U,RF_upperleg_a)) / RF_upperleg_D;
RF_upperleg_a(3) = RF_upperleg_a(3) + qdd(5);
RF_lowerleg_a = (xm.fr_RF_lowerleg_XM_fr_RF_upperleg) * RF_upperleg_a + RF_lowerleg_c;
qdd(6) = (RF_lowerleg_u - dot(RF_lowerleg_U,RF_lowerleg_a)) / RF_lowerleg_D;
RF_lowerleg_a(3) = RF_lowerleg_a(3) + qdd(6);
LH_hipassembly_a = (xm.fr_LH_hipassembly_XM_fr_trunk) * trunk_a + LH_hipassembly_c;
qdd(7) = (LH_hipassembly_u - dot(LH_hipassembly_U,LH_hipassembly_a)) / LH_hipassembly_D;
LH_hipassembly_a(3) = LH_hipassembly_a(3) + qdd(7);
LH_upperleg_a = (xm.fr_LH_upperleg_XM_fr_LH_hipassembly) * LH_hipassembly_a + LH_upperleg_c;
qdd(8) = (LH_upperleg_u - dot(LH_upperleg_U,LH_upperleg_a)) / LH_upperleg_D;
LH_upperleg_a(3) = LH_upperleg_a(3) + qdd(8);
LH_lowerleg_a = (xm.fr_LH_lowerleg_XM_fr_LH_upperleg) * LH_upperleg_a + LH_lowerleg_c;
qdd(9) = (LH_lowerleg_u - dot(LH_lowerleg_U,LH_lowerleg_a)) / LH_lowerleg_D;
LH_lowerleg_a(3) = LH_lowerleg_a(3) + qdd(9);
RH_hipassembly_a = (xm.fr_RH_hipassembly_XM_fr_trunk) * trunk_a + RH_hipassembly_c;
qdd(10) = (RH_hipassembly_u - dot(RH_hipassembly_U,RH_hipassembly_a)) / RH_hipassembly_D;
RH_hipassembly_a(3) = RH_hipassembly_a(3) + qdd(10);
RH_upperleg_a = (xm.fr_RH_upperleg_XM_fr_RH_hipassembly) * RH_hipassembly_a + RH_upperleg_c;
qdd(11) = (RH_upperleg_u - dot(RH_upperleg_U,RH_upperleg_a)) / RH_upperleg_D;
RH_upperleg_a(3) = RH_upperleg_a(3) + qdd(11);
RH_lowerleg_a = (xm.fr_RH_lowerleg_XM_fr_RH_upperleg) * RH_upperleg_a + RH_lowerleg_c;
qdd(12) = (RH_lowerleg_u - dot(RH_lowerleg_U,RH_lowerleg_a)) / RH_lowerleg_D;
RH_lowerleg_a(3) = RH_lowerleg_a(3) + qdd(12);

% + Add gravity to the acceleration of the floating base
trunk_a = trunk_a + gravity;
end

function ret = vxIv(omegaz, I)
    wz2 = omegaz*omegaz;
    ret = zeros(6,1);
    ret(1) = -I(2,3) * wz2;
    ret(2) =  I(1,2) * wz2;
    %%ret(3) =  0;
    ret(4) =  I(2,6) * wz2;
    ret(5) =  I(3,4) * wz2;
    %%ret(6) =  0;
end

function vc = vcross_mx(v)
    vc = [   0    -v(3)  v(2)   0     0     0    ;
             v(3)  0    -v(1)   0     0     0    ;
            -v(2)  v(1)  0      0     0     0    ;
             0    -v(6)  v(5)   0    -v(3)  v(2) ;
             v(6)  0    -v(4)   v(3)  0    -v(1) ;
            -v(5)  v(4)  0     -v(2)  v(1)  0    ];
end
