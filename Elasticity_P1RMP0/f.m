function z=f
global   lambda
% z=@(x,y)[(3/2+lambda)*sin(x)*sin(y);-(1/2+lambda)*cos(x)*cos(y)];
%z=@(x,y)[-2;-4*(1+lambda)];
% z=@(x,y)[sin(x)*sin(y);cos(x)*cos(y)];
% z=@(x,y)[-3-2*lambda,1+2*lambda];
z=@(x,y)[-3-2*lambda;1+2*lambda];
end