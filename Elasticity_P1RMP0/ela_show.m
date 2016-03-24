function ela_show
%图像只考虑一个分量
global p t s
global uh
global NT NE

%内部图像
   figure
   for i=1:NT
       P=p(1:2,t(1:3,i));
       locationIN=[1 2 3]+3*(i-1);
       UH=uh(locationIN');
       x=[P(1,1),P(1,2),P(1,3)];
       y=[P(2,1),P(2,2),P(2,3)];      
       trisurf([1 2 3],x,y,UH);
       hold on
   end   
   title('inner part');
   hold off
 %%%%边界 
  figure
  for i=1:NE
      P2=p(1:2,s(1:2,i));
      rp=[P2(2,2)-P2(2,1);P2(1,1)-P2(1,2)];
      locationBO=[1,2,3]+3*(i-1)+6*NT;
      UH2=uh(locationBO');
      x=[P2(1,1),P2(1,2)];
      y=[P2(2,1),P2(2,2)];
      UR1=[UH2(1),UH2(1)+UH2(3)*rp(1)];
      UR2=[UH2(2),UH2(2)+UH2(3)*rp(2)];
      %if s(4,i)<0
         plot3(x,y,UR1);      
         hold on
 %     end 
     title('boundary part')  
     
  end
  hold off       

%        %%%%测试边界处理
%        solution1=u;
%   for i=1:NE
%     if   s(4,i)<0 
%          P=p(1:2,s(1:2,i));
%          x=[P(1,1),P(1,2)];
%          y=[P(2,1),P(2,2)];
%          rp=[P(2,2)-P(2,1);P(1,1)-P(1,2)];
%          m=QB2(solution1,P);
% %          m1=[m(1),m(1)+m(3)*rp(1)];
% %          plot3(x,y,m1);
%          m2=[m(2),m(2)+m(3)*rp(2)];
%          plot3(x,y,m2);
%          hold on;
%          locationBO3=[[1 2 3]+3*(i-1)+6*NT]';
%          m-uh(locationBO3)
%     end
%   end
end
