function output = setLegData(leg, input, jointstate_name) 

jointstate = evalin('base', jointstate_name);

if strcmp(leg, 'LF') 

    
    jointstate(1:3) = input;
end

if strcmp(leg, 'RF') 

    jointstate(4:6) = input;
end

if strcmp(leg, 'LH') 
   
    jointstate(7:9) = input;
end

if strcmp(leg, 'RH') 
    
   jointstate(10:12) = input;
end
    
assignin('base', jointstate_name, jointstate)
end