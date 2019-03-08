   clear all
   close all
      figure
    view(3)
    clc
    
   addpath('../') 
   initVars 
   simParams   
   updateStates([q;qd;basePoseW; baseTwistB])
   desBasePos = basePoseW;     
   plot_plane_through_point([0;0;1],[0;0;groundLevel],1);
   stance_legs = {'LF','RF','LH','RH'};
   gravityWrenchB = [ zeros(3,1);b_R_w*[0;0;-9.81]];
   grForcesB = zeros(12,1);
    % Jq=computeJcq(stance_legs, J,b_R_w);
    % Jb=computeJcb(stance_legs, feet,b_R_w);
     
   %trunk controller
   Kplin = eye(3)*2000;
   Kdlin = eye(3)*600;
   Kpang = eye(3)*2000;
   Kdang = eye(3)*200;
   
   %observer gains
   Gain(4:6,4:6) = eye(3)*100;% linear case
   Gain(1:3,1:3) = eye(3)*100; %angular case 

   %ext disturbance index
   inputForce =3;
