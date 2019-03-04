
    %inputs
    grForcesB(1) = grForcesLFx(i);
    grForcesB(2) = grForcesLFy(i);
    grForcesB(3) = grForcesLFz(i);

        
    grForcesB(4) = grForcesRFx(i);
    grForcesB(5) = grForcesRFy(i);
    grForcesB(6) = grForcesRFz(i);
    
        
    grForcesB(7) = grForcesLHx(i);
    grForcesB(8) = grForcesLHy(i);
    grForcesB(9) = grForcesLHz(i);
        
    grForcesB(10) = grForcesRHx(i);
    grForcesB(11) = grForcesRHy(i);
    grForcesB(12) = grForcesRHz(i);   

    
    tau(1) = LF_HAA_load(i);
    tau(2) = LF_HFE_load(i);
    tau(3) = LF_KFE_load(i);

        
    tau(4) = RF_HAA_load(i);
    tau(5) = RF_HFE_load(i);
    tau(6) = RF_KFE_load(i);
            
    tau(7) = LH_HAA_load(i);
    tau(8) = LH_HFE_load(i);
    tau(9) = LH_KFE_load(i);
        
    tau(10) = RH_HAA_load(i);
    tau(11) = RH_HFE_load(i);
    tau(12) = RH_KFE_load(i);
    
    %vars to validate
    basePoseW_val(1,1) = roll(i);
    basePoseW_val(2,1) = pitch(i);
    basePoseW_val(3,1) = yaw(i);
    basePoseW_val(4,1) = actual_baseX(i);
    basePoseW_val(5,1) = actual_baseY(i);
    basePoseW_val(6,1) = actual_baseZ(i);
    
    baseTwistB_val(1,1) = baseTwistAx(i);
    baseTwistB_val(2,1) = baseTwistAy(i);
    baseTwistB_val(3,1) = baseTwistAz(i);
    baseTwistB_val(4,1) = baseTwistLx(i);
    baseTwistB_val(5,1) = baseTwistLy(i);
    baseTwistB_val(6,1) = baseTwistLz(i);
    
    %pos
    q_val(1,1) = LF_HAA_th(i);
    q_val(2,1) = LF_HFE_th(i);
    q_val(3,1) = LF_KFE_th(i);

        
    q_val(4,1) = RF_HAA_th(i);
    q_val(5,1) = RF_HFE_th(i);
    q_val(6,1) = RF_KFE_th(i);
            
    q_val(7,1) = LH_HAA_th(i);
    q_val(8,1) = LH_HFE_th(i);
    q_val(9,1) = LH_KFE_th(i);
        
    q_val(10,1) = RH_HAA_th(i);
    q_val(11,1) = RH_HFE_th(i);
    q_val(12,1) = RH_KFE_th(i);
    
    %vel
    qd_val(1,1) = LF_HAA_thd(i);
    qd_val(2,1) = LF_HFE_thd(i);
    qd_val(3,1) = LF_KFE_thd(i);

        
    qd_val(4,1) = RF_HAA_thd(i);
    qd_val(5,1) = RF_HFE_thd(i);
    qd_val(6,1) = RF_KFE_thd(i);
            
    qd_val(7,1) = LH_HAA_thd(i);
    qd_val(8,1) = LH_HFE_thd(i);
    qd_val(9,1) = LH_KFE_thd(i);
        
    qd_val(10,1) = RH_HAA_thd(i);
    qd_val(11,1) = RH_HFE_thd(i);
    qd_val(12,1) = RH_KFE_thd(i);
    