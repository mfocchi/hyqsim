function tau = mapWrenchToTorques(wrench_des)

    wrench_des = wrench_des(:);
    stance_legs = evalin('base','stance_legs');
    J = evalin('base','J');
    feet = evalin('base','feet');

     Jq=computeJcq(stance_legs, J);
     Jb=computeJcb(stance_legs, feet);
  
     %grf = pinv(Jb', 1e-05)*wrench_des;
     tau = -Jq'*pinv(Jb', 1e-05)*wrench_des;
end
