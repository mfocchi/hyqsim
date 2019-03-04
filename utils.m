
function funs = utils
  funs.getPosition=@getPosition;
 funs.getRotation=@getRotation;
end

function pos = getPosition(transform)

pos = transform(1:3,4);
end

function R = getRotation(transform)

R = transform(1:3,1:3);
end