function GlobalA
%    p=[0 1 1 0;0 0 1 1];
%    t=[1 2;2 3;4 4;5 3;4 5;1 2];
%    s=[1 2 3 1 2;2 3 4 4 4;1 2 2 1 1;0 0 0 0 2];
%    NE=5;
%    NT=2;
global p t s
global NT NE
global A
   NF=2*2*NE+2*3*NT;
   A=sparse(NF,NF);
   for n=1:NT
       N=t(:,n);%三个顶点序号
       P=p(1:2,N(1:3));%三个顶点坐标
       a=localA(P,N);%局部刚度矩阵
       E=t(4:6,n);%三边序号
       Loc=[3*n-2,3*n-1,3*n,3*n-2+3*NT,3*n-1+3*NT,3*n+3*NT,2*E(1)-1+6*NT,2*E(1)+6*NT,2*E(2)-1+6*NT,2*E(2)+6*NT,2*E(3)-1+6*NT,2*E(3)+6*NT,2*E(1)-1+6*NT+2*NE,2*E(1)+6*NT+2*NE,2*E(2)-1+6*NT+2*NE,2*E(2)+6*NT+2*NE,2*E(3)-1+6*NT+2*NE,2*E(3)+6*NT+2*NE];
       A(Loc,Loc)=A(Loc,Loc)+a;
      
   end
% % %    %测试
    solution1=@u;
    solution2=@u1; 
     EH=zeros(NF,1);
    for i=1:NT
       P=p(1:2,t(1:3,i));
       locationIN1=[1 2 3]+3*(i-1);
       UR1=zeros(3,1);        
       UR1=Q02(solution1,P);        
       EH(locationIN1')=UR1;
       locationIN2=[1 2 3]+3*(i-1)+3*NT;
       UR2=zeros(3,1);        
       UR2=Q02(solution2,P);
       EH(locationIN2')=UR2;
%        x=[P(1,1),P(1,2),P(1,3)];
%        y=[P(2,1),P(2,2),P(2,3)];
%        trisurf([1 2 3],x,y,UR);
%        hold on
    end
      for i=1:NE
      P2=p(1:2,s(1:2,i));
      locationBO1=[1,2]+2*(i-1)+6*NT;
      UR3=zeros(2,1);
      UR3=QB2(solution1,P2);
      EH(locationBO1')=UR3;
      locationBO2=[1,2]+2*(i-1)+6*NT+2*NE;
      UR4=zeros(2,1);
      UR4=QB2(solution2,P2);
      EH(locationBO2')=UR4;
%       x=[P2(1,1),P2(1,2)];
%       y=[P2(2,1),P2(2,2)];       
%       plot3(x,y,UR2);
%       hold on;
      end
%       EH
    EH'*A*EH
% 


end