function show
%图像只考虑一个分量
global p t s
global uh
global NT NE
solution=@u;

%内部图像
figure

   for i=1:NT
       P=p(1:2,t(1:3,i));
       locationIN=[1 2 3]+3*(i-1);
       UH=uh(locationIN');
       x=[P(1,1),P(1,2),P(1,3)];
       y=[P(2,1),P(2,2),P(2,3)];
       UR=zeros(1,3)';       
      trisurf([1 2 3],x,y,UH);
       hold on
       for j=1:3
           UR(j)=solution(x(j),y(j));
       end 
%        trisurf([1 2 3],x,y,UR);
%        hold on
   end
   hold off
   title('inner part');
   figure
%边界
  for i=1:NE
      P2=p(1:2,s(1:2,i));
      locationBO=[1,2]+2*(i-1)+6*NT;
      UH2=uh(locationBO');
      x=[P2(1,1),P2(1,2)];
      y=[P2(2,1),P2(2,2)];
      UR2=zeros(1,2)';  
    %  if s(4,i)<0
       plot3(x,y,UH2);      
      hold on
    %  end
      for j=1:2
           UR2(j)=solution(x(j),y(j));
      end 
 %   plot3(x,y,UR2); 
   title('boundary part')   
  end

  hold off
%真解
%    a=linspace(0,1,100);
%    b=linspace(0,1,100);
%    for i=1:100
%        for j=1:100
%            q=sin(pi*a(i))*sin(pi*b(j));
%            c(i,j)=q;
%        end
%    end
% 
% %    hold on;
% figure
%     surf(a,b,c);
%     hold off;
%     title('the true value');
%            
   
end