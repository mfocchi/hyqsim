    xgraph = 0.2; %from left
    one_y1 = 0.2;
    one_w = 0.7;
    one_h = 0.7;
    %coordinates  for 2 subplots
    two_y1 = 0.15;%s2nd graph
    two_y2 = 0.62; %1st graph
    two_w = 0.75; %width
    two_h = 0.35;
    %Set grids on all axis.
    set(0,'defaultAxesXGrid','on');set(0,'defaultAxesYGrid','on');set(0,'defaultAxesZGrid','on');
    % set some other default values
    set(0, 'RecursionLimit', 50);set(0, 'DefaultFigurePaperType', 'A4');
    set(0, 'Defaultlinelinewidth',5);set(0,'defaultaxeslinewidth',1)
    set(0, 'defaultpatchlinewidth',1);set(0, 'DefaultFigureWindowStyle', 'normal');
    set(0, 'DefaultAxesBox', 'on');set(0, 'DefaultTextFontSize', 40);
    set(0, 'DefaultAxesFontSize', 40);set(0, 'DefaultUicontrolFontSize', 40);
    set(0, 'Defaulttextinterpreter','latex')
    set(0,'DefaultLineMarkerSize', 10);
    label_size=50;