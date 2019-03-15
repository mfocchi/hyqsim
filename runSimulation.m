    clear all    
    clc
       
    loadFigOptions
    close all
    figure 
    view(3)

    simParams
    initVars    
    updateKinematics
    
    plot_plane_through_point([0;0;1],[0;0;groundLevel],1, false);
    hold on
    for i=initIndex:endIndex
 
        %disp(strcat( 'time  : ',num2str(dt*i)))        
        %compute controller to set tau
        tau = Kj*(q_des-q) - Dj*(qd);
        %compute contact model for legs to set grForces
        grForcesBLeg = computeContactModel('LF', feet, feetVel);
        setLegData('LF', b_R_w*grForcesBLeg,  'grForcesB');
        grForcesBLeg = computeContactModel('RF', feet, feetVel); 
        setLegData('RF', b_R_w*grForcesBLeg,  'grForcesB');
        grForcesBLeg = computeContactModel('LH', feet, feetVel); 
        setLegData('LH', b_R_w*grForcesBLeg,  'grForcesB');
        grForcesBLeg = computeContactModel('RH', feet, feetVel);
        setLegData('RH', b_R_w*grForcesBLeg,  'grForcesB');         
   
        %compute dynamics        
        gravityB = [ zeros(3,1);b_R_w*[0;0;-9.81]];
        [qdd, baseAccB] = forwardDynamics(baseTwistB, gravityB, qd, tau, grForcesB, FREEZE_BASE);  

        %integrate fwd everything ok with acc
        baseTwistB = baseTwistB + dt*baseAccB;
        qd = qd + dt*qdd;        
        
        %treat differently linvel and omega
        basePoseW(1:3,1) = basePoseW(1:3,1) + dt*mapOmegaToRPYDer*baseTwistB(1:3,1); %ang
        basePoseW(4:6,1)  = basePoseW(4:6,1) + dt*b_R_w'*baseTwistB(4:6,1);%lin
        q = q + dt*qd;

        updateKinematics
        plotRobot
      
        iteration = iteration +1;
        %logs
        time(:,i) = dt*i;
        logBasePoseW(:,i) =  basePoseW;
        logBaseAccB(:,i) =  baseAccB;       
        logTau(:,i) = tau;
    end
    
%    other plots
     plot(time, logBasePoseW(6,:))
