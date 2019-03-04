
function  x = fwdKin(leg,q_leg)
%fwd kinematics

 
q = evalin('base', 'q'); 

if nargin < 2 % checks, if the number of input-parameters is less than 2

    if strcmp(leg, 'LF') 

        evalin('base', 'updateHomogeneousTransforms(q);');
        x=evalin('base', 'ht.fr_trunk_Xh_LF_foot(1:3,4)'); 
    end

    if strcmp(leg, 'RF') 
        evalin('base', 'updateHomogeneousTransforms(q);');
        x=evalin('base', 'ht.fr_trunk_Xh_RF_foot(1:3,4)'); 
    end

    if strcmp(leg, 'LH') 
        evalin('base', 'updateHomogeneousTransforms(q);');
        x=evalin('base', 'ht.fr_trunk_Xh_LH_foot(1:3,4)'); 
    end

    if strcmp(leg, 'RH') 
        evalin('base', 'updateHomogeneousTransforms(q);');
        x=evalin('base', 'ht.fr_trunk_Xh_RH_foot(1:3,4)'); 
    end
    
    
else 
 
%this updates the joint state for that leg
if strcmp(leg, 'LF') 
  
    q(1:3) = q_leg; 
    evalin('base', 'update_homogeneous');
    x=evalin('base', 'fr_trunk_Xh_LF_foot(1:3,4)'); 
end

if strcmp(leg, 'RF') 
    q(4:6) = q_leg;
    evalin('base', 'update_homogeneous');
    x=evalin('base', 'fr_trunk_Xh_RF_foot(1:3,4)'); 
end

if strcmp(leg, 'LH') 
    q(7:9) = q_leg;
    evalin('base', 'update_homogeneous');
    x=evalin('base', 'fr_trunk_Xh_LH_foot(1:3,4)'); 
end

if strcmp(leg, 'RH') 
    q(10:12) = q_leg;
    evalin('base', 'update_homogeneous');
    x=evalin('base', 'fr_trunk_Xh_RH_foot(1:3,4)'); 
end

assignin('base', 'q',q)

end


