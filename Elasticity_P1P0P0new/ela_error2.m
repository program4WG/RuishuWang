function [threebar,L2error,L2_boudary_error]=ela_error2
   global p t s
   global uh
   global NT NE
   global A F
   solution1=u;
   NF=2*NE+2*3*NT;
   EH=sparse(NF,1);
   P=zeros(2,3);   
   threebar=0;   
    for i=1:NT
       P=p(1:2,t(1:3,i));
       locationIN1=[[1 2 3]+3*(i-1),[1 2 3]+3*(i-1)+3*NT];
       UH1=uh(locationIN1');
       UR1=zeros(6,1);        
       UR1=Q02(solution1,P);        
       EH(locationIN1')=UR1-UH1;
    end
    
   P2=zeros(2,2);
   for i=1:NE
      P2=p(1:2,s(1:2,i));
      locationBO1=[1,2]+2*(i-1)+6*NT;
      UH3=uh(locationBO1');
      UR3=QB2(solution1,P2);
      EH(locationBO1')=UR3-UH3;
   end
threebar=sqrt(EH'*A*EH);
  

%   %%%%L^2Îó²î
    L2error=0;
for i=1:NT
    P=p(1:2,t(1:3,i));
    locationIN1=[1 2 3]+3*(i-1);
    a=EH(locationIN1');
    TE=eye(3);
    TEM=[1 P(1,1),P(2,1);1 P(1,2) P(2,2);1 P(1,3),P(2,3)];
    for k=1:3
        TEMP1=TEM\TE(:,k);
        fun1=@(x,y)[TEMP1(1)+TEMP1(2)*x+TEMP1(3)*y;0];      
        for l=1:3
            TEMP2=TEM\TE(:,l);
            fun2=@(x,y)[TEMP2(1)+TEMP2(2)*x+TEMP2(3)*y;0];
            L2error=L2error+a(k)*a(l)*inter_2d(fun1,fun2,P);
        end
    end
    
    locationIN2=[1 2 3]+3*(i-1)+3*NT;
    a1=EH(locationIN2');
    for k=1:3
        TEMP1=TEM\TE(:,k);
        fun1=@(x,y)[0;TEMP1(1)+TEMP1(2)*x+TEMP1(3)*y];        
        for l=1:3
            TEMP2=TEM\TE(:,l);
            fun2=@(x,y)[0;TEMP2(1)+TEMP2(2)*x+TEMP2(3)*y];
            L2error=L2error+a1(k)*a1(l)*inter_2d(fun1,fun2,P);
        end
    end
end
L2error=sqrt(L2error);
%%%%%±ß½çÎó²î
L2_boudary_error=0;
for i=1:NE
    P=p(1:2,s(1:2,i));
    locationBO1=[1,2]+2*(i-1)+6*NT;
    rp=[P(2,2)-P(2,1);P(1,1)-P(1,2)];
    L=sqrt(sum((P(:,1)-P(:,2)).^2));
    K=[1 0;...
        0 1]*L;
    L2_boudary_error=L2_boudary_error+EH(locationBO1')'*K*EH(locationBO1')*L;    
end
L2_boudary_error=sqrt(L2_boudary_error);

end