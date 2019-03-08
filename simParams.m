
%terrain info
groundLevel = 0.0;
stiffness = 20000; %cannot be higher otherwise the simulink simulation gets unstable
damping = 100;   
THRESHOLD = -0.001; %ground penetration to trigger contact

%joint controller info
Kj = 300;
Dj = 20;

%solver
simulationDuration = 1;
dt = 0.001; %integration step

%flags
USE_LOGGED_DATA = false; %just reply 
mat_file = 'data/slow_crawl.mat';
FREEZE_BASE = false;

iteration =1;