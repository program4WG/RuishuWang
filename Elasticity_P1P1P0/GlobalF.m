function GlobalF
   global p t s
   global NT NE
   global F
% function F=GlobalF 
%    p=[0 1 1 0;0 0 1 1];
%    t=[1 2;2 3;4 4;5 3;4 5;1 2];
%    s=[1 2 3 1 2;2 3 4 4 4;1 2 2 1 1;0 0 0 0 2];
%    NE=5;
%    NT=2;

   NF=2*2*NE+2*3*NT;
   F=sparse(NF,1);
   l=zeros(6,1);
   for n=1:NT
       N=t(1:3,n);%�����������
       P=p(1:2,N);%������������
       l=localF(P,N);%�ֲ��նȾ���
       Loc=[3*n-2,3*n-1,3*n,3*n-2+3*NT,3*n-1+3*NT,3*n+3*NT];
       F(Loc)=F(Loc)+l;
      
   end 


end