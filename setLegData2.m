%same as setLegData, function overload that returns the output
function output = setLegData2(leg, input, jointstate) 

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

output = jointstate;

end