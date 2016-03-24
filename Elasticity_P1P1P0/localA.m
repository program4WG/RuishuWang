function A=localA(p,t)
% function localA
%       p=[0 1 1; 0 0 1];
%       t=[1;2;3;1;2;3];
%       s=[2,1,1;3,3,2];
global lambda
     K=(1/2)*abs(det([[1 1 1];p(1,:);p(2,:)]));
     L=[p(:,[3 1 2])-p(:,[2 3 1])];
     N=[L(2,:);-L(1,:)];
     l=zeros(3,1);     
     for i=1:3
         l(i)=sqrt(L(1,i)^2+L(2,i)^2);
     end
     h=0.5*prod(l)/K;
     A=zeros(18);
     A1=zeros(18);
     A2=zeros(18);
     A3=zeros(18);
  %   to get A_1 & A_2
     for i=1:3
         for j=1:3
             A1([2*i+5,2*i+6],[2*j+5,2*j+6])=N(1,i)*N(1,j)/(4*K)+N(2,i)*N(2,j)/(8*K);
             A1([2*i+11,2*i+12],[2*j+11,2*j+12])=N(1,i)*N(1,j)/(8*K)+N(2,i)*N(2,j)/(4*K);
             A1([2*i+5,2*i+6],[2*j+11,2*j+12])=N(2,i)*N(1,j)/(8*K);
             A1([2*i+11,2*i+12],[2*j+5,2*j+6])=N(1,i)*N(2,j)/(8*K);
             A2([2*i+5,2*i+6],[2*j+5,2*j+6])=N(1,i)*N(1,j)/(4*K);
             A2([2*i+5,2*i+6],[2*j+11,2*j+12])=N(1,i)*N(2,j)/(4*K);
             A2([2*i+11,2*i+12],[2*j+5,2*j+6])=N(2,i)*N(1,j)/(4*K);
             A2([2*i+11,2*i+12],[2*j+11,2*j+12])=N(2,i)*N(2,j)/(4*K);
         end     
   
     end
 %    to get A_3
     I=zeros(3);
     I=[(l(2)+l(3))/3 l(3)/6 l(2)/6;l(3)/6 (l(1)+l(3))/3 l(1)/6;l(2)/6 l(1)/6 (l(1)+l(2))/3];
     II=zeros(3,6);
     II=-[0 0 l(2)/6 l(2)/3 l(3)/3 l(3)/6;...
         l(1)/3 l(1)/6 0 0 l(3)/6 l(3)/3;...
         l(1)/6 l(1)/3 l(2)/3 l(2)/6 0 0];
     III=zeros(6);
     TEMP=[1/3 1/6;1/6 1/3];
     III=[l(1)*TEMP zeros(2) zeros(2);...
         zeros(2) l(2)*TEMP zeros(2);...
         zeros(2) zeros(2) l(3)*TEMP];
    A3=(1/h)*[I zeros(3) II zeros(3,6);...
        zeros(3) I zeros(3,6) II;...
        II' zeros(6,3) III zeros(6);...
        zeros(6,3) II' zeros(6) III];
   % to get A
    A=A1+lambda*A2+A3;
      if t(2)>t(3)
          MID=zeros(18,1);
          MID=A(:,7);
          A(:,7)=A(:,8);
          A(:,8)=MID;
          MID=A(:,13);
          A(:,13)=A(:,14);
          A(:,14)=MID;
          MID2=zeros(1,18);
          MID=A(7,:);
          A(7,:)=A(8,:);
          A(8,:)=MID;
          MID=A(13,:);
          A(13,:)=A(14,:);
          A(14,:)=MID;
      end
      if t(3)>t(1)
          MID=zeros(18,1);
          MID=A(:,9);
          A(:,9)=A(:,10);
          A(:,10)=MID;
          MID=A(:,15);
          A(:,15)=A(:,16);
          A(:,16)=MID;
          MID2=zeros(1,18);
          MID=A(9,:);
          A(9,:)=A(10,:);
          A(10,:)=MID;
          MID=A(15,:);
          A(15,:)=A(16,:);
          A(16,:)=MID;
      end
      if t(1)>t(2)
          MID=zeros(18,1);
          MID=A(:,11);
          A(:,11)=A(:,12);
          A(:,12)=MID;
          MID=A(:,17);
          A(:,17)=A(:,18);
          A(:,18)=MID;
          MID2=zeros(1,18);
          MID=A(11,:);
          A(11,:)=A(12,:);
          A(12,:)=MID;
          MID=A(17,:);
          A(17,:)=A(18,:);
          A(18,:)=MID;
      end 
% % % %    %²âÊÔ
%     solution1=@(x,y)x+y; 
%     solution2=@(x,y)0;
%      EH=zeros(18,1);
%        P=p;
%        locationIN1=[1 2 3];
%        UR1=zeros(3,1);        
%        UR1=Q02(solution1,P);        
%        EH(locationIN1')=UR1;
%        locationIN2=[1 2 3]+3;
%        UR2=zeros(3,1);        
%        UR2=Q02(solution2,P);
%        EH(locationIN2')=UR2;
% % %        x=[P(1,1),P(1,2),P(1,3)];
% % %        y=[P(2,1),P(2,2),P(2,3)];
% % % %        trisurf([1 2 3],x,y,UR);
% % % %        hold on
%       s=zeros(2,3);
%       if t(3)>t(2)
%           s(1,1)=2;
%           s(2,1)=3;
%       else
%           s(1,1)=3;
%           s(2,1)=2;
%       end
%       if t(3)>t(1)
%           s(1,2)=1;
%           s(2,2)=3;
%       else
%           s(1,2)=3;
%           s(2,2)=1;
%       end
%       if t(1)>t(2)
%           s(1,3)=2;
%           s(2,3)=1;
%       else
%           s(1,3)=1;
%           s(2,3)=2;
%       end
%       for i=1:3
%           P2=p(:,s(1:2,i));
%           locationBO1=[1,2]+2*(i-1)+6;
%           UR3=zeros(2,1);
%           UR3=QB2(solution1,P2);
%           EH(locationBO1')=UR3;
%           locationBO2=[1,2]+2*(i-1)+6+2*3;
%           UR4=zeros(2,1);
%           UR4=QB2(solution2,P2);
%           EH(locationBO2')=UR4;
% % %       x=[P2(1,1),P2(1,2)];
% % %       y=[P2(2,1),P2(2,2)];       
% % %       plot3(x,y,UR2);
% % %       hold on;
%        end
% % %       EH
% %     EH'*A1*EH;
% %     EH'*A2*EH;
%      EH'*A*EH
  
end