
% The Base-Jacobian of the Constraints.
function Jb = computeJcb(stance_legs, feet,b_R_w)

if (nargin<3)
    b_R_w = eye(3);
end


Jb = zeros(size(stance_legs,2),  6);

count=1;
for i=1:size(stance_legs,2)
    if strcmp(stance_legs{i}, 'LF')
        Jb(count:count+2,1:3) = -b_R_w'*cross_mx(feet.LF);
        Jb(count:count+2,4:6) = b_R_w'*eye(3);
    end
    if strcmp(stance_legs{i}, 'RF')

        Jb(count:count+2,1:3) = -b_R_w'*cross_mx(feet.RF);
        Jb(count:count+2,4:6) = b_R_w'*eye(3);
    end
    if strcmp(stance_legs{i}, 'LH')
              Jb(count:count+2,1:3) = -b_R_w'*cross_mx(feet.LH);
        Jb(count:count+2,4:6) = b_R_w'*eye(3);
    end

    if strcmp(stance_legs{i}, 'RH')
              Jb(count:count+2,1:3) = -b_R_w'*cross_mx(feet.RH);
        Jb(count:count+2,4:6) = b_R_w'*eye(3);
    end
    count = count +3;

end
end


function mx = cross_mx ( v )
mx = [
[  0  , -v(3),  v(2)];
[ v(3),   0  , -v(1)];
[-v(2),  v(1),   0  ]];
end