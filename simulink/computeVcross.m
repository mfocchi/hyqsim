function coriolis = computeVcross(v, Ic)

%ensure column vector
v = v(:);
vcross=[ cross_mx(v(1:3)) cross_mx(v(4:6) );
         zeros(3,3)  cross_mx(v(1:3) )];
     
   coriolis =   vcross*Ic*v;

end