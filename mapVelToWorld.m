function output = mapVelToWorld(input)

baseTwistB=evalin('base', 'baseTwistB');
b_R_w = evalin('base', 'b_R_w');

output = b_R_w'*baseTwistB(4:6) + b_R_w'*(cross(baseTwistB(1:3),input));
end