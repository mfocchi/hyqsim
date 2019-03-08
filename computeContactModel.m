function grForcesLegW = computeContactModel(leg, feet, feetVel)

groundLevel =evalin('base','groundLevel');
b_R_w =evalin('base','b_R_w');
stiffness =evalin('base','stiffness');
damping =evalin('base','damping');
inContact =evalin('base','inContact');
sampleTouchDown = evalin('base','sampleTouchDown');

sampleTouchDownLeg = zeros(3,1);

%detect zero crossing
THRESHOLD = -1e-3;
footB = eval(strcat('feet.',leg));
footVelB = eval(strcat('feetVel.',leg));
footW = mapPosToWorld(footB);

footVelW = mapVelToWorld(footVelB); %mapping for velocity is only a rotation

%zero crossing
if (~eval(strcat('inContact.',leg)) && (footW(3) - groundLevel)<= THRESHOLD)    
    %sample the foot position at touchdown
    sampleTouchDownLeg= footW;
    eval(strcat('sampleTouchDown.',leg,'= sampleTouchDownLeg;'));
    assignin('base', 'sampleTouchDown', sampleTouchDown);  
    eval(strcat('inContact.',leg,'= true;'));
end
if (eval(strcat('inContact.',leg)) && (footW(3) - groundLevel)>= THRESHOLD)    
    eval(strcat('inContact.',leg,'= false;'));
end

%compute grf
if ( eval(strcat('inContact.',leg)))      
    sampleTouchDownLeg = eval(strcat('sampleTouchDown.',leg));
    grForcesLegW = stiffness*(sampleTouchDownLeg - footW) - damping*footVelW;
else 
    grForcesLegW= [0;0;0];
end

%to test the dinamics is correct just make grfs that compensate gravity
%ip = evalin('base','ip');
%grForcesLegW =[0;0; 9.81*ip.totalMass/4];

assignin('base', 'inContact', inContact);
       




end