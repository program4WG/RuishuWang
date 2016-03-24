function Global_stiffness_A
%    p=[0 1 1 0;0 0 1 1];
%    t=[1 2;2 3;4 4;5 3;4 5;1 2];
%    s=[1 2 3 1 2;2 3 4 4 4;1 2 2 1 1;0 0 0 0 2];
%    NE=5;
%    NT=2;
global p t s
global NT NE
global A
   NF=2*NE+2*3*NT;
   A=sparse(NF,NF);
   for n=1:NT
       N=t(:,n);%三个顶点序号
       NS=[s(1:2,N(4)) s(1:2,N(5)) s(1:2,N(6))];
       PS=[p(:,NS(1,1)) p(:,NS(2,1)) p(:,NS(1,2)) p(:,NS(2,2)) p(:,NS(1,3)) p(:,NS(2,3))];
       P=p(1:2,N(1:3));%三个顶点坐标
       a=local_stiffness_matrix(P,PS);%局部刚度矩阵
       E=t(4:6,n);%三边序号
       Loc=[3*n-2,3*n-1,3*n,3*n-2+3*NT,3*n-1+3*NT,3*n+3*NT,2*E(1)-1+6*NT,2*E(1)+6*NT,2*E(2)-1+6*NT,2*E(2)+6*NT,2*E(3)-1+6*NT,2*E(3)+6*NT];
       A(Loc,Loc)=A(Loc,Loc)+a;
      
   end
%    %测试
%      f1=@(x,y)[1,0];
%      f2=@(x,y)[0,1];
%      f3=@(x,y)[x,0];
%      f4=@(x,y)[0,x];
%      f5=@(x,y)[y,0];
%      f6=@(x,y)[0,y];  
%      f7=@(x,y)[x+y,x-y]
%      F=f7; 
%      EH=zeros(NF,1);
%     for i=1:NT
%        P=p(1:2,t(1:3,i));
%        locationIN1=[[1 2 3]+3*(i-1) [1 2 3]+3*(i-1)+3*NT];
%        UR1=zeros(6,1);        
%        UR1=Q02(F,P);        
%        EH(locationIN1')=UR1;     
%     end
%     
%     for i=1:NE
%       P2=p(1:2,s(1:2,i));
%       locationBO1=[1,2,3]+3*(i-1)+6*NT;
%       UR3=zeros(3,1);
%       UR3=QB2(F,P2);
%       EH(locationBO1')=UR3;
%     end
%     EH'*A*EH



end