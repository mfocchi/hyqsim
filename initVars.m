
    addpath('hyq')
    addpath('rotations')
    consts =  modelConstants();
    params = modelParameters();
    inertiaProperties();
    initForceTransforms();
    initHomogeneousTransforms();
    initMotionTransforms();
    initJacobians();
    utility=utils;
    
    %init contact params
    inContact.LF=false;
    inContact.RF=false;
    inContact.LH=false;
    inContact.RH=false;
    sampleTouchDown.LF = zeros(3,1);
    sampleTouchDown.RF = zeros(3,1);
    sampleTouchDown.LH = zeros(3,1);
    sampleTouchDown.RH = zeros(3,1);
    
    %%init state variables
    basePoseW = [0;0;0;0;0;0.65];
    baseTwistB = zeros(6,1);
    q_des = [ -0.2;  0.7; -1.4;   -0.2;  0.7 ;-1.4  ;-0.2  ;-0.7 ;1.4  ;-0.2  ;-0.7 ;1.4];
    qd_des  = zeros(12,1);
    q = q_des;
    qd = qd_des;  
    b_R_w = rpyToRot(basePoseW(1:3,1));
    tau= zeros(12,1);
    grForcesB= zeros(12,1);

