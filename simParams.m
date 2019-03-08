
%terrain info
groundLevel = 0.0;
stiffness = 40000; %cannot be higher otherwise the simulink simulation gets unstable
damping = 100;    

%joint controller info
Kj = 500;
Dj = 30;

%solver
simulationDuration = 0.15;
dt = 0.001; %integration step

%flags
USE_LOGGED_DATA = false; %just reply 
mat_file = 'data/slow_crawl.mat';
FREEZE_BASE = false;

iteration =1;