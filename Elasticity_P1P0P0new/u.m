function z=u
global   lambda
%    z=@(x,y)[sin(x)*sin(y),1];
%    z=@(x,y)[(x+y)^2;(x-y)^2];
%    z=@(x,y)[sin(x)*sin(y);cos(x)*cos(y)];
z=@(x,y)[x+y;x-y];
% z=@(x,y)[(x+y)^3;(x+y)^3];
% z=@(x,y)[x^2+y^2;x^2-y^2];
end