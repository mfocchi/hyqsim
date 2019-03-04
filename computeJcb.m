
% The Base-Jacobian of the Constraints.
function Jb = computeJcb(stance_legs, feet)

%Tomega is the matrix that transforms rpy derivatives into omega
%R is the base orientation



Jb = zeros(9,  6);

count=1;
for i=1:3
    if strcmp(stance_legs{i}, 'LF')
        Jb(count:count+2,1:3) = eye(3);
        Jb(count:count+2,4:6) = -cross_mx(feet.lf);
    end
    if strcmp(stance_legs{i}, 'RF')

        Jb(count:count+2,1:3) = eye(3);
        Jb(count:count+2,4:6) = -cross_mx(feet.rf);
    end
    if strcmp(stance_legs{i}, 'LH')
              Jb(count:count+2,1:3) = eye(3);
        Jb(count:count+2,4:6) = -cross_mx(feet.lh);
    end

    if strcmp(stance_legs{i}, 'RH')
              Jb(count:count+2,1:3) = eye(3);
        Jb(count:count+2,4:6) = -cross_mx(feet.rh);
    end
    count = count +3;

end


function mx = cross_mx ( v )
mx = [
[  0  , -v(3),  v(2)];
[ v(3),   0  , -v(1)];
[-v(2),  v(1),   0  ]];