    clear all    
    clc
       
    addpath('hyq')
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

    USE_LOGGED_DATA = false

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
        load('data/slow_crawl.mat')
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
        
        dt = 0.001;
        initIndex = 1;
        endIndex = 10/dt;       
        grForcesB = zeros(12,1);
    end
            
    %terrain info
    groundLevel = 0.0;
    stiffness = 80000000;
    damping = 100;
    
    %joint controller info
    K = 1000;
    D = 10;
    
    plot_plane_through_point([0;0;1],[0;0;groundLevel],1);
    hold on
    for i=initIndex:endIndex
        disp(strcat( 'time',num2str(dt*i)))        
        
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
            %compute contact model for legs to set grForces
            grForcesBLeg = computeContactModel('LF', feet, feetVel); setLegData('LF', b_R_w*grForcesBLeg,  'grForcesB');
            grForcesBLeg = computeContactModel('RF', feet, feetVel); setLegData('RF', b_R_w*grForcesBLeg,  'grForcesB');
            grForcesBLeg = computeContactModel('LH', feet, feetVel); setLegData('LH', b_R_w*grForcesBLeg,  'grForcesB');
            grForcesBLeg = computeContactModel('RH', feet, feetVel); setLegData('RH', b_R_w*grForcesBLeg,  'grForcesB');
            
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
        [qdd baseAcc] = forwardDynamics(baseTwistB, gravityWrenchB, qd, tau, grForcesB);  
       
        %integrate fwd everything ok with acc
        baseTwistB = baseTwistB + dt*baseAcc;
        qd = qd + dt*qdd;        
        %treat differently linvel and omega
        basePoseW(1:3,1) = basePoseW(1:3,1) + dt*mapOmegaToRPYDer*baseTwistB(1:3,1); %ang
        basePoseW(4:6,1)  = basePoseW(4:6,1) + dt*b_R_w'*baseTwistB(4:6,1);%lin
        q = q + dt*qd;
        
        %Jb = computeJcb(stance_legs, feet);     
        plotRobot


    end
