    clear all    
    clc
       
    addpath('hyq')
    addpath('rotations')
    loadFigOptions
    close all
    figure 
    view(3)
    
    consts =  modelConstants();
    params = modelParameters();
    inertiaProperties();
    initForceTransforms();
    initHomogeneousTransforms();
    initMotionTransforms();
    initJacobians();
    utility=utils;
    
    simParams
        

    %old
    %q = [ -0.1  0.7 -1.4   -0.2  0.75 -1.5  -0.2  -0.75 1.5  -0.2  -0.75 1.5];
    %qd = zeros(12,1);
    %qdd = zeros(12,1); 
    %feet={};    feetVel={};
    %stance_legs = {'LF','RF','LH','RH'};
    inContact.LF=false;
    inContact.RF=false;
    inContact.LH=false;
    inContact.RH=false;
    sampleTouchDown.LF = zeros(3,1);
    sampleTouchDown.RF = zeros(3,1);
    sampleTouchDown.LH = zeros(3,1);
    sampleTouchDown.RH = zeros(3,1);

    if (USE_LOGGED_DATA)
        load(mat_file)
        dt = time(2) - time(1); %not too smal otherwise it gets unstable   
        time = time - time(1);
        initTime = 5; %%start from 5 seconds otherwise you need to wait a lot!
        initIndex = initTime*250;
        endIndex = length(time);       
       
        basePoseW = [roll(initIndex); pitch(initIndex); yaw(initIndex) ; actual_baseX(initIndex);actual_baseY(initIndex);actual_baseZ(initIndex)];
        baseTwistB =  [baseTwistAx(initIndex);baseTwistAy(initIndex);baseTwistAz(initIndex);baseTwistLx(initIndex);baseTwistLy(initIndex);baseTwistLz(initIndex)];
        q =[LF_HAA_th(initIndex);LF_HFE_th(initIndex); LF_KFE_th(initIndex);  RF_HAA_th(initIndex);RF_HFE_th(initIndex);    RF_KFE_th(initIndex); LH_HAA_th(initIndex);LH_HFE_th(initIndex);LH_KFE_th(initIndex); RH_HAA_th(initIndex);RH_HFE_th(initIndex);RH_KFE_th(initIndex)];
        qd =[LF_HAA_thd(initIndex);LF_HFE_thd(initIndex); LF_KFE_thd(initIndex);  RF_HAA_thd(initIndex);RF_HFE_thd(initIndex);    RF_KFE_thd(initIndex); LH_HAA_thd(initIndex);LH_HFE_thd(initIndex);LH_KFE_thd(initIndex); RH_HAA_thd(initIndex);RH_HFE_thd(initIndex);RH_KFE_thd(initIndex)];
       
    else 
        basePoseW = [0;0;0;0;0;0.6];
        baseTwistB = zeros(6,1);
        q_des = [ -0.2;  0.7; -1.4;   -0.2;  0.75 ;-1.5  ;-0.2  ;-0.75 ;1.5  ;-0.2  ;-0.75 ;1.5];
        qd_des  = zeros(12,1);
        q = q_des;
        qd = qd_des;  

        initIndex = 1;
        endIndex = simulationDuration/dt;       
        grForcesB = zeros(12,1);
    end
            
    
    plot_plane_through_point([0;0;1],[0;0;groundLevel],1);
    hold on
    for i=initIndex:endIndex
 
        %disp(strcat( 'time  : ',num2str(dt*i)))        
        
        %this is just for debug the graphics with logged data
        if (USE_LOGGED_DATA) 
          loadData
          q = q_val;
          qd = qd_val;
          basePoseW = basePoseW_val;
          baseTwistB = baseTwistB_val;
        end
           
        updateKinematics         

        if (~USE_LOGGED_DATA)
            %compute controller to set tau
            tau = K*(q_des-q) - D*(qd);
            %to keep the gravity
              %%26.579       3.6049       46.717       25.192        3.807       49.516       25.449      -7.3699      -51.225       24.925      -7.2325      -51.328
            %compute contact model for legs to set grForces
            grForcesBLeg = computeContactModel('LF', feet, feetVel);
            setLegData('LF', b_R_w*grForcesBLeg,  'grForcesB');
            grForcesBLeg = computeContactModel('RF', feet, feetVel); 
            setLegData('RF', b_R_w*grForcesBLeg,  'grForcesB');
            grForcesBLeg = computeContactModel('LH', feet, feetVel); 
            setLegData('LH', b_R_w*grForcesBLeg,  'grForcesB');
            grForcesBLeg = computeContactModel('RH', feet, feetVel);
            setLegData('RH', b_R_w*grForcesBLeg,  'grForcesB');         
            
            %debug
%             fprintf( 'inContact  %i %i %i %i \n', inContact.LF, inContact.RF,inContact.LH,inContact.RH)
%             fprintf('sampleTouchDown.LF  %f %f %f  \n', sampleTouchDown.LF(1), sampleTouchDown.LF(2),sampleTouchDown.LF(3))
%             fprintf('sampleTouchDown.RF  %f %f %f  \n', sampleTouchDown.RF(1), sampleTouchDown.RF(2),sampleTouchDown.RF(3))
%             fprintf('sampleTouchDown.LH  %f %f %f  \n', sampleTouchDown.LH(1), sampleTouchDown.LH(2),sampleTouchDown.LH(3))
%             fprintf('sampleTouchDown.RH  %f %f %f  \n', sampleTouchDown.RH(1), sampleTouchDown.RH(2),sampleTouchDown.RH(3))
%             disp('---')
             %grForcesB'
        end
  
        %compute dynamics        
        gravityWrenchB = [ zeros(3,1);b_R_w*[0;0;-9.81]];
        [qdd baseAccB] = forwardDynamics(baseTwistB, gravityWrenchB, qd, tau, grForcesB, FREEZE_BASE);  

        %integrate fwd everything ok with acc
        baseTwistB = baseTwistB + dt*baseAccB;
        qd = qd + dt*qdd;        
        %treat differently linvel and omega
        basePoseW(1:3,1) = basePoseW(1:3,1) + dt*mapOmegaToRPYDer*baseTwistB(1:3,1); %ang
        basePoseW(4:6,1)  = basePoseW(4:6,1) + dt*b_R_w'*baseTwistB(4:6,1);%lin
        q = q + dt*qd;
        
        %Jb = computeJcb(stance_legs, feet);     
        plotRobot
        %logs
        time(:,i) = dt*i;
        logBasePoseW(:,i) =  basePoseW;
        logBaseAccB(:,i) =  baseAccB;       
        logTau(:,i) = tau;
    end
    
%     figure    
%     plot(time, logBasePoseW(6,:))
%     figure    
%     plot(time, logBaseAccB(6,:))
%     figure    
%     plot(time, logTau(1,:))