function eulerRateAndBaseVelW = adjustEulerRates(u)

mapOmegaToRPYDer = evalin('base','mapOmegaToRPYDer');
b_R_w= evalin('base','b_R_w');

%euler rate
eulerRateAndBaseVelW(1:3) = b_R_w'*u(1:3);
%map basevel B to world
eulerRateAndBaseVelW(4:6) = b_R_w'*u(4:6);

end