
% The Base-Jacobian of the Constraints.
function Jq = computeJcq(stance_legs, J, b_R_w)

if (nargin<3)
    b_R_w = eye(3);
end
Jq = zeros(size(stance_legs,2),  12);



count=1;
for i=1:size(stance_legs,2)
    if strcmp(stance_legs{i}, 'LF')
        Jq(count:count+2,1:3) = b_R_w'*J.LF;
    end
    if strcmp(stance_legs{i}, 'RF')
        Jq(count:count+2,4:6) = b_R_w'*J.RF;
    end
    if strcmp(stance_legs{i}, 'LH')
        Jq(count:count+2,7:9) = b_R_w'*J.LH;
        
    end
    if strcmp(stance_legs{i}, 'RH')
       Jq(count:count+2,10:12) = b_R_w'*J.RH;
    end
    count = count +3;

end


function mx = cross_mx ( v )
mx = [
[  0  , -v(3),  v(2)];
[ v(3),   0  , -v(1)];
[-v(2),  v(1),   0  ]];