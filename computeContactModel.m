function grForcesLegW = computeContactModel(leg, feet, feetVel)

groundLevel =evalin('base','groundLevel');
b_R_w =evalin('base','b_R_w');
stiffness =evalin('base','stiffness');
damping =evalin('base','damping');
inContact =evalin('base','inContact');
sampleTouchDown = evalin('base','sampleTouchDown');

sampleTouchDownLeg = zeros(3,1);

%detect zero crossing
THREESHOLD = -1e-3;
footB = eval(strcat('feet.',leg));
footVelB = eval(strcat('feetVel.',leg));
footW = mapPosToWorld(footB);
footVelW = mapVelToWorld(footVelB); %mapping for velocity is only a rotation

%zero crossing
if ((footW(3) - groundLevel)< THREESHOLD)    
    sampleTouchDownLeg= footW;
    eval(strcat('inContact.',leg,'= true;'));
end
if ((footW(3) - groundLevel)> THREESHOLD)    
    eval(strcat('inContact.',leg,'= false;'));
end

%compute grf
if ( eval(strcat('inContact.',leg)))    
%     footW
%     footVelW
%     sampleTouchDownLeg
    grForcesLegW = stiffness*(sampleTouchDownLeg - footW) - damping*footVelW;
else 
    grForcesLegW= [0;0;0];
end


eval(strcat('sampleTouchDown.',leg,'= sampleTouchDownLeg;'));
assignin('base', 'inContact', inContact);
assignin('base', 'sampleTouchDown', sampleTouchDown);         




end