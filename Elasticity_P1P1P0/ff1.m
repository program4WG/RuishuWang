function z=ff1(x,y)
global lambda
%z=-4*(1+lambda);
%z=-(1/2+lambda)*cos(x)*cos(y);
% z=cos(x)*cos(y);
z=-(12*x-6*y)-lambda*12*x;
end