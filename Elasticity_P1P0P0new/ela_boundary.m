function ela_boundary
global s p t
global NE NT
global A F
NF=2*NE+2*3*NT;
solution=u;
%figure
for i=1:NE
    if   s(4,i)<0 
         P=p(1:2,s(1:2,i));
         locationBO=[[1 2]+2*(i-1)+6*NT]';
         F(locationBO)=QB2(solution,P);
         A(locationBO,:)=zeros(2,NF);
         A(locationBO,locationBO)=eye(2);
    end
end

end
