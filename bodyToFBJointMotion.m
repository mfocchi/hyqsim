% Transforms a spatial velocity and acceleration of a rigid body into the
%   velocity and acceleration of a virtual 6-Dof joint, which is assumed to
%   connect the fixed ground with the moving body.
% Since the function computes it, the third return value is the Jacobian matrix
%   that transforms the joint velocity into the spatial velocity of the body,
%   expressed in the body frame.
%
% \param base_p the position status of the virtual joint, ie 6 scalars
% \param base_v the spatial velocity of the body
% \param base_a the spatial accleration of the body
% \param fbjoint_specs the specification of the floating base joint, as a cell
%         array of six strings (optional parameter). The default value is
%         {'Px', 'Py', 'Pz', 'Rx', 'Ry', 'Rz'}, which corresponds to three
%         translations along x,y,z and three rotations about x,y,z (successive
%         rotations).
%
% Author: Marco Frigerio, 2013

function [qd qdd J] = bodyToFBJointMotion(base_p, base_v, base_a, fbjoint_specs)

if nargin < 4
    fbjoint_specs = {'Px', 'Py', 'Pz', 'Rx', 'Ry', 'Rz'};
end

v{6} = base_v;
a{6} = base_a;

q = base_p;

J  = zeros(6,6);
Jp = zeros(6,6);
X  = eye(6);
Xp = eye(6);
dt = 0.00001;

for i = 6:-1:1
  [ childXj, S ] = jcalc( fbjoint_specs{i}, q(i) );
  X = X * childXj;
  J(:,i) = X * S;
end

Jinv  = inv(J);

% The joint space velocity:
qd  = Jinv * base_v;

% For the acceleration we need to estimate the time derivative of the Jacobian
for i = 6:-1:1
  [ childXj, S ] = jcalc( fbjoint_specs{i}, q(i)+(qd(i)*dt) );
  Xp = Xp * childXj;
  Jp(:,i) = Xp * S;
end

Jpinv = inv(Jp);
qdd = (Jpinv-Jinv)/dt * base_v + Jinv*base_a;

