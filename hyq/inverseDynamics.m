function [tau trunk_a] = inverseDynamics( trunk_v, gravity, qd, qdd, fext)

ip = evalin('base', 'ip');
xm = evalin('base', 'mt');


if nargin < 5
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
end
%
% Pass 1. Forward propagate velocities and accelerations
%

% Link 'LF_hipassembly'
LF_hipassembly_v = xm.fr_LF_hipassembly_XM_fr_trunk * trunk_v;
LF_hipassembly_v(3) = LF_hipassembly_v(3) + qd(1);

vcross = vcross_mx(LF_hipassembly_v);

LF_hipassembly_a = vcross(:,3) * qd(1);
LF_hipassembly_a(3) = LF_hipassembly_a(3) + qdd(1);

LF_hipassembly_f = -fext{2} + ip.lf_LF_hipassembly.tensor6D * LF_hipassembly_a + (-vcross' * ip.lf_LF_hipassembly.tensor6D * LF_hipassembly_v);

% Link 'LF_upperleg'
LF_upperleg_v = xm.fr_LF_upperleg_XM_fr_LF_hipassembly * LF_hipassembly_v;
LF_upperleg_v(3) = LF_upperleg_v(3) + qd(2);

vcross = vcross_mx(LF_upperleg_v);

LF_upperleg_a = xm.fr_LF_upperleg_XM_fr_LF_hipassembly * LF_hipassembly_a + (vcross(:,3) * qd(2));
LF_upperleg_a(3) = LF_upperleg_a(3) + qdd(2);

LF_upperleg_f = -fext{3} + ip.lf_LF_upperleg.tensor6D * LF_upperleg_a + (-vcross' * ip.lf_LF_upperleg.tensor6D * LF_upperleg_v);

% Link 'LF_lowerleg'
LF_lowerleg_v = xm.fr_LF_lowerleg_XM_fr_LF_upperleg * LF_upperleg_v;
LF_lowerleg_v(3) = LF_lowerleg_v(3) + qd(3);

vcross = vcross_mx(LF_lowerleg_v);

LF_lowerleg_a = xm.fr_LF_lowerleg_XM_fr_LF_upperleg * LF_upperleg_a + (vcross(:,3) * qd(3));
LF_lowerleg_a(3) = LF_lowerleg_a(3) + qdd(3);

LF_lowerleg_f = -fext{4} + ip.lf_LF_lowerleg.tensor6D * LF_lowerleg_a + (-vcross' * ip.lf_LF_lowerleg.tensor6D * LF_lowerleg_v);

% Link 'RF_hipassembly'
RF_hipassembly_v = xm.fr_RF_hipassembly_XM_fr_trunk * trunk_v;
RF_hipassembly_v(3) = RF_hipassembly_v(3) + qd(4);

vcross = vcross_mx(RF_hipassembly_v);

RF_hipassembly_a = vcross(:,3) * qd(4);
RF_hipassembly_a(3) = RF_hipassembly_a(3) + qdd(4);

RF_hipassembly_f = -fext{5} + ip.lf_RF_hipassembly.tensor6D * RF_hipassembly_a + (-vcross' * ip.lf_RF_hipassembly.tensor6D * RF_hipassembly_v);

% Link 'RF_upperleg'
RF_upperleg_v = xm.fr_RF_upperleg_XM_fr_RF_hipassembly * RF_hipassembly_v;
RF_upperleg_v(3) = RF_upperleg_v(3) + qd(5);

vcross = vcross_mx(RF_upperleg_v);

RF_upperleg_a = xm.fr_RF_upperleg_XM_fr_RF_hipassembly * RF_hipassembly_a + (vcross(:,3) * qd(5));
RF_upperleg_a(3) = RF_upperleg_a(3) + qdd(5);

RF_upperleg_f = -fext{6} + ip.lf_RF_upperleg.tensor6D * RF_upperleg_a + (-vcross' * ip.lf_RF_upperleg.tensor6D * RF_upperleg_v);

% Link 'RF_lowerleg'
RF_lowerleg_v = xm.fr_RF_lowerleg_XM_fr_RF_upperleg * RF_upperleg_v;
RF_lowerleg_v(3) = RF_lowerleg_v(3) + qd(6);

vcross = vcross_mx(RF_lowerleg_v);

RF_lowerleg_a = xm.fr_RF_lowerleg_XM_fr_RF_upperleg * RF_upperleg_a + (vcross(:,3) * qd(6));
RF_lowerleg_a(3) = RF_lowerleg_a(3) + qdd(6);

RF_lowerleg_f = -fext{7} + ip.lf_RF_lowerleg.tensor6D * RF_lowerleg_a + (-vcross' * ip.lf_RF_lowerleg.tensor6D * RF_lowerleg_v);

% Link 'LH_hipassembly'
LH_hipassembly_v = xm.fr_LH_hipassembly_XM_fr_trunk * trunk_v;
LH_hipassembly_v(3) = LH_hipassembly_v(3) + qd(7);

vcross = vcross_mx(LH_hipassembly_v);

LH_hipassembly_a = vcross(:,3) * qd(7);
LH_hipassembly_a(3) = LH_hipassembly_a(3) + qdd(7);

LH_hipassembly_f = -fext{8} + ip.lf_LH_hipassembly.tensor6D * LH_hipassembly_a + (-vcross' * ip.lf_LH_hipassembly.tensor6D * LH_hipassembly_v);

% Link 'LH_upperleg'
LH_upperleg_v = xm.fr_LH_upperleg_XM_fr_LH_hipassembly * LH_hipassembly_v;
LH_upperleg_v(3) = LH_upperleg_v(3) + qd(8);

vcross = vcross_mx(LH_upperleg_v);

LH_upperleg_a = xm.fr_LH_upperleg_XM_fr_LH_hipassembly * LH_hipassembly_a + (vcross(:,3) * qd(8));
LH_upperleg_a(3) = LH_upperleg_a(3) + qdd(8);

LH_upperleg_f = -fext{9} + ip.lf_LH_upperleg.tensor6D * LH_upperleg_a + (-vcross' * ip.lf_LH_upperleg.tensor6D * LH_upperleg_v);

% Link 'LH_lowerleg'
LH_lowerleg_v = xm.fr_LH_lowerleg_XM_fr_LH_upperleg * LH_upperleg_v;
LH_lowerleg_v(3) = LH_lowerleg_v(3) + qd(9);

vcross = vcross_mx(LH_lowerleg_v);

LH_lowerleg_a = xm.fr_LH_lowerleg_XM_fr_LH_upperleg * LH_upperleg_a + (vcross(:,3) * qd(9));
LH_lowerleg_a(3) = LH_lowerleg_a(3) + qdd(9);

LH_lowerleg_f = -fext{10} + ip.lf_LH_lowerleg.tensor6D * LH_lowerleg_a + (-vcross' * ip.lf_LH_lowerleg.tensor6D * LH_lowerleg_v);

% Link 'RH_hipassembly'
RH_hipassembly_v = xm.fr_RH_hipassembly_XM_fr_trunk * trunk_v;
RH_hipassembly_v(3) = RH_hipassembly_v(3) + qd(10);

vcross = vcross_mx(RH_hipassembly_v);

RH_hipassembly_a = vcross(:,3) * qd(10);
RH_hipassembly_a(3) = RH_hipassembly_a(3) + qdd(10);

RH_hipassembly_f = -fext{11} + ip.lf_RH_hipassembly.tensor6D * RH_hipassembly_a + (-vcross' * ip.lf_RH_hipassembly.tensor6D * RH_hipassembly_v);

% Link 'RH_upperleg'
RH_upperleg_v = xm.fr_RH_upperleg_XM_fr_RH_hipassembly * RH_hipassembly_v;
RH_upperleg_v(3) = RH_upperleg_v(3) + qd(11);

vcross = vcross_mx(RH_upperleg_v);

RH_upperleg_a = xm.fr_RH_upperleg_XM_fr_RH_hipassembly * RH_hipassembly_a + (vcross(:,3) * qd(11));
RH_upperleg_a(3) = RH_upperleg_a(3) + qdd(11);

RH_upperleg_f = -fext{12} + ip.lf_RH_upperleg.tensor6D * RH_upperleg_a + (-vcross' * ip.lf_RH_upperleg.tensor6D * RH_upperleg_v);

% Link 'RH_lowerleg'
RH_lowerleg_v = xm.fr_RH_lowerleg_XM_fr_RH_upperleg * RH_upperleg_v;
RH_lowerleg_v(3) = RH_lowerleg_v(3) + qd(12);

vcross = vcross_mx(RH_lowerleg_v);

RH_lowerleg_a = xm.fr_RH_lowerleg_XM_fr_RH_upperleg * RH_upperleg_a + (vcross(:,3) * qd(12));
RH_lowerleg_a(3) = RH_lowerleg_a(3) + qdd(12);

RH_lowerleg_f = -fext{13} + ip.lf_RH_lowerleg.tensor6D * RH_lowerleg_a + (-vcross' * ip.lf_RH_lowerleg.tensor6D * RH_lowerleg_v);

%
% The force exerted on the floating base by the links
%
vcross = vcross_mx(trunk_v);
trunk_f = -fext{1} - vcross' * ip.lf_trunk.tensor6D * trunk_v;


%
% Pass 2. Compute the composite inertia and the spatial forces
%
ci = compositeInertia(ip, xm, 'motion');
RH_upperleg_f = RH_upperleg_f + xm.fr_RH_lowerleg_XM_fr_RH_upperleg' * RH_lowerleg_f;
RH_hipassembly_f = RH_hipassembly_f + xm.fr_RH_upperleg_XM_fr_RH_hipassembly' * RH_upperleg_f;
trunk_f = trunk_f + xm.fr_RH_hipassembly_XM_fr_trunk' * RH_hipassembly_f;
LH_upperleg_f = LH_upperleg_f + xm.fr_LH_lowerleg_XM_fr_LH_upperleg' * LH_lowerleg_f;
LH_hipassembly_f = LH_hipassembly_f + xm.fr_LH_upperleg_XM_fr_LH_hipassembly' * LH_upperleg_f;
trunk_f = trunk_f + xm.fr_LH_hipassembly_XM_fr_trunk' * LH_hipassembly_f;
RF_upperleg_f = RF_upperleg_f + xm.fr_RF_lowerleg_XM_fr_RF_upperleg' * RF_lowerleg_f;
RF_hipassembly_f = RF_hipassembly_f + xm.fr_RF_upperleg_XM_fr_RF_hipassembly' * RF_upperleg_f;
trunk_f = trunk_f + xm.fr_RF_hipassembly_XM_fr_trunk' * RF_hipassembly_f;
LF_upperleg_f = LF_upperleg_f + xm.fr_LF_lowerleg_XM_fr_LF_upperleg' * LF_lowerleg_f;
LF_hipassembly_f = LF_hipassembly_f + xm.fr_LF_upperleg_XM_fr_LF_hipassembly' * LF_upperleg_f;
trunk_f = trunk_f + xm.fr_LF_hipassembly_XM_fr_trunk' * LF_hipassembly_f;

%
% The base acceleration due to the force due to the movement of the links
%
trunk_a = - inv(ci.trunk_Ic) * trunk_f; % TODO inv

%
% Pass 3. Compute the joint forces while propagating back the floating base acceleration
%
tau = zeros(12, 1);
LF_hipassembly_a = xm.fr_LF_hipassembly_XM_fr_trunk * trunk_a;
tau(1) = ci.LF_hipassembly_Ic(3,:) * LF_hipassembly_a + LF_hipassembly_f(3);

LF_upperleg_a = xm.fr_LF_upperleg_XM_fr_LF_hipassembly * LF_hipassembly_a;
tau(2) = ci.LF_upperleg_Ic(3,:) * LF_upperleg_a + LF_upperleg_f(3);

LF_lowerleg_a = xm.fr_LF_lowerleg_XM_fr_LF_upperleg * LF_upperleg_a;
tau(3) = ci.LF_lowerleg_Ic(3,:) * LF_lowerleg_a + LF_lowerleg_f(3);

RF_hipassembly_a = xm.fr_RF_hipassembly_XM_fr_trunk * trunk_a;
tau(4) = ci.RF_hipassembly_Ic(3,:) * RF_hipassembly_a + RF_hipassembly_f(3);

RF_upperleg_a = xm.fr_RF_upperleg_XM_fr_RF_hipassembly * RF_hipassembly_a;
tau(5) = ci.RF_upperleg_Ic(3,:) * RF_upperleg_a + RF_upperleg_f(3);

RF_lowerleg_a = xm.fr_RF_lowerleg_XM_fr_RF_upperleg * RF_upperleg_a;
tau(6) = ci.RF_lowerleg_Ic(3,:) * RF_lowerleg_a + RF_lowerleg_f(3);

LH_hipassembly_a = xm.fr_LH_hipassembly_XM_fr_trunk * trunk_a;
tau(7) = ci.LH_hipassembly_Ic(3,:) * LH_hipassembly_a + LH_hipassembly_f(3);

LH_upperleg_a = xm.fr_LH_upperleg_XM_fr_LH_hipassembly * LH_hipassembly_a;
tau(8) = ci.LH_upperleg_Ic(3,:) * LH_upperleg_a + LH_upperleg_f(3);

LH_lowerleg_a = xm.fr_LH_lowerleg_XM_fr_LH_upperleg * LH_upperleg_a;
tau(9) = ci.LH_lowerleg_Ic(3,:) * LH_lowerleg_a + LH_lowerleg_f(3);

RH_hipassembly_a = xm.fr_RH_hipassembly_XM_fr_trunk * trunk_a;
tau(10) = ci.RH_hipassembly_Ic(3,:) * RH_hipassembly_a + RH_hipassembly_f(3);

RH_upperleg_a = xm.fr_RH_upperleg_XM_fr_RH_hipassembly * RH_hipassembly_a;
tau(11) = ci.RH_upperleg_Ic(3,:) * RH_upperleg_a + RH_upperleg_f(3);

RH_lowerleg_a = xm.fr_RH_lowerleg_XM_fr_RH_upperleg * RH_upperleg_a;
tau(12) = ci.RH_lowerleg_Ic(3,:) * RH_lowerleg_a + RH_lowerleg_f(3);


trunk_a = trunk_a + gravity;
end

function vc = vcross_mx(v)
    vc = [   0    -v(3)  v(2)   0     0     0    ;
             v(3)  0    -v(1)   0     0     0    ;
            -v(2)  v(1)  0      0     0     0    ;
             0    -v(6)  v(5)   0    -v(3)  v(2) ;
             v(6)  0    -v(4)   v(3)  0    -v(1) ;
            -v(5)  v(4)  0     -v(2)  v(1)  0    ];
end
