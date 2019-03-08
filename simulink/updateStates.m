function out= updateStates(u)


q = u(1:12);
qd = u(13:24);
basePoseW = u(25:30); 
baseTwistB = u(31:36);
ip = evalin('base','ip');
ft = evalin('base','ft');
jacs = evalin('base','jacs');

assignin('base','q',q);
assignin('base','qd',qd);
assignin('base','basePoseW',basePoseW);
assignin('base','baseTwistB',baseTwistB);
updateKinematics

assignin('base','Ic',Ic);
assignin('base','J',J);
assignin('base','feet',feet);
assignin('base','feetVel',feetVel);
assignin('base','hips',hips);
assignin('base','b_R_w',b_R_w);
assignin('base','mapOmegaToRPYDer',mapOmegaToRPYDer);

out = 0;
end