function grForcesB = computeGrfs(u) 

    assignin('base', 'basePoseW',u);

    grForcesB = evalin('base','grForcesB');
    feet = evalin('base','feet');
    feetVel = evalin('base','feetVel');
    b_R_w = evalin('base','b_R_w');
    
    %thes assigning grforces
    grForcesBLeg = computeContactModel('LF', feet, feetVel);
    setLegData('LF', b_R_w*grForcesBLeg,  'grForcesB');
    grForcesBLeg = computeContactModel('RF', feet, feetVel); 
    setLegData('RF', b_R_w*grForcesBLeg,  'grForcesB');
    grForcesBLeg = computeContactModel('LH', feet, feetVel); 
    setLegData('LH', b_R_w*grForcesBLeg,  'grForcesB');
    grForcesBLeg = computeContactModel('RH', feet, feetVel);
    setLegData('RH', b_R_w*grForcesBLeg,  'grForcesB');           

            
  
end