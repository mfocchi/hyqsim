function output = getHipPos(leg) 



if strcmp(leg, 'LF') 

    
    output =  evalin('base', 'ht.fr_trunk_Xh_fr_LF_HAA(1:3,4)'); 
end

if strcmp(leg, 'RF') 

    output =  evalin('base', 'ht.fr_trunk_Xh_fr_RF_HAA(1:3,4)'); 
end

if strcmp(leg, 'LH') 
   
    output =  evalin('base', 'ht.fr_trunk_Xh_fr_LH_HAA(1:3,4)'); 
end

if strcmp(leg, 'RH') 
    
    output =  evalin('base', 'ht.fr_trunk_Xh_fr_RH_HAA(1:3,4)'); 
end
    
end