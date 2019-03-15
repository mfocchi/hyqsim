%plot robot state

[h(1), h(2) h(3)  h(4) h(5) h(21)] = plotLegs('LF');
[h(6), h(7) h(8)  h(9) h(10) h(22)] =plotLegs('RF');
[h(11), h(12) h(13)  h(14) h(15) h(23)] =plotLegs('LH');
[h(16), h(17) h(18)  h(19) h(20) h(24)]  =plotLegs('RH') ;
axis equal


set(gcf, 'renderer', 'painters')
drawnow   limitrate
if (i~=endIndex)
    pause(0.001)
    delete(h); %this deletes the handle
    clear h %this deletes the array
end



       
    