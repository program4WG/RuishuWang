function M=inter_2d(fun1,fun2,P)%%%向量函数的积分
% fun1=@(x,y)[1,1];
% fun2=@(x,y)[1,1];
% P=[0,1,0;0,0,1];
K=0.5*abs(det([ones(1,3);P]));
x=[P(1,1),P(1,2),P(1,3),(P(1,1)+P(1,2)+P(1,3))/3,(P(1,1)+P(1,2))/2,(P(1,3)+P(1,2))/2,(P(1,1)+P(1,3))/2];
y=[P(2,1),P(2,2),P(2,3),(P(2,1)+P(2,2)+P(2,3))/3,(P(2,1)+P(2,2))/2,(P(2,3)+P(2,2))/2,(P(2,1)+P(2,3))/2];
W=[1/20 1/20 1/20 9/20 2/15 2/15 2/15];
FV1=zeros(1,7);
FV2=zeros(1,7);
for i=1:7
    a=fun1(x(i),y(i));
    b=fun2(x(i),y(i));
    FV1(i)=a(1)*b(1);
    FV2(i)=a(2)*b(2);
end
M=K*sum(W.*FV1)+K*sum(W.*FV2);

end