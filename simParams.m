
%terrain info
groundLevel = 0.0;
stiffness = 80000;
damping = 100;   
THRESHOLD = -0.001; %ground penetration to trigger contact

%joint controller info
Kj = 300;
Dj = 20;

%solver
simulationDuration = 1;
dt = 0.001; %integration step
iteration =1;

%flags
FREEZE_BASE = false;

