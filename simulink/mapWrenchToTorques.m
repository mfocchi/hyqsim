function tau = mapWrenchToTorques(wrench_desW)

    wrench_desW = wrench_desW(:);
    J = evalin('base','J');
    feet = evalin('base','feet');
    b_R_w = evalin('base','b_R_w');
    
    q = evalin('base','q');
    q_des = evalin('base','q_des');
    qd = evalin('base','qd');
    Kj = evalin('base','Kj');
    Dj = evalin('base','Dj');
    
    
    inContact = evalin('base','inContact');
    stance_legs = {};
    swing_legs = {};
    tau = zeros(12,1);
    
    %check the number of stance legs 
    stance_count =0;
    swing_count = 0;
    if (inContact.LF)
        stance_count = stance_count+1;
        stance_legs{stance_count} = 'LF';
    else %%in swing use PD
        swing_count = swing_count +1;
        swing_legs{swing_count} = 'LF';
    end

    if (inContact.RF)
        stance_count = stance_count+1;
        stance_legs{stance_count} = 'RF';
    else %%in swing use PD
        swing_count = swing_count +1;
       swing_legs{swing_count} = 'RF';
    end
    
    if (inContact.LH)
        stance_count = stance_count+1;
        stance_legs{stance_count} = 'LH';
    else %%in swing use PD
          swing_count = swing_count +1;
        swing_legs{swing_count} = 'LH';
    end
    
    if (inContact.RH)
        stance_count = stance_count+1;
        stance_legs{stance_count} = 'RH';
    else %%in swing use PD
        swing_count = swing_count +1;
        swing_legs{swing_count} = 'RH';
    end
    
    if (stance_count ~=0)
   
         Jq=computeJcq(stance_legs, J);
         Jb=computeJcb(stance_legs, feet);
         %map wrench to base
         b_X_w(1:3,1:3) = b_R_w;
         b_X_w(4:6,4:6) = b_R_w;
         %grf = pinv(Jb', 1e-05)*wrench_des;
         tau = -Jq'*pinv(Jb', 1e-05)*b_X_w*wrench_desW;
        
    end
    
    %overwrite the torque foe the legs in swing (does not work is unstable)
%     if (swing_count>0)
%         for i=1:swing_count 
%             tauLeg = Kj*(getLegData(swing_legs{i},q_des)  - getLegData(swing_legs{i},q))-Dj*getLegData(swing_legs{i},qd);  
%             tau = setLegData2(swing_legs{i}, tauLeg,  tau);           
%         end
%     end
   
end
