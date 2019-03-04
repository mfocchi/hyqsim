
% The feet-Jacobian of the Constraints.
function J = computeJacobian(leg, jq)


J = zeros(3,  12);


if strcmp(leg, 'LF') 
    J(1:3,1:3) = jq;
end
if strcmp(leg, 'RF') 
    J(1:3,4:6) = jq;
end

if strcmp(leg, 'LH') 
    J(1:3,7:9) = jq;
end

if strcmp(leg, 'RH') 
    J(1:3,10:12) = jq;
end

end