function contact = getContactState(u)
    inContact = evalin('base', 'inContact');
    contact(1) = double(inContact.LF);
    contact(2) = double(inContact.RF);
    contact(3) = double(inContact.LH);
    contact(4) =double(inContact.RH);

    resetDesBasePos = evalin('base', 'resetDesBasePos');
    desBasePoseW = evalin('base', 'desBasePoseW');
    basePoseW = evalin('base', 'basePoseW');

    if (~resetDesBasePos)
        if (contact(1) &&contact(2)&&contact(3)&&contact(4)) 
                resetDesBasePos = true;
                desBasePoseW = basePoseW;   
                disp('reset base')
                assignin('base','desBasePoseW',desBasePoseW);
                assignin('base','resetDesBasePos',resetDesBasePos);
        end
    end


end
