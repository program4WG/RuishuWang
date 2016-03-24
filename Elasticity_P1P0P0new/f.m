function z=f
global   lambda
% z=@(x,y)[(3/2+lambda)*sin(x)*sin(y);-(1/2+lambda)*cos(x)*cos(y)];
% z=@(x,y)[-2;-4*(1+lambda)];
% z=@(x,y)[sin(x)*sin(y);cos(x)*cos(y)];
z=@(x,y)[0;0];
% z=@(x,y)[-6*x-12*y-lambda*12*y;-12*x+6*y-lambda*12*x];
% z=@(x,y)[-3-2*lambda;1+2*lambda];
end