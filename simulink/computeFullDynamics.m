function out= computeFullDynamics(u)

baseTwistB = evalin('base','baseTwistB');
b_R_w = evalin('base','b_R_w');
qd = evalin('base','qd');

iteration  = evalin('base','iteration');


tau = u(1:12);
grForcesB = u(13:24);
extWrench = u(25:30);
FREEZE_BASE =false;

gravityB = [ zeros(3,1);b_R_w*[0;0;-9.81]];
[qdd baseAccB] = forwardDynamics(baseTwistB, gravityB, qd, tau, grForcesB, FREEZE_BASE, extWrench);  

%to have multiple output you should wrap them
out = [baseAccB; qdd];

q = evalin('base','q');
basePoseW = evalin('base','basePoseW');

iteration = iteration +1;        
assignin('base','iteration',iteration);

end