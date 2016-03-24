function boundary2
global s p t
global NE NT
global A F
NF=2*2*NE+2*3*NT;
solution=@u;
solution1=@u1;
% solution=@(x,y)1;
% solution1=@(x,y)x;
%figure
for i=1:NE
    if   s(4,i)<0 
         P=p(1:2,s(1:2,i));
         locationBO=[[1 2]+2*(i-1)+6*NT];
         locationBO1=[[1 2]+2*(i-1)+6*NT+2*NE];
         F(locationBO)=[QB2(solution,P)]';
         F(locationBO1)=[QB2(solution1,P)]';
         locationBO2=[locationBO,locationBO1];
         A(locationBO2,:)=zeros(4,NF);
         A(locationBO2,locationBO2)=eye(4);
%       x=[P(1,1),P(1,2)];
%       y=[P(2,1),P(2,2)]; 
%       m=F(locationBO1);
%       plot3(x,y,m);
%       hold on;
    end
end

end
