
%terrain info
groundLevel = 0.0;
stiffness = 80000;
damping = 100;    

%joint controller info
K = 500;
D = 30;

%solver
simulationDuration = 0.15
dt = 0.001; %integration step

%flags
USE_LOGGED_DATA = false %just reply 
mat_file = 'data/slow_crawl.mat'
FREEZE_BASE = false