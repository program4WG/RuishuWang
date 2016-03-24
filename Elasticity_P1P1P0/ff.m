function z=ff(x,y)
global lambda
%z=-2;
%z=(3/2+lambda)*sin(x)*sin(y);
% z=sin(x)*sin(y);
z=-(6*x+12*y)-lambda*12*y;
end