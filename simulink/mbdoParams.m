   clear all
   close all
      figure
    view(3)
    clc
    
   addpath('../') 
   addpath('../hyq')
   addpath('../rotations')
   initVars 
   simParams   
   updateStates([q;qd;basePoseW; baseTwistB])
   desBasePoseW = basePoseW;     
   plot_plane_through_point([0;0;1],[0;0;groundLevel],1);
   stance_legs = {'LF','RF','LH','RH'};
   gravityB = [ zeros(3,1);b_R_w*[0;0;-9.81]];
   grForcesB = zeros(12,1);
     
   %trunk controller
   Kplin = eye(3)*1000;
   Kdlin = eye(3)*200;
   Kpang = eye(3)*1000;
   Kdang = eye(3)*100;
   
   %observer gains
   Gain(4:6,4:6) = eye(3)*50;% linear case
   Gain(1:3,1:3) = eye(3)*10; %angular case 

   %ext disturbance index
   inputForce =3;

   resetDesBasePos = false;